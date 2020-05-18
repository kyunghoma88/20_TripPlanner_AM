package com.kh.spring.faq.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.faq.model.dao.FaqDao;
import com.kh.spring.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private FaqDao dao;

	@Override
	public List<Map<String, String>> selectFaq(int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.selectFaq(session, cPage, numPerpage);
	}

	@Override
	public int selectFaqCount() {
		// TODO Auto-generated method stub
		return dao.selectFaqCount(session);
	}

	@Override
	public List<Map<String, String>> searchFaq(String param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.searchFaq(session, param, cPage, numPerpage);
	}

	@Override
	public int selectSearchFaqCount(String param) {
		// TODO Auto-generated method stub
		return dao.selectSearchFaqCount(session, param);
	}

	@Override
	public int insertFaq(Map<String, String> param) {
		// TODO Auto-generated method stub
		return dao.insertFaq(session, param);
	}

	@Override
	public List<Map<String, String>> infoFaq(String info, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.infoFaq(session, info, cPage, numPerpage);
	}

	@Override
	public int infoFaqCount(String info) {
		// TODO Auto-generated method stub
		return dao.infoFaqCount(session, info);
	}

	@Override
	public List<Map<String, String>> memberFaq(String member, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.memberFaq(session, member, cPage, numPerpage);
	}

	@Override
	public int memberFaqCount(String member) {
		// TODO Auto-generated method stub
		return dao.memberFaqCount(session, member);
	}

	@Override
	public List<Map<String, String>> cashFaq(String cash, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return dao.cashFaq(session, cash, cPage, numPerpage);
	}

	@Override
	public int cashFaqCount(String cash) {
		// TODO Auto-generated method stub
		return dao.cashFaqCount(session, cash);
	}
	
	@Override
	public List<Map<String,String>> editFaqView(int faqNo) {
		// TODO Auto-generated method stub
		return dao.editFaqView(session, faqNo);
	}

	@Override
	public int updateFaq(Map<String, String> param) {
		// TODO Auto-generated method stub
		return dao.updateFaq(session, param);
	}

	@Override
	public int deleteFaq(int faqNo) {
		// TODO Auto-generated method stub
		return dao.deleteFaq(session, faqNo);
	}
	
	
	
	
	


	
	
	
	

	

}
