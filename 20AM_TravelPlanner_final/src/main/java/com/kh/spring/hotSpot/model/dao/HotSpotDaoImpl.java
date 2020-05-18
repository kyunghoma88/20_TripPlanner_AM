package com.kh.spring.hotSpot.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.hotSpot.model.vo.HotSpot;

@Repository
public class HotSpotDaoImpl implements HotSpotDao {

	
	@Autowired
	private Logger logger;
	
	
	


	@Override
	public List<HotSpot> selectHotSpotList(SqlSessionTemplate session, String area, int cPage,
			int numPerPage) {
		// TODO Auto-generated method stub
		logger.debug(""+session);
		logger.debug(""+area);
		logger.debug(""+cPage);
		logger.debug(""+numPerPage);
		return session.selectList("hotSpot.selectHotSpotList", area,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	
	@Override
	public int selectHotSpotCount(SqlSessionTemplate session,String area) {
		return session.selectOne("hotSpot.selectHotSpotCount",area);
	}


	@Override
	public HotSpot selectHotSpotView(SqlSessionTemplate session, String name) {
		// TODO Auto-generated method stub
		return session.selectOne("hotSpot.selectHotSpotView",name);
	}
	
	

}
