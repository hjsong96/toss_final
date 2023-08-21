package com.toss.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AccountService")
public class AccountService {

	@Autowired
	private AccountDAO accountDAO;

	
	
	public Map<String, Object> MnameMphone(String mphone) {
		return accountDAO.MnameMphone(mphone);
	}

//	public List<Map<String, Object>> bankList(String mphone) {
//		return accountDAO.bankList(mphone);
//	}

	public int totalBalance(List<Map<String, Object>> tossBank, List<Map<String, Object>> otherBank) {
	    int totalBalance = 0;
	    
	    for (Map<String, Object> account : tossBank) {
	        String abalanceStr = (String) account.get("abalance");
	        int abalance = Integer.parseInt(abalanceStr);
	        totalBalance += abalance;
	    }
	    
	    for (Map<String, Object> account : otherBank) {
	        String abalanceStr = (String) account.get("abalance");
	        int abalance = Integer.parseInt(abalanceStr);
	        totalBalance += abalance;
	    }
	    
	    return totalBalance;
	}

	public List<Map<String, Object>> tossBank(String mphone) {
		return accountDAO.tossBank(mphone);
	}

	public List<Map<String, Object>> otherBank(String mphone) {
		return accountDAO.otherBank(mphone);
	}

	public int tossInsert(Map<String, Object> map) {
		return accountDAO.tossInsert(map);
	}

/*
	public AccountDTO open3(AccountDTO dto) {
		return null;
	}
*/
	//public List<Map<String, Object>> members(Map<String, Object> map) {
		//return accountDAO.members(map); 
	//}










}
