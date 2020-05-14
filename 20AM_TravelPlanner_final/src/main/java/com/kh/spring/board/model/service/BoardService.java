package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Board;

public interface BoardService {
	
	List<Board> selectBoard(int cPage, int numPerpage);
	int selectBoardCount();
	Map<String, String> selectBoardView(int no);
}
