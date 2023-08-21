package com.toss.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String login() {
		return "index";
	}
	
	@PostMapping("/login")
	public String login(HttpServletRequest req) {
		
		MemberDTO dto = new MemberDTO();
		dto.setMphone(req.getParameter("mphone"));
		dto.setMpw(req.getParameter("mpw"));
		dto = loginService.login(dto);
		
		if (dto.getCount() == 1) {
			HttpSession session = req.getSession();
			session.setAttribute("mname", dto.getMname());
			session.setAttribute("mphone", req.getParameter("mphone"));
			System.out.println(session.getAttribute("mphone"));
			System.out.println(session.getAttribute("mname"));
			
			return "redirect:list"; 
		} else {
			return "redirect:/"; 
		}
	}
	
	@GetMapping("/logout")
	public String Logout(HttpSession session) {

		session.setMaxInactiveInterval(0); // 세션 유지시간을 0으로 = 종료시키기
		session.invalidate(); // 세션 초기화 = 종료

		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/checkmphone")
	public String checkmphone(@RequestParam("mphone") String mphone) {
//		System.out.println("mphone : "+ mphone);
		
		 int result = loginService.checkmphone(mphone);
		
		  JSONObject json = new JSONObject(); 
		  json.put("result", result);
//		  System.out.println(json.toString());  
		  
		  return json.toString(); 

	}
}
