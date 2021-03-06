package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.BoardComment;
import com.kh.spring.board.model.vo.Day;

public interface BoardDao {
	
	List<Board> selectList(SqlSessionTemplate session, int cPage, int numPerpage);
	int selectBoardCount(SqlSessionTemplate session);
	List<Board> searchBoard(SqlSessionTemplate session, String keyword, int cPage, int numPerpage);
	int searchBoardCount(SqlSessionTemplate session, String keyword);
	Board selectBoardTitle(SqlSessionTemplate session, Map map);
	List<Day> selectBoardView(SqlSessionTemplate session, Map map);
	List<Day> boardDetail(SqlSessionTemplate session, Map map);
	List<BoardComment> selectBoardComment(SqlSessionTemplate session, Map map);
	int insertBoardComment(SqlSessionTemplate session, Map map);
	List<Board> selectMyBoard(SqlSessionTemplate session, int cPage, int numPerpage, String id);
	
	String selectLikeCheck(SqlSessionTemplate session,Map idNo);
	int insertLikeCheck(SqlSessionTemplate session,Map idNo);
	int selectLikeCount(SqlSessionTemplate session,int no);
	int updateLikeUp(SqlSessionTemplate session,Map idNo);
	int updateTotalLikeUp(SqlSessionTemplate session,Map idNo);
	
	int updateLikeDown(SqlSessionTemplate session,Map idNo);
	int updateTotalLikeDown(SqlSessionTemplate session,Map idNo);

}
