package com.kh.spring.hotSpot.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.hotSpot.model.vo.HotSpot;

public interface HotSpotService {
	
	List<HotSpot> selectHotSpotList(String area,int cPage,int numPerPage);
	int selectHotSpotCount(String area);
	HotSpot selectHotSpotView(String name);
	
	List<Map<String,String>> hotSpotSearch(String area, int cPage, int numPerPage);
	int hotSpotSearchCount(String area);

	int updateHotSpotViewCount(String name);
}
