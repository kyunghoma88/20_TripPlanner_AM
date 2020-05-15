package com.kh.spring.hotSpot.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
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

	@Override
	public List<HotSpot> selectHotSpotList(String area, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectHotSpotList(session,area,cPage,numPerPage);
	}

	
	@Override
	public int selectHotSpotCount() {
		return dao.selectHotSpotCount(session);
	}


	@Override
	public HotSpot selectHotSpotView(String name) {
		// TODO Auto-generated method stub
		return dao.selectHotSpotView(session,name);
	}
	
	

}
