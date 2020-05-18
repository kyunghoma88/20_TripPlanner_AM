package com.kh.spring.hotSpot.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.hotSpot.model.dao.HotSpotDao;
import com.kh.spring.hotSpot.model.vo.HotSpot;

@Service
public class HotSpotServiceImpl implements HotSpotService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private HotSpotDao dao;
	
	@Autowired
	private Logger logger;
	
	

	
	 


	@Override
	public List<HotSpot> selectHotSpotList(String area, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		logger.debug(""+area);
		return dao.selectHotSpotList(session,area,cPage,numPerPage);
	}

	
	@Override
	public int selectHotSpotCount(String area) {
		return dao.selectHotSpotCount(session,area);
	}


	@Override
	public HotSpot selectHotSpotView(String name) {
		// TODO Auto-generated method stub
		return dao.selectHotSpotView(session,name);
	}
	
	

}
