package com.kh.spring.plan.service;

import java.util.List;
import java.util.Map;

public interface PlanService {

	List<Map<String,String>> placedata(String place);
	int insertBoard(Map<String,Object> map);
	int insertPlan(Map<String,Object> mapda);
	int searchMember(String member);
	List<Map<String,String>> areadata(String place);
	List<Map<String,Object>> myplanselect(Map<String,Object> map);
	int totaldays(Map<String,Object> map);
	int deletePlan(Map<String,Object> map);
	int deleteBoard(Map<String,Object> map);
	int updateBoard(Map<String,Object> map);
}
