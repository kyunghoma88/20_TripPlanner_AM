package com.kh.spring.member.model.dao;

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
	
	
	
	

}
