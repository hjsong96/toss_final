package com.toss.account;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public Map<String, Object> MnameMphone(String mphone) {
	    return sqlSession.selectOne("account.MnameMphone", mphone);
	}

//	public List<Map<String, Object>> bankList(String mphone) {
//		return sqlSession.selectList("account.bankList", mphone);
//	}

	public List<Map<String, Object>> tossBank(String mphone) {
		return sqlSession.selectList("account.tossBank", mphone);
	}

	public List<Map<String, Object>> otherBank(String mphone) {
		return sqlSession.selectList("account.otherBank", mphone);
	}

	public int tossInsert(Map<String, Object> map) {
		return sqlSession.insert("account.tossInsert", map);
	}
	

}