package com.kh.spring.plan.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.plan.model.vo.Planner;
import com.kh.spring.plan.service.PlanService;

@Controller
public class PlanController {

	@Autowired
	private Logger logger;
	@Autowired
	private PlanService service;
	
	@RequestMapping("/goiljung.do")
	public String goiljungpage() {
		return "iljung/iljungpage";
	}
	
	
	@RequestMapping("/iljung.do")
	public ModelAndView iljung(String days, String place, ModelAndView mv) {
		List<Map<String,String>> list = service.placedata(place);
		System.out.println(list);
		mv.addObject("list",list);
		mv.addObject("days", days);
		mv.addObject("place", place);
		mv.setViewName("iljung/iljungdo");
		return mv;
	}
	


	@RequestMapping("/jujang.do")
	public void jujang(String day,String hotspotName,String placeImg, ModelAndView mv) {
		Planner p = new Planner();
		p.setDay(day);
		p.setHotspotName(hotspotName);
		p.setPlaceImg(placeImg);
		System.out.println(p);
	}
}
