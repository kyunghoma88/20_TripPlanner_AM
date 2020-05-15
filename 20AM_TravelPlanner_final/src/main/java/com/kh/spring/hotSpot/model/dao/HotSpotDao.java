package com.kh.spring.hotSpot.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.hotSpot.model.vo.HotSpot;

public interface HotSpotDao {
	
	List<HotSpot> selectHotSpotList(SqlSessionTemplate session,String area,int cPage,int numPerPage);
	int selectHotSpotCount(SqlSessionTemplate session);
	HotSpot selectHotSpotView(SqlSessionTemplate session,String name);

}
