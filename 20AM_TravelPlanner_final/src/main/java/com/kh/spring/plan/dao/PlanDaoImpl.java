package com.kh.spring.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class PlanDaoImpl implements PlanDao {

	@Override
	public List<Map<String, String>> placedata(SqlSessionTemplate session,String place) {
		// TODO Auto-generated method stub
		return session.selectList("plan.placeList",place);
	}

	@Override
	public int insertBoard(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("plan.insertBoard", map);
	}

	@Override
	public int insertPlan(SqlSessionTemplate session, Map<String,Object> mapda) {
		// TODO Auto-generated method stub
		return session.insert("plan.insertPlan", mapda);
	}

	@Override
	public int searchMember(SqlSessionTemplate session, String member) {
		// TODO Auto-generated method stub
		return session.selectOne("plan.searchMember",member);
	}

	@Override
	public List<Map<String, String>> areadata(SqlSessionTemplate session, String place) {
		// TODO Auto-generated method stub
		return session.selectList("plan.areadata", place);
	}

	@Override
	public List<Map<String, Object>> myplanselect(SqlSessionTemplate session,Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("plan.myplanselect", map);
	}

	@Override
	public int totaldays(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("plan.totaldays",map);
	}

	@Override
	public int deletePlan(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.delete("plan.deletePlan",map);
	}

	@Override
	public int deleteBoard(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.delete("plan.deleteBoard",map);
	}

	@Override
	public int updateBoard(SqlSessionTemplate session, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.insert("plan.updateBoard");
	}
	
	
	
	
	
	
	
	

	
}
