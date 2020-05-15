package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Day;

public interface BoardService {
	
	List<Board> selectBoard(int cPage, int numPerpage);
	int selectBoardCount();
	Board selectBoardTitle(Map map);
	List<Day> selectBoardView(Map map);
	List<Day> test(Map map);
}
