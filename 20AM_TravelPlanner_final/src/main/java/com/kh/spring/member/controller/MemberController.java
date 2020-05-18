package com.kh.spring.member.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	
	
	
	
	/*@RequestMapping("/member/memberEnroll.do")
	public String enroll() {
		return "member/enroll";
	}*/
	
	@RequestMapping("/member/memberEnroll.do")
	public String enroll(Member m, Model model) {
		m.setPassword(pwEncoder.encode(m.getPassword()));
		
		m.setAddress(m.getAddress1()+" "+m.getAddress2());
		// form 태그 안의 태그의 name값이 vo의 변수명과 일치하면 위처럼 가져올수 있다.
		
		int result = service.insertMember(m);
		
		String msg = result>0?"회원가입 성공! 환영합니다! ":"회원가입에 실패했습니다.";
		String loc = result>0?"":"";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "common/msg";
	}
	
	
	/*@RequestMapping("/member/memberEnrollEnd.do")
	public String enrollEnd(Member m, Model model) {
		
		m.setPassword(pwEncoder.encode(m.getPassword()));
		
		int result = service.insertMember(m);
		
		String msg = result>0?"환영합니다!":"회원가입에 실패했습니다.";
		String loc = result>0?"":"member/memberEnroll.do";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		return "common/msg";
	}*/
	
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(Member m, Model model) {
		
		
		
		
//			logger.debug(""+m);
			
			Member loginMember = service.selectMember(m);
			
//			logger.debug("DB : " + loginMember.getPassword());
//			logger.debug("param : " + pwEncoder.encode(m.getPassword()));
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
	//public String logout(HttpSession session) {
	// 세션 객체 이용하는게 아님!
	
	public String logout(SessionStatus status) {
		// HttpSession 객체로 로그아웃 처리하기!
		
		/*System.out.println("여기오니?");*/
		//session.invalidate();
//		logger.debug("여기오니?");
		
		
		if(!status.isComplete()) {
			// true가 나오면 complete된거니까 세션 만료됐니? 즉, 로그아웃
			// false는 로그인상태, 세션 살아있는 상태
			// 이 경우는 ! 니까 살아있으면   이겠지
			status.setComplete();
			// 세션을 종료시킴!
		}
		
		return "redirect:/";
		
		
	}
	
	

}
