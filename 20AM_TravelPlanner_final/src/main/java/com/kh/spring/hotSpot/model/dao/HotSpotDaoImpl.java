package com.kh.spring.hotSpot.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.hotSpot.model.vo.HotSpot;

@Repository
public class HotSpotDaoImpl implements HotSpotDao {

	@Override
	public List<HotSpot> selectHotSpotList(SqlSessionTemplate session, String area, int cPage,
			int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("hotSpot.selectHotSpotList", area,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	
	@Override
	public int selectHotSpotCount(SqlSessionTemplate session) {
		return session.selectOne("hotSpot.selectHotSpotCount");
	}


	@Override
	public HotSpot selectHotSpotView(SqlSessionTemplate session, String name) {
		// TODO Auto-generated method stub
		return session.selectOne("hotSpot.selectHotSpotView",name);
	}
	
	

}
