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
		map.put("memberId",list.get(0).get("id"));
		service.insertBoard(map);
		String member = (String)list.get(0).get("id");
		int seq = service.searchMember(member);
		int fn = list.size();
		int order = 0;
		for(int i = 0; i< list.size();i++) { 
				Map<String,Object> mapda = new HashMap<String,Object>(); 
				mapda.put("place",list.get(i).get("tplace"));
				mapda.put("area",list.get(i).get("tarea"));
				mapda.put("trSeq",seq);
				mapda.put("tvDate",list.get(i).get("tday"));
				mapda.put("total",(int)list.get(fn-1).get("tday"));
				mapda.put("memberId", list.get(i).get("id"));
				if(i>0) {
					if(list.get(i-1).get("tday") == list.get(i).get("tday")) {
						order++;
						mapda.put("dayo",order);
					}else{
						order = 0;
						mapda.put("dayo",order);
					};
				}else {
					mapda.put("dayo",order);
				};
				service.insertPlan(mapda);
		};
		return mv;
	};
};
