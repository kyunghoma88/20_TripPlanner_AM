package com.kh.spring.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.PageFactory;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller
@SessionAttributes(value= {"loginMember"})
public class MemberController {
	
	
	@Autowired
	private Logger logger;
	
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/member/memberEnroll.do")
	public String enroll(Member m, Model model) {
		m.setPassword(pwEncoder.encode(m.getPassword()));
		
		int result = service.insertMember(m);
		
		String msg = result>0?"회원가입 성공! 환영합니다! ":"회원가입에 실패했습니다.";
		String loc = result>0?"":"";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "common/msg";
	}
	
	
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(Member m, Model model) {
		
			Member loginMember = service.selectMember(m);
			
			String msg = "";
			String loc = "/";
			
			if(loginMember!=null) {
				
				if(pwEncoder.matches(m.getPassword(), loginMember.getPassword())) {
					msg = "로그인 성공!";
					
					model.addAttribute("loginMember", loginMember);
					
					
				} else {
					
					msg = "비밀번호가 일치하지 않습니다.";
				}
			} else {
				
				msg = "로그인 실패! 아이디를 확인하세요!";
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			
			return "common/msg";
			
			
		}
	
	
	
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus status) {
		
		if(!status.isComplete()) {
			
			status.setComplete();
			
		}
		
		return "redirect:/";
		
	}
	
	
	////////  myPage  //////////
	
	// 05 19 내 페이지 보기 및 회원정보 수정 넘어가는 페이지
	@RequestMapping("/member/preMyPage")
	public ModelAndView preMyPage(@RequestParam(required = false, defaultValue = "1") int cPage, 
			@RequestParam(required = false, defaultValue = "6") int numPerpage,
			ModelAndView mv) {
		//return "member/preMyPage";
		List<Board> list = boardService.selectBoard(cPage,numPerpage);
		int totalCount = boardService.selectBoardCount();

		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.addObject("pageBar",PageFactory.getPage(totalCount,cPage,numPerpage,"/spring/board/boardList.do"));
		mv.setViewName("member/preMyPage");
		return mv;
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	// 비번 확인
	@RequestMapping("/member/myPageCheck.do")
	public String mypageCheck()
	{
		return "member/memberCheck";
	}
	
	@RequestMapping("/member/mypage.do")
	public ModelAndView mypage(String memberId, String password)
	{
		ModelAndView mv = new ModelAndView();
		logger.info("마이페이지 아이디 : " + memberId);
		logger.info("마이페이지 비번 : " + password);
		Member m = new Member();
		m.setMemberId(memberId);
		m.setPassword(password);
		Member result = service.selectMember(m);
		logger.info("마이페이지 변경 후 비번 : " + m.getPassword());
		logger.info(result+"");
		String msg="";
		String loc="/";
		if(result != null)
		{
			if(pwEncoder.matches(m.getPassword(), result.getPassword()))
			{
				mv.setViewName("member/myPage");
				return mv;
			}
			else
			{
				msg = "패스워드가 일치하지 않습니다.";
				loc = "/member/myPageCheck.do";
			}
		}
		else
		{
			msg = "존재하지 않는 아이디입니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	} 
	
	
	////////  회원정보 수정  /////////
	@RequestMapping("/member/memberUpdateEnd.do")
	public ModelAndView memberUpdate(String memberId, String password, String memberName, String email, String phone, String address, String postCode, String addressDetail, HttpSession session)
	{
		ModelAndView mv = new ModelAndView();

		//Member m = new Member(memberId, pwEncoder.encode(password),memberName, phone, email, "", "", position, location, null, "","","",0);
		
		Member m = new Member();
		m.setMemberId(memberId);
		Member result = service.selectMember(m);
		
		//logger.info("update시 id로 회원조회결과 : "+ result);
		
		//비밀번호가 넘어온 경우 암호화처리해서 set.
		
		if(password!=null && !password.equals("")) 
		{
			result.setPassword(pwEncoder.encode(password));
		}
		result.setMemberName(memberName);
		result.setEmail(email);
		result.setPhone(phone);
		result.setAddress(address);
		result.setPostCode(postCode);
		result.setAddressDetail(addressDetail);
		
		int updateResult = service.updateMember(result);
		

		String msg = "";
		String loc = "/";
		if(updateResult>0)
		{
			session.setAttribute("loginMember", service.selectMember(result));
			msg = "정상적으로 수정되었습니다.";
		}
		else
		{
			msg = "정보 수정이 실패했습니다.";
		}
	
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");


		return mv;
		
	}
	
	@RequestMapping("/member/payComplete")
	public ModelAndView payComplete(ModelAndView mv, String userId) {
		//결제 완료 후 Member의 STATUS -> 'Y'로 업데이트
		
		int result = service.payComplete(userId);
		
		return mv;
	}
	
	
	
	
	
	

}
