package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Override
	public List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("board.selectList",null,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public Map<String, String> selectBoardView(SqlSessionTemplate session, int no) {
		return session.selectOne("board.selectBoardView", no);
	}
	
	
	

}
