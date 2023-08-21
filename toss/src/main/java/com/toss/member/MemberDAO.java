package com.toss.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	public int register(MemberDTO dto) {
		return sqlSession.insert("member.register",dto);
	}

}
