package com.toss.send;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SendService {

	@Autowired
	private SendDAO sendDAO;
	
	
	
	public List<AccountsDTO> sendList(AccountsDTO dto) {
		return sendDAO.sendList(dto);
	}

	public int acCheck2(Map<String, Object> map) {
		return sendDAO.acCheck2(map);
	}

	public List<AccountsDTO> sendList2(String acCheck) {
		return sendDAO.sendList2(acCheck);
	}

	public List<String> transList(TransactionsDTO dto) {
		return sendDAO.transList(dto);
	}

	public List<AccountsDTO> abCheck(Map<String, Object> map) {
		return sendDAO.abCheck(map);
	}

	public int trSave0(Map<String, Object> map) {
		return sendDAO.trSave0(map);
	}

	public int trSave1(Map<String, Object> map) {
		return sendDAO.trSave1(map);
	}

	public int acChange0(Map<String, Object> map) {
		return sendDAO.acChange0(map);
	}

	public int acChange1(Map<String, Object> map) {
		return sendDAO.acChange1(map);
	}

	
}
