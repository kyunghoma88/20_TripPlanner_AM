package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.member.model.vo.Member;

public interface MemberDao {
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	Member selectMember(SqlSessionTemplate session, Member m);

	int updateMember(SqlSessionTemplate session, Member result);
	
	int payComplete(SqlSessionTemplate session, String userId);
	
	Member lookPw(SqlSessionTemplate session, Map<String,String> param);
	
	int lookPwUpdate(SqlSessionTemplate session, Map<String,String> param);

	int signOut(SqlSessionTemplate session, Member result);

	Member checkId(SqlSessionTemplate session, String memberId);

	
	// 5월 24일 
	List<Board> selectMyBoard(SqlSessionTemplate session, int cPage, int numPerPage, String id);

	int selectMyBoardCount(SqlSessionTemplate session, String id);
	
}
