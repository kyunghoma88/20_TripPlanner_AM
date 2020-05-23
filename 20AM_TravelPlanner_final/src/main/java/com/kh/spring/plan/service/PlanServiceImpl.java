package com.kh.spring.plan.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.plan.dao.PlanDao;
@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private Logger logger;
	@Autowired
	private PlanDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> placedata(String place) {
		// TODO Auto-generated method stub
		logger.debug("헤이 껌히얼");
		logger.debug(""+place);
		return dao.placedata(session, place);
	}

	@Override
	public int insertBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertBoard(session, map);
	}

	@Override
	public int insertPlan(Map<String,Object> mapda) {
		// TODO Auto-generated method stub
		return dao.insertPlan(session, mapda);
	}

	@Override
	public int searchMember(String member) {
		// TODO Auto-generated method stub
		return dao.searchMember(session, member);
	}

	@Override
	public List<Map<String, String>> areadata(String place) {
		// TODO Auto-generated method stub
		return dao.areadata(session, place);
	}

	@Override
	public List<Map<String, Object>> myplanselect(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myplanselect(session, map);
	}

	@Override
	public int totaldays(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totaldays(session, map);
	}


	@Override
	public int deletePlan(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deletePlan(session,map);
	}
	
	
	
	
	
	
	
	
	
}
