package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.BoardComment;
import com.kh.spring.board.model.vo.Day;

public interface BoardService {
	
	List<Board> selectBoard(int cPage, int numPerpage);
	int selectBoardCount();
	List<Board> searchBoard(String keyword, int cPage, int numPerpage);
	int searchBoardCount(String keyword);
	Board selectBoardTitle(Map map);
	List<Day> selectBoardView(Map map);
	List<Day> boardDetail(Map map);
	List<BoardComment> selectBoardComment(Map map);
	int insertBoardComment(Map map);
	List<Board> selectMyBoard(int cPage, int numPerpage, String id);

}
