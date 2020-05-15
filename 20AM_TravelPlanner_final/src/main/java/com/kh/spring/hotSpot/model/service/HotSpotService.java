package com.kh.spring.hotSpot.model.service;

import java.util.List;

import com.kh.spring.hotSpot.model.vo.HotSpot;

public interface HotSpotService {
	
	List<HotSpot> selectHotSpotList(String area,int cPage,int numPerPage);
	int selectHotSpotCount();
	HotSpot selectHotSpotView(String name);

}
