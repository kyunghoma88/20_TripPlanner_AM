package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberDao dao;
	
	@Override
	public int insertMember(Member m) {
		
		return dao.insertMember(session, m);
	}
	
	
	@Override
	public Member selectMember(Member m) {
		
		return dao.selectMember(session, m);
	}


	@Override
	public int payComplete(String userId) {
		// TODO Auto-generated method stub
		return dao.payComplete(session, userId);
	}
	
	
	
	
	@Override
	public int updateMember(Member result) {
		// TODO Auto-generated method stub
		return dao.updateMember(session, result);
	}
	
	

}