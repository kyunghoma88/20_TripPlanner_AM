package com.kh.spring.faq.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDaoImpl implements FaqDao {

	@Override
	public List<Map<String, String>> selectFaq(SqlSession session, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("faq.selectList",null,new RowBounds((cPage - 1) * numPerpage, numPerpage));
	}

	@Override
	public int selectFaqCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.selectFaqCount");
	}

	@Override
	public List<Map<String, String>> searchFaq(SqlSession session, String param, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("faq.searchFaq", param, new RowBounds((cPage -1 ) * numPerpage, numPerpage));
	}

	@Override
	public int selectSearchFaqCount(SqlSession session, String param) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.selectSearchFaqCount", param);
	}

	@Override
	public int insertFaq(SqlSession session, Map<String, String> param) {
		// TODO Auto-generated method stub
		System.out.println(param);
		return session.insert("faq.insertFaq", param);
	}

	@Override
	public List<Map<String, String>> infoFaq(SqlSession session, String info, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("faq.infoFaq", info, new RowBounds((cPage -1 ) * numPerpage, numPerpage));
	}

	@Override
	public int infoFaqCount(SqlSession session, String info) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.infoFaqCount", info);
	}

	@Override
	public List<Map<String, String>> memberFaq(SqlSession session, String member, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("faq.memberFaq", member, new RowBounds((cPage -1 ) * numPerpage, numPerpage));
	}

	@Override
	public int memberFaqCount(SqlSession session, String member) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.memberFaqCount", member);
	}

	@Override
	public List<Map<String, String>> cashFaq(SqlSession session, String cash, int cPage, int numPerpage) {
		// TODO Auto-generated method stub
		return session.selectList("faq.cashFaq", cash, new RowBounds((cPage -1 ) * numPerpage, numPerpage));
	}

	@Override
	public int cashFaqCount(SqlSession session, String cash) {
		// TODO Auto-generated method stub
		return session.selectOne("faq.cashFaqCount", cash);
	}
	
	
	
	
	
	
	
	
	
	

	


	
	

	

}
