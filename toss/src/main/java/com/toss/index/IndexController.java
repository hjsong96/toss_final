package com.toss.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class IndexController {

	@GetMapping(value = {"/", "/index", "/home"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/index2")
	public String index2() {
		return "index2";
	}
	
	@PostMapping("/index2")
	public String index2(Model model, HttpServletRequest request ) {
		String aaccount = request.getParameter("aaccount");
		
		model.addAttribute("aaccount", aaccount);
		
		System.out.println(aaccount);
		
		return "index2";
	}
	
}
