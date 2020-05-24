package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(Member m);

	int updateMember(Member result);
	
	int payComplete(String userId);
	
	Member lookPw(Map<String,String> param);
	
	int lookPwUpdate(Map<String,String> param);

	int memberSignOut(Member result);

	Member checkId(String memberId);
	
	
	//5월24일
	List<Board> selectMyBoard(int cPage, int numPerPage, String id);

	
	int selectMyBoardCount(String id);
	
}
