package com.kh.spring.member.model.service;

import java.util.Map;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectMember(Member m);

	int updateMember(Member result);
	
	int payComplete(String userId);
	
	Member lookPw(Map<String,String> param);
	
}
