package com.kh.spring.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PlanDao {
	
	List<Map<String,String>> placedata(SqlSessionTemplate session, String place);
	int insertBoard(SqlSessionTemplate session, Map<String,Object> map);
	int insertPlan(SqlSessionTemplate session, Map<String,Object> mapda);
	int searchMember(SqlSessionTemplate session, String member);
	List<Map<String, String>> areadata(SqlSessionTemplate session, String place);
	List<Map<String,Object>> myplanselect(SqlSessionTemplate session, Map<String,Object> map);
	int totaldays(SqlSessionTemplate session, Map<String,Object> map);
	int deletePlan(SqlSessionTemplate session, Map<String,Object> map);
	int deleteBoard(SqlSessionTemplate session, Map<String,Object> map);
	int updateBoard(SqlSessionTemplate session, Map<String,Object> map);
	int updatePlan(SqlSessionTemplate session, Map<String,Object> mapda);
}
