package com.toss.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
	
	@Autowired
	private MainDAO mainDAO;

	public List<Map<String, Object>> transactionList(int ttoggle, String aaccount) {
		
		return mainDAO.transactionList(ttoggle, aaccount);
	}

	public Map<String, Object> accountInfo(String aaccount) {
		
		return mainDAO.accountInfo(aaccount);
	}
}
