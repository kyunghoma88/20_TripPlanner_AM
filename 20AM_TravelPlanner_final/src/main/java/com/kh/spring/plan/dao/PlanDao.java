package com.kh.spring.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface PlanDao {
	
	List<Map<String,String>> placedata(SqlSessionTemplate session, String place);
}
