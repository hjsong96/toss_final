package com.toss.charge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChargeService {
	
	@Autowired
	private ChargeDAO chargeDAO;

	public List<AccountsDTO> charge(AccountsDTO dto) {
		return chargeDAO.charge(dto);
	}

	public List<AccountsDTO> charge2(String aaccount) {
		return chargeDAO.charge2(aaccount);
	}

	public int chargeCheck2(Map<String, Object> map) {
		return chargeDAO.chargeCheck2(map);
	}

	public List<AccountsDTO> abCheck(Map<String, Object> map) {
		return chargeDAO.abCheck(map);
	}

	public List<AccountsDTO> sendList2(String aaccount) {
		return chargeDAO.sendList2(aaccount);
	}

	public int trSave0(Map<String, Object> map) {
		return chargeDAO.trSave0(map);
	}

	public int trSave1(Map<String, Object> map) {
		return chargeDAO.trSave1(map);
	}

	public int acChange0(Map<String, Object> map) {
		return chargeDAO.acChange0(map);
	}

	public int acChange1(Map<String, Object> map) {
		return chargeDAO.acChange1(map);
	}

/*
	public int toCharge(ModelAndView mv) {
		return chargeDAO.toCharge(mv);
	}

	public List<Map<String, Object>> toList() {
		return chargeDAO.toList();
	}

	public String bankName(int abank) {
		return chargeDAO.bankName(abank);
	}

	public List<String> bankName() {
		return chargeDAO.bankName();
	}
*/

}
