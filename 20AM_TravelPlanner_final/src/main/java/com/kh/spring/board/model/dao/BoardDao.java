package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.board.model.vo.Board;

public interface BoardDao {
	
	List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectBoardCount(SqlSessionTemplate session);
	Map<String, String> selectBoardView(SqlSessionTemplate session, int no);
}
