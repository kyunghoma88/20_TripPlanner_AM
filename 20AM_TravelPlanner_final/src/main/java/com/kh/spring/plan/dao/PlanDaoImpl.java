package com.kh.spring.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PlanDaoImpl implements PlanDao {

	@Override
	public List<Map<String, String>> placedata(SqlSessionTemplate session,String place) {
		// TODO Auto-generated method stub
		return session.selectList("plan.placeList",place);
	}

	
}
