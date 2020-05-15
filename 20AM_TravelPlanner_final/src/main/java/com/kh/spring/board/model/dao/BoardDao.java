package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Day;

public interface BoardDao {
	
	List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectBoardCount(SqlSessionTemplate session);
	Board selectBoardTitle(SqlSessionTemplate session, Map map);
	List<Day> selectBoardView(SqlSessionTemplate session, Map map);
}
