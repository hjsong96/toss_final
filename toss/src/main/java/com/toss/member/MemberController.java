package com.toss.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	@PostMapping("/register")
	public String registerok(HttpServletRequest req, MemberDTO dto) {
		dto = new MemberDTO();
		dto.setMphone(req.getParameter("mphone"));
		dto.setMname(req.getParameter("mname"));
		dto.setMpw(req.getParameter("mpw"));

		int result = memberService.register(dto);
		
		System.out.println(result);
		if(result == 1) {
			return "registerok";
		} else {
			return "redirect:/register";
		}
	}

}
