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
	public int placecount(String place) {
		// TODO Auto-generated method stub
		return dao.placecount(session, place);
	}
	
	@Override
	public int insertBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertBoard(session, map);
	}

	@Override
	public int insertPlan(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.insertPlan(session, map);
	}
	
	
	
}
