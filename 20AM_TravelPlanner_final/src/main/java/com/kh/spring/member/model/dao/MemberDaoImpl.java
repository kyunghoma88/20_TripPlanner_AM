package com.kh.spring.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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



	
	

}
