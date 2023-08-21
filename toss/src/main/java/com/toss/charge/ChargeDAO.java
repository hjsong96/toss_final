package com.toss.charge;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChargeDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<AccountsDTO> charge(AccountsDTO dto) {
		return sqlSession.selectList("charge.select", dto);
	}
	
	public List<AccountsDTO> charge2(String aaccount) {
		return sqlSession.selectList("charge.select2", aaccount);
	}

	public int chargeCheck2(Map<String, Object> map) {
		return sqlSession.selectOne("charge.chargeCheck2", map);
	}

	public List<AccountsDTO> abCheck(Map<String, Object> map) {
		return sqlSession.selectList("charge.abCheck", map);
	}

	public List<AccountsDTO> sendList2(String aaccount) {
		return sqlSession.selectList("charge.sendList2", aaccount);
	}

	public int trSave0(Map<String, Object> map) {
		return sqlSession.insert("charge.trSave0", map);
	}

	public int trSave1(Map<String, Object> map) {
		return sqlSession.insert("charge.trSave1", map);
	}

	public int acChange0(Map<String, Object> map) {
		return sqlSession.update("charge.acChange0", map);
	}

	public int acChange1(Map<String, Object> map) {
		return sqlSession.update("charge.acChange1", map);
	}

/*	
	public int toCharge(ModelAndView mv) {
		return sqlSession.update("charge.toCharge", mv);
	}

	public List<Map<String, Object>> toList() {
		return sqlSession.selectList("charge.toList");
	}

	public String bankName(int abank) {
		return sqlSession.selectOne("charge.bankName", abank);
	}

	public List<String> bankName() {
		return sqlSession.selectList("charge.bankName");
	}

	public int upChar(String aaccount) {
		return sqlSession.update("charge.upChar", aaccount);
	}
*/

}
