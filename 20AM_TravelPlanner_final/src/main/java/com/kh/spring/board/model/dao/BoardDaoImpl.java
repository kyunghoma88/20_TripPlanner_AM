package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.BoardComment;
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
	public int searchBoardCount(SqlSessionTemplate session, String keyword) {
		return session.selectOne("board.searchBoardCount", keyword);
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

	@Override
	public List<BoardComment> selectBoardComment(SqlSessionTemplate session, Map map) {
		return session.selectList("board.selectBoardComment", map);
	}

	@Override
	public int insertBoardComment(SqlSessionTemplate session, Map map) {
		return session.insert("board.insertBoardComment", map);
	}

	@Override
	public List<Board> selectMyBoard(SqlSessionTemplate session, int cPage, int numPerpage, String id) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectMyList",id,new RowBounds((cPage - 1) * numPerpage, numPerpage));
	}
	
	@Override
	public String selectLikeCheck(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectLikeCheck",idNo);
	}

	@Override
	public int insertLikeCheck(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.insert("board.insertLikeCheck",idNo);
	}

	@Override
	public int selectLikeCount(SqlSessionTemplate session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectLikeCount",no);
	}

	@Override
	public int updateLikeUp(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.update("board.updateLikeUp",idNo);
	}

	@Override
	public int updateTotalLikeUp(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.update("board.updateTotalLikeUp",idNo);
	}

	@Override
	public int updateLikeDown(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.update("board.updateLikeDown",idNo);
	}

	@Override
	public int updateTotalLikeDown(SqlSessionTemplate session, Map idNo) {
		// TODO Auto-generated method stub
		return session.delete("board.updateTotalLikeDown",idNo);
	}
	

	
	

}
