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
	public int updateMember(SqlSessionTemplate session, Member result) {
		
		return session.update("member.updateMember",result);
	}


}
