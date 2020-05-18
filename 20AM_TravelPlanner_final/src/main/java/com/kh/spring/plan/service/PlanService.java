package com.kh.spring.plan.service;

import java.util.List;
import java.util.Map;

public interface PlanService {

	List<Map<String,String>> placedata(String place);
	int placecount(String place);
	int insertBoard(Map<String,Object> map);
	int insertPlan(Map<String,Object> map);
}
