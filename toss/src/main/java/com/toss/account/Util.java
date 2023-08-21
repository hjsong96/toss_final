package com.toss.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//Controller Service Repository
//Component = 媛앹껜

@Component
public class Util {
	//臾몄옄�뿴�씠 �뱾�뼱�삤硫� �닽�옄濡� 蹂�寃쏀븯湲�
	public int strToInt(String str) {
		
		int result = 0;
		
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			String re = ""; // �닽�옄�씤寃껊쭔 紐⑥쓣 �뒪�듃留�
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {
				if(Character.isDigit(str.charAt(i))) { // �닽�옄�씤�옄 紐곗뼱遊�
					//re += str.charAt(i); // �닽�옄留� 紐⑥븘�꽌
					sb.append(str.charAt(i));
				}
			}
			result = Integer.parseInt(sb.toString()); // �닽�옄濡� 留뚮뱾�뼱�꽌
		}
		
		return result; // �릺�룎�젮以띾땲�떎
	}
	
	public String exchange(String str) {
		return str.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	}
	
	public String getIp() {
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		// �긽��諛� ip 媛��졇�삤湲� 2023-07-19
		String ip = null; // 192.168.0.0 -> HttpServletRequest媛� �엳�뼱�빞 �빀�땲�떎
		ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		
		return ip;

	}
	
	//숫자인지 확인하기
	public boolean isNum(Object obj) {
		try {
			Integer.parseInt(String.valueOf(obj));
			return true;
		} catch(Exception e) {
			return false;
		}
		
	}
}
