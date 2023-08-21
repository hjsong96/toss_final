package com.toss.main;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MainDAO {

	@Inject
	@Named("sqlSession")
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> transactionList(int ttoggle, String aaccount){
		
		
		// toggle = -1 : 전체, 0 : 출금, 1 : 입금
		if(ttoggle == -1)
			return sqlSession.selectList("main.transactionList", aaccount);
		else if(ttoggle == 0)
			return sqlSession.selectList("main.withdrawalList", aaccount);
		else if(ttoggle == 1)
			return sqlSession.selectList("main.dipositList", aaccount);
		else
			return null;
		
		
		// return sqlSession.selectList("main.transactionList", aaccount);
	}

	public Map<String, Object> accountInfo(String aaccount) {
		
		return sqlSession.selectOne("main.accountInfo", aaccount);
	}
}
