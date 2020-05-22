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
	public int searchBoardCount() {
		return dao.searchBoardCount(session);
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

	
	
	
	
	
	
	
}
