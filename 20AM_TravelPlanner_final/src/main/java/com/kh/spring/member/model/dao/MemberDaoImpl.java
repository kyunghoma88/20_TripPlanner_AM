package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.member.model.vo.Member;



@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		
		return session.insert("member.insertMember", m);
	}
	
	
	@Override
	public Member selectMember(SqlSessionTemplate session, Member m) {
		
		return session.selectOne("member.selectMember", m);
	}


	@Override
	public int payComplete(SqlSessionTemplate session, String userId) {
		// TODO Auto-generated method stub
		return session.update("member.payComplete", userId);
	}
	
	
	@Override
	public int updateMember(SqlSessionTemplate session, Member result) {
		
		return session.update("member.updateMember",result);
	}


	@Override
	public Member lookPw(SqlSessionTemplate session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.lookPw", param);
	}


	@Override
	public int lookPwUpdate(SqlSessionTemplate session, Map<String, String> param) {
		// TODO Auto-generated method stub
		return session.update("member.lookPwUpdate", param);
	}


	@Override
	public int signOut(SqlSessionTemplate session, Member result) {
		// TODO Auto-generated method stub
		return session.update("member.signOutMember", result);
	}


	@Override
	public Member checkId(SqlSessionTemplate session, String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.checkId", memberId);
	}


	
	//5월24일
	@Override
	public List<Board> selectMyBoard(SqlSessionTemplate session, int cPage, int numPerPage, String id) {
		// TODO Auto-generated method stub
		return session.selectList("board.selectMyList",id,new RowBounds((cPage - 1) * numPerPage, numPerPage));
	}


	@Override
	public int selectMyBoardCount(SqlSessionTemplate session, String id) {
		// TODO Auto-generated method stub
		return session.selectOne("board.selectMyBoardCount",id);
	}
	
	
	


	
	

}
