package com.kh.spring.faq.model.service;

import java.util.List;
import java.util.Map;

public interface FaqService {
	
//	List<Faq> selectFaq();
	List<Map<String,String>> selectFaq(int cPage, int numPerpage);
	int selectFaqCount();
	List<Map<String,String>> searchFaq(String param, int cPage, int numPerpage);
	int selectSearchFaqCount(String param);
	int insertFaq(Map<String,String> param);
	
	List<Map<String,String>> infoFaq(String info, int cPage, int numPerpage);
	int infoFaqCount(String info);
	
	List<Map<String,String>> memberFaq(String member, int cPage, int numPerpage);
	int memberFaqCount(String member);
	
	List<Map<String,String>> cashFaq(String cash, int cPage, int numPerpage);
	int cashFaqCount(String cash);
	
	List<Map<String,String>> editFaqView(int faqNo);
	
	int updateFaq(Map<String,String> param);
	
	int deleteFaq(int faqNo);
}
