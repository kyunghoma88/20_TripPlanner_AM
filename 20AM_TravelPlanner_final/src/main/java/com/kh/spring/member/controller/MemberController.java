package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private JavaMailSender mailSender;
	@Autowired
	private BoardService boardService;
	
	
	
	@RequestMapping("/member/memberEnroll.do")
	public String enroll(Member m, Model model) {
		m.setPassword(pwEncoder.encode(m.getPassword()));
		Member loginMember = service.selectMember(m);
		//if(loginMember.getMemberId())
		int result = service.insertMember(m);
		
		String msg = result>0?"회원가입 성공! 환영합니다! ":"회원가입에 실패했습니다.";
		String loc = result>0?"":"";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "common/msg";
	}
	
	@RequestMapping("/member/checkId.do")
	public @ResponseBody Map<String,Object> checkId(@RequestParam String memberId) {
		boolean flag = false;
		Member m = service.checkId(memberId);
		if(m != null) {
			flag = true;
		}
		Map<String,Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("flag", flag);
		return map;
	}
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(Member m, Model model) {
		
			Member loginMember = service.selectMember(m);
			
			String msg = "";
			String loc = "/";
			
			if(loginMember!=null && !loginMember.getStatus().equals("F")  ) {
				
				if(pwEncoder.matches(m.getPassword(), loginMember.getPassword())) {
					//msg = "로그인 성공!";
					
					model.addAttribute("loginMember", loginMember);
					
					
				} else {
					
					msg = "비밀번호가 일치하지 않습니다.";
				}
			} else {
				
				msg = "등록되지 않은 아이디입니다.";
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
	public String preMyPage() {
		return "member/preMyPage";
	}
	
	/*public ModelAndView preMyPage(@RequestParam(required = false, defaultValue = "1") int cPage, 
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
		
		
		
	}*/
	
	
	
	
	
	
	
	
	
	
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
		if(result != null) {
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
//			mv.addObject("loginMember",service.selectMember(result));
			msg = "정상적으로 수정되었습니다.";
			loc = "/member/preMyPage";
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
	
	@RequestMapping("/member/lookPw.do")
	public ModelAndView lookPw(ModelAndView mv, HttpServletRequest request,
								@RequestParam Map<String,String> param,
								String memberId, String memberName, String email) {
		
		System.out.println(param);
		
		HttpSession session = request.getSession();
		session.setAttribute("memberId", memberId);
		
//		mv.addObject("memberId", memberId);
		
		String msg = "";
		String loc = "";
		
		Member m = service.lookPw(param);
		
		System.out.println("서비스 수행완료");
		String host = "https://rclass.iptime.org/20AM_TravelPlanner_final";
//		String host = "localhost:9090/spring";
		String setFrom = "studysemiproject@gmail.com";
		String toMail = request.getParameter("email");
		String title = "비밀번호 변경을 위한 이메일 입니다.";
		String content = "링크에 접속하여 비밀번호를 변경 해주세요." + "<a href =" + host + "/lookPwEnd"
				+ ">비밀번호 변경하기</a>";
		
		
		
		if(m != null && (m.getMemberId().equals(memberId) && m.getMemberName().equals(memberName)) && m.getEmail().equals(email)) {
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				messageHelper.setFrom(setFrom); // 보내는 사람 이메일
				messageHelper.setTo(toMail); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일 제목
//				messageHelper.setText(content); //메일 내용
				messageHelper.setText(content, true);
				
				mailSender.send(message);
				
				msg = "인증성공. 이메일을 확인해 주세요";
				loc = "/index.jsp";
				
				mv.addObject("msg", msg);
				mv.addObject("loc", loc);
				mv.setViewName("common/msg");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			msg = "인증실패. 입력 값이 옳바르지 않습니다.";
			loc = "/index.jsp";
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/lookPwEnd")
	public ModelAndView lookPwEnd(ModelAndView mv) {
		
		mv.setViewName("member/lookPwEnd");
		return mv;
	}
	
	
	@RequestMapping("/member/lookPwUpdate")
	public ModelAndView lookPwUpdate(ModelAndView mv, @RequestParam Map<String,String> param, String memberId) {
		
		System.out.println("비밀번호변경 파라미터 : " + param);
		param.put("password", pwEncoder.encode(param.get("password")));
		int result = service.lookPwUpdate(param);
		
		String msg = "";
		String loc = "";
		if(result > 0) {
			msg = "비밀번호 변경 완료";
			loc = "/index.jsp";
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
		}
		return mv;
	}
	
	@RequestMapping("/member/membership.do")
	public ModelAndView membership() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/membership");
		return mv;
	}
	
	
	
	
	
	/////////////// 회원 탈퇴 로직  ////////////////////////
	@RequestMapping("/member/signOut")
	public String signOut() {
		
		return "member/signOut";
		
	}
	
	
	@RequestMapping("/member/signOutEnd.do")
	public ModelAndView memberSignOut(String memberId, String password, String memberName, String email, String phone, String address, String postCode, String addressDetail, HttpSession session, SessionStatus status)
	{
		ModelAndView mv = new ModelAndView();

		//Member m = new Member(memberId, pwEncoder.encode(password),memberName, phone, email, "", "", position, location, null, "","","",0);
		
		Member m = new Member();
		m.setMemberId(memberId);
		Member result = service.selectMember(m);
		
		logger.info("탈퇴 화면 member m : " + m);
		logger.info("탈퇴 화면 result : " + result);
		
		

		String msg = "";
		String loc = "/";
		
		
		if(pwEncoder.matches(password, result.getPassword())) {
			int signOutResult = service.memberSignOut(result);
			if(signOutResult>0 && !status.isComplete()) {
				session.setAttribute("loginMember", service.selectMember(result));
				msg = "탈퇴 처리되었습니다.";
				
				status.setComplete();
			}else {
				msg = "";
			}
		}
		else
		{
			msg = "패스워드가 일치하지 않습니다.";
			loc = "/member/preMyPage";
			
		}
	
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");


		return mv;
		
	}
	
	///////////////////////  내 일정 보기 /////////////////////////////////
	@RequestMapping("/member/myPlan")
	public ModelAndView boardList(@RequestParam(required = false, defaultValue = "1") int cPage, 
			@RequestParam(required = false, defaultValue = "6") int numPerpage,
			ModelAndView mv, String id) {

		//List<Board> list = boardService.selectBoard(cPage,numPerpage);
		int totalCount = boardService.selectBoardCount();
		
		List<Board> list = boardService.selectMyBoard(cPage,numPerpage,id);
		
		
		mv.addObject("list",list);
		//mv.addObject("count",totalCount);
		//mv.addObject("pageBar",PageFactory.getPage(totalCount,cPage,numPerpage,"/spring/board/boardList.do"));
		//mv.setViewName("board/boardList");
		return mv;
	}
	/*public String myPlan() {
		return "member/myTravelPlan";
	}*/
	
	
	
	

}
