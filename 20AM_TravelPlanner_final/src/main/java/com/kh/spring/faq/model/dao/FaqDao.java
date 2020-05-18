package com.kh.spring.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface FaqDao {
	
	List<Map<String,String>> selectFaq(SqlSession session,int cPage, int numPerpage);
	int selectFaqCount(SqlSession session);
	List<Map<String,String>> searchFaq(SqlSession session,String param, int cPage, int numPerpage);
	int selectSearchFaqCount(SqlSession session, String param);
	int insertFaq(SqlSession session, Map<String,String> param);
	List<Map<String,String>> infoFaq(SqlSession session, String info, int cPage, int numPerpage);
	int infoFaqCount(SqlSession session, String info);
	
	List<Map<String,String>> memberFaq(SqlSession session, String member, int cPage, int numPerpage);
	int memberFaqCount(SqlSession session, String member);
	
	List<Map<String,String>> cashFaq(SqlSession session, String cash, int cPage, int numPerpage);
	int cashFaqCount(SqlSession session, String cash);
	
	List<Map<String,String>> editFaqView(SqlSession session, int faqNo);
	
	int updateFaq(SqlSession session, Map<String,String> param);
	
	int deleteFaq(SqlSession session, int faqNo);

}
