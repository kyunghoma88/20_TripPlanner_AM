package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Day;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Override
	public List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerpage) {
		return session.selectList("board.selectList",null,new RowBounds((cPage - 1) * numPerpage, numPerpage));
	}

	@Override
	public int selectBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.selectBoardCount");
	}

	@Override
	public List<Board> searchBoard(SqlSessionTemplate session, String keyword, int cPage, int numPerpage) {
		return session.selectList("board.searchBoard", keyword, new RowBounds((cPage - 1) * numPerpage, numPerpage));
	}

	@Override
	public int searchBoardCount(SqlSessionTemplate session) {
		return session.selectOne("board.searchBoardCount");
	}

	@Override
	public Board selectBoardTitle(SqlSessionTemplate session, Map map) {
		return session.selectOne("board.selectBoardTitle", map);
	}

	@Override
	public List<Day> selectBoardView(SqlSessionTemplate session, Map map) {
		return session.selectList("board.selectBoardView", map);
	}

	@Override
	public List<Day> boardDetail(SqlSessionTemplate session, Map map) {
		return session.selectList("board.boardDetail", map);
	}
	
	
	

}
