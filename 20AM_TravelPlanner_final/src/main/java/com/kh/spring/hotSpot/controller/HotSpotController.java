package com.kh.spring.hotSpot.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageFactory;
import com.kh.spring.hotSpot.model.service.HotSpotService;
import com.kh.spring.hotSpot.model.vo.HotSpot;
import com.kh.spring.member.model.service.MemberService;

@Controller
public class HotSpotController {
	
	@Autowired
	private HotSpotService service;
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private MemberService serviceMember;
	
	
	
//	 @RequestMapping("/hotSpot/hotSpot.do") public ModelAndView hotSpotMain(ModelAndView mv) {
//	 mv.setViewName("hotSpot/hotSpotMain");
//	 return mv; 
//	 }
	 
	@RequestMapping("/hotSpot/hotSpotList.do")
	public ModelAndView hotSpotList(@RequestParam(required=false,defaultValue="1") int cPage, @RequestParam(required=false,defaultValue="3") int numPerPage,@RequestParam("area") String area,ModelAndView mv) {	
		List<HotSpot> list=service.selectHotSpotList(area,cPage,numPerPage);
		int totalCount=service.selectHotSpotCount(area);
		
		String pageBar="";
		
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		int totalPage=(int)Math.ceil((double)totalCount/numPerPage);
		
		
		pageBar+="<ul class='pagination "
				+ "justify-content-center pagination-sm'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar+="</li>";
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='javascript:fn_paging("+pageNo+")'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		pageBar+="<script>";
		pageBar+="function fn_paging(cPage){";
		pageBar+="location.href='/spring/hotSpot/hotSpotList.do?cPage='+cPage+'&area="+area;
		pageBar+="'}";
		pageBar+="</script>";
		
		
		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.addObject("pageBar",pageBar);
		mv.setViewName("hotSpot/hotSpotMain");
		return mv;
	}
	
	@RequestMapping("/hotSpot/hotSpotView.do")
	public ModelAndView hotSpotView(String name,ModelAndView mv,HttpSession session, HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		HotSpot h=service.selectHotSpotView(name);
		
		Cookie[] cookies = request.getCookies();
		String cookieVal="";
		boolean hasRead = false;
		if(cookies != null) {
			for(Cookie c : cookies) {
				String names = c.getName();
				String value = c.getValue();
				if("hotSpot".equals(names)) {
					cookieVal = value;
					if(value.contains("|"+name+"|")) {
						hasRead = true;
						break;
					}
				}
			}
		}
		
		if(!hasRead) {
			Cookie c = new Cookie("hotSpot",cookieVal+"|"+name+"|");
			c.setMaxAge(-1);
			service.updateHotSpotViewCount(name);
			response.addCookie(c);
		}
		
		
		
		mv.addObject("hotSpot",h);
		mv.setViewName("hotSpot/hotSpotView");
		return mv;
	}
	
	//메인화면 HotSpot검색
	@RequestMapping("/hotSpot/hotSpotSearch")
	public ModelAndView hotSpotSearch(String keyword, ModelAndView mv,
			@RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "3") int numPerpage) {
		
		List<Map<String,String>> list = service.hotSpotSearch(keyword, cPage, numPerpage);
		int totalCount = service.hotSpotSearchCount(keyword);
		
		mv.addObject("list", list);
		mv.addObject("count", totalCount);
		mv.addObject("pageBar",PageFactory.getPage(totalCount, cPage, numPerpage, "/spring/hotSpot/hotSpotSearch"));
		mv.setViewName("hotSpot/hotSpotSearch");
		
		return mv;
	}
	

}
