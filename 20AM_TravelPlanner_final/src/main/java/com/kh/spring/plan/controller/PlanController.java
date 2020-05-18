package com.kh.spring.plan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	};
	
	
	@RequestMapping("/iljung.do")
	public ModelAndView iljung(String days, String place, ModelAndView mv) {
		List<Map<String,String>> list = service.placedata(place);
		int placecount = service.placecount(place);
		mv.addObject("placecount",placecount);
		mv.addObject("list",list);
		mv.addObject("days", days);
		mv.addObject("place", place);
		mv.setViewName("iljung/iljungdo");
		return mv;
	};
	


	@RequestMapping("/jujang.do")
	public ModelAndView jujang(@RequestBody List<Map<String,Object>> list,ModelAndView mv) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("place", list.get(0).get("tplace"));
		map.put("area", list.get(0).get("tarea"));
		System.out.println(list.get(0).get("tarea"));
		service.insertBoard(map);
		
		for(int i = 0; i< list.size();i++) { 
				Map<String,Object> map = newHashMap<String,Object>(); 
				map.put("tplace",list.get(i).get("tplace"));
				service.insertPlan(map);
				};
		 
		
		return mv;
	};
};
