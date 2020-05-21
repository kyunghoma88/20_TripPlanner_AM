package com.kh.spring.hotSpot.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.hotSpot.model.vo.HotSpot;

public interface HotSpotService {
	
	List<HotSpot> selectHotSpotList(String area,int cPage,int numPerPage);
	int selectHotSpotCount(String area);
	HotSpot selectHotSpotView(String name);
	
	List<Map<String,String>> hotSpotSearch(String keyword, int cPage, int numPerPage);
	int hotSpotSearchCount(String keyword);

	int updateHotSpotViewCount(String name);
}
