package com.kh.spring.hotSpot.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.PageFactory;
import com.kh.spring.hotSpot.model.service.HotSpotService;
import com.kh.spring.hotSpot.model.vo.HotSpot;

@Controller
public class HotSpotController {
	
	@Autowired
	private HotSpotService service;
	
	@Autowired
	private Logger logger;
	
	
	
//	 @RequestMapping("/hotSpot/hotSpot.do") public ModelAndView hotSpotMain(ModelAndView mv) {
//	 mv.setViewName("hotSpot/hotSpotMain");
//	 return mv; 
//	 }
	 
	@RequestMapping("/hotSpot/hotSpotList.do")
	public ModelAndView hotSpotList(@RequestParam(required=false,defaultValue="1") int cPage, @RequestParam(required=false,defaultValue="3") int numPerPage,@RequestParam("area") String area,ModelAndView mv) {	
		List<HotSpot> list=service.selectHotSpotList(area,cPage,numPerPage);
		int totalCount=service.selectHotSpotCount(area);
		mv.addObject("list",list);
		mv.addObject("count",totalCount);
		mv.addObject("pageBar",PageFactory.getPage(totalCount, cPage, numPerPage, "/spring/hotSpot/hotSpotList"));
		mv.setViewName("hotSpot/hotSpotMain");
		return mv;
	}
	
	@RequestMapping("/hotSpot/hotSpotView.do")
	public ModelAndView hotSpotView(String name,ModelAndView mv) {
		HotSpot h=service.selectHotSpotView(name);
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
