package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.BoardComment;
import com.kh.spring.board.model.vo.Day;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private BoardDao dao;

	@Override
	public List<Board> selectBoard(int cPage, int numPerpage) {
		return dao.selectList(session, cPage, numPerpage);
	}
	
	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}
	

	@Override
	public List<Board> searchBoard(String keyword, int cPage, int numPerpage) {
		return dao.searchBoard(session, keyword, cPage, numPerpage);
	}

	@Override
	public int searchBoardCount(String keyword) {
		return dao.searchBoardCount(session, keyword);
	}

	
	@Override
	public Board selectBoardTitle(Map map) {
		return dao.selectBoardTitle(session, map);
	}

	@Override
	public List<Day> selectBoardView(Map map) {
		return dao.selectBoardView(session, map);
	}

	@Override
	public List<Day> boardDetail(Map map) {
		return dao.boardDetail(session, map);
	}

	@Override
	public List<BoardComment> selectBoardComment(Map map) {
		return dao.selectBoardComment(session, map);
	}

	@Override
	public int insertBoardComment(Map map) {
		return dao.insertBoardComment(session, map);
	}

	@Override
	public List<Board> selectMyBoard(int cPage, int numPerpage, String id) {
		// TODO Auto-generated method stub
		return dao.selectMyBoard(session, cPage, numPerpage, id);
	}
	
	@Override
	public String selectLikeCheck(Map idNo) {
		// TODO Auto-generated method stub
		return dao.selectLikeCheck(session,idNo);
	}

	@Override
	public int insertLikeCheck(Map idNo) {
		// TODO Auto-generated method stub
		return dao.insertLikeCheck(session,idNo);
	}

	@Override
	public int selectLikeCount(int no) {
		// TODO Auto-generated method stub
		return dao.selectLikeCount(session,no);
	}

	@Override
	public int updateLikeUp(Map idNo) {
		// TODO Auto-generated method stub
		return dao.updateLikeUp(session,idNo);
	}

	@Override
	public int updateTotalLikeUp(Map idNo) {
		// TODO Auto-generated method stub
		return dao.updateTotalLikeUp(session,idNo);
	}

	@Override
	public int updateLikeDown(Map idNo) {
		// TODO Auto-generated method stub
		return dao.updateLikeDown(session,idNo);
	}

	@Override
	public int updateTotalLikeDown(Map idNo) {
		// TODO Auto-generated method stub
		return dao.updateTotalLikeDown(session,idNo);
	}

	
	
	
	
	
	
	
	
}
