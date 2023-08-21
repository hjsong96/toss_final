package com.toss.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO login(MemberDTO dto) {
		return sqlSession.selectOne("login.login",dto);
	}

	public int checkmphone(String mphone) {
		return sqlSession.selectOne("login.checkmphone", mphone);
	}

}
