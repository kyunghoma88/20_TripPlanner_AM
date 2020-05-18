package com.kh.spring.faq.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageFactory;
import com.kh.spring.common.PageFactory2;
import com.kh.spring.faq.model.service.FaqService;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@RequestMapping("/faq/faqList")
	public ModelAndView faqList(ModelAndView mv,
								@RequestParam(required = false, defaultValue = "1") int cPage,
								@RequestParam(required = false, defaultValue = "5") int numPerpage) {
		
//		List<Faq> list = service.selectFaq();
//		
//		System.out.println(list);
//		mv.addObject("list", list);
//		mv.setViewName("faq/faqList");
//		return mv;
		List<Map<String,String>> list = service.selectFaq(cPage, numPerpage);
		int totalCount = service.selectFaqCount();
		
		mv.addObject("list",list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar", PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/faq/faqList"));
		mv.setViewName("faq/faqList");
		return mv;
	}
	
	@RequestMapping("/faq/searchFaq")
	public ModelAndView searchFaq(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "5") int numPerpage) {
		
		String param = request.getParameter("keyword");
		System.out.println(param);
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		System.out.println(cPage);
		List<Map<String,String>> list = service.searchFaq(param, cPage, numPerpage);
		int totalCount = service.selectSearchFaqCount(param);
//		int totalCount = service.selectFaqCount();
		
		System.out.println(list);
		mv.addObject("list",list);
		mv.addObject("count", totalCount);
		mv.addObject("param", param);
		mv.addObject("pageBar", PageFactory2.getPage(totalCount, cPage, numPerpage, "/spring/faq/searchFaq"));
		mv.setViewName("faq/searchFaqList");
		return mv;
	}
	
	@RequestMapping("faq/faqWrite")
	public ModelAndView faqWrite(ModelAndView mv) {
		
		mv.setViewName("faq/faqWrite");
		return mv;
	}
	
	@RequestMapping("/faq/faqWriteEnd")
	public ModelAndView faqWriteEnd(ModelAndView mv, @RequestParam Map<String,String> param) {
		
		System.out.println(param);
		
		int result = 0;
		result = service.insertFaq(param);
		
		String loc = "";
		String msg = "";
		if(result > 0) {
			msg = "게시물 등록 완료";
			loc = "/faq/faqList";
		}else {
			msg = "게시물 등록 실패";
			loc = "/faq/faqWrite";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		
		return mv;
	}
	
	@RequestMapping("faq/infoFaq")
	public ModelAndView infoFaq(ModelAndView mv,
								@RequestParam(required = false, defaultValue = "1") int cPage,
								@RequestParam(required = false, defaultValue = "5") int numPerpage,
								HttpServletRequest request) {
		
		String info = "이용안내";
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		List<Map<String,String>> list = service.infoFaq(info, cPage, numPerpage);
		int totalCount = service.infoFaqCount(info);
		
		mv.addObject("list",list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar", PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/faq/infoFaq"));
		mv.setViewName("faq/faqList");
		return mv;
	}
	
	@RequestMapping("/faq/memberFaq")
	public ModelAndView memberFaq(ModelAndView mv,
									@RequestParam(required = false, defaultValue = "1") int cPage,
									@RequestParam(required = false, defaultValue = "5") int numPerpage,
									HttpServletRequest request)	{
		
		String member = "회원관리";
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		List<Map<String,String>> list = service.memberFaq(member, cPage, numPerpage);
		int totalCount = service.memberFaqCount(member);
		
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar", PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/faq/memberFaq"));
		mv.setViewName("/faq/faqList");
		
		return mv;
	}
	@RequestMapping("/faq/cashFaq")
	public ModelAndView cashFaq(ModelAndView mv,
									@RequestParam(required = false, defaultValue = "1") int cPage,
									@RequestParam(required = false, defaultValue = "5") int numPerpage,
									HttpServletRequest request) {
		
		String cash = "결제";
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		List<Map<String,String>> list = service.cashFaq(cash, cPage, numPerpage);
		int totalCount = service.cashFaqCount(cash);
		
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar", PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/faq/cashFaq"));
		mv.setViewName("/faq/faqList");
		
		return mv;
	}
	
	@RequestMapping("/faq/editFaq")
	public ModelAndView editFaqView(ModelAndView mv, int faqNo) {

		List<Map<String,String>> f = service.editFaqView(faqNo);
	
		mv.addObject("faq", f);
		mv.setViewName("/faq/editFaqView");
		return mv;		
	}
	
	@RequestMapping("/faq/updateFaq")
	public ModelAndView updateFaq(ModelAndView mv, @RequestParam Map<String,String> param) {
		
		System.out.println(param);
		int result = service.updateFaq(param);
		
		String loc = "";
		String msg = "";
		if(result > 0) {
			msg = "게시물 수정 완료";
			loc = "/faq/faqList";
		}else {
			msg = "게시물 수정 실패";
			loc = "/faq/editFaqView";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/faq/deleteFaq")
	public ModelAndView deleteFaq(ModelAndView mv, int faqNo) {
		
		System.out.println(faqNo);
		int result = service.deleteFaq(faqNo);
		String loc = "";
		String msg = "";
		if(result > 0) {
			msg = "게시물 삭제 완료";
			loc = "/faq/faqList";
		}else {
			msg = "게시물 삭제 실패";
			loc = "/faq/editFaqView";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
	
	
	
	
	
	
}
