package com.kh.spring.hotSpot.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.hotSpot.model.vo.HotSpot;

public interface HotSpotDao {
	
	List<HotSpot> selectHotSpotList(SqlSessionTemplate session,String area,int cPage,int numPerPage);
	int selectHotSpotCount(SqlSessionTemplate session,String area);
	HotSpot selectHotSpotView(SqlSessionTemplate session,String name);
	
	List<Map<String,String>> hotSpotSearch(SqlSessionTemplate session, String keyword, int cPage, int numPerpage);
	int hotSpotSearchCount(SqlSessionTemplate session, String keyword);
}
