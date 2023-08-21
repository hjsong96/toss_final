package com.toss.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public int register(MemberDTO dto) {
		return memberDAO.register(dto);
		
	}
}
