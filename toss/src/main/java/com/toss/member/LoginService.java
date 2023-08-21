package com.toss.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO; 
	
	public MemberDTO login(MemberDTO dto) {
		return loginDAO.login(dto);
	}
	
	public int checkmphone(String mphone) {

		return loginDAO.checkmphone(mphone);
	}

}
