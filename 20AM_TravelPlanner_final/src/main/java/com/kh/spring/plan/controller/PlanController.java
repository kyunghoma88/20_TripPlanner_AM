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
	
	@RequestMapping("/shoot.do")
	public ModelAndView shoot(String days, String place,String title,ModelAndView mv) {
		List<Map<String,String>> list = service.placedata(place);
		List<Map<String,String>> wekyungdo = service.areadata(place);
		mv.addObject("list",list);
		mv.addObject("days", days);
		mv.addObject("place", place);
		mv.addObject("title",title);
		mv.addObject("wekyungdo",wekyungdo);
		mv.setViewName("iljung/iljungshoot");
		return mv;
	}
	@RequestMapping("/iljung.do")
	public ModelAndView iljung(String days, String place, ModelAndView mv) {
		List<Map<String,String>> list = service.placedata(place);
		mv.addObject("list",list);
		mv.addObject("days", days);
		mv.addObject("place", place);
		mv.setViewName("iljung/iljungdo");
		return mv;
	};
	


	@RequestMapping("/jujang.do")
	public void jujang(@RequestBody List<Map<String,Object>> list) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("place", list.get(0).get("tplace"));
		map.put("area", list.get(0).get("tarea"));
		map.put("memberId",list.get(0).get("id"));
		map.put("title",list.get(0).get("title"));
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
				mapda.put("comments", list.get(i).get("comment"));
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
	};
	
	@RequestMapping("/iljung/iljungcrystal.do")
	public ModelAndView iljungcrystaldo(ModelAndView mv,String memberId,String tvTitle,int trSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",memberId);
		map.put("tvTitle",tvTitle);
		map.put("trSeq",trSeq);
		List<Map<String,Object>> list = service.myplanselect(map);
		String place = (String) list.get(0).get("HOTSPOT_AREA_NAME");
		List<Map<String,String>> wekyungdo = service.areadata(place);
		List<Map<String,String>> pd = service.placedata(place);
		int result = service.totaldays(map);
		System.out.println(list);
		
		mv.addObject("trSeq",trSeq);
		mv.addObject("result",result);
		mv.addObject("tvTitle",tvTitle);
		mv.addObject("list",list);
		mv.addObject("wekyungdo",wekyungdo);
		mv.addObject("pd",pd);
		mv.setViewName("iljung/iljungcrystal");
		return mv;
	}
	
	@RequestMapping("/update.do")
	public void updatedo(@RequestBody List<Map<String,Object>> list,ModelAndView mv) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",list.get(0).get("id"));
		map.put("trSeq",(int)list.get(0).get("trSeq"));
		map.put("title",list.get(0).get("title"));
		map.put("place",list.get(0).get("tplace"));
		map.put("area",list.get(0).get("tarea"));
		service.deletePlan(map);
		service.deleteBoard(map);
		service.updateBoard(map);
		int fn = list.size();
		int order = 0;
		System.out.println(list.get(0).get("comment"));
		for(int i = 0; i< list.size();i++) { 
				Map<String,Object> mapda = new HashMap<String,Object>();
				mapda.put("place",list.get(i).get("tplace"));
				mapda.put("area",list.get(i).get("tarea"));
				mapda.put("trSeq",(int)list.get(0).get("trSeq"));
				mapda.put("tvDate",list.get(i).get("tday"));
				mapda.put("total",(int)list.get(fn-1).get("tday"));
				mapda.put("memberId", list.get(i).get("id"));
				mapda.put("comments", list.get(i).get("comment"));
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
				service.updatePlan(mapda);
		};
	};
	
	@RequestMapping("/shooting.do")
	public ModelAndView shooting(String days, String place,String title,String memberId,int trSeq,ModelAndView mv) {
		List<Map<String,String>> list = service.placedata(place);
		List<Map<String,String>> wekyungdo = service.areadata(place);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",memberId);
		map.put("trSeq",trSeq);
		int result = service.totaldays(map);
		
		Map<String,Object> mapadubu = new HashMap<String,Object>();
		mapadubu.put("memberId",memberId);
		mapadubu.put("trSeq",trSeq);
		List<Map<String,Object>> lists = service.myplanselect(mapadubu);
		
		
		mv.addObject("lists",lists);
		mv.addObject("trSeq",trSeq);
		mv.addObject("result",result);
		mv.addObject("list",list);
		mv.addObject("days", days);
		mv.addObject("place", place);
		mv.addObject("title",title);
		mv.addObject("wekyungdo",wekyungdo);
		mv.setViewName("iljung/iljungshooting");
		return mv;
	}
	
	@RequestMapping("/delete.do")
	public void deletedo(String memberId, String tvTitle, int trSeq) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",memberId);
		map.put("trSeq",trSeq);
		service.deletePlan(map);
		service.deleteBoard(map);
	}
};
