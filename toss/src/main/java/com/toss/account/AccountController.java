package com.toss.account;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountController {
	@Autowired
	private AccountService accountService;

	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model, HttpSession session) {
		String mphone = (String) session.getAttribute("mphone");
		if (mphone == null) {
			return "redirect:/login"; 
		}

		List<Map<String, Object>> tossBank = accountService.tossBank(mphone); // 토스뱅크 계좌 정보
		List<Map<String, Object>> otherBank = accountService.otherBank(mphone);

		int totalbalance = accountService.totalBalance(tossBank, otherBank);

		model.addAttribute("totalbalance", totalbalance); 
		model.addAttribute("tossBank", tossBank);
		model.addAttribute("otherBank", otherBank);

		return "list";

	}

	@GetMapping("/detail")
	public String detail() {
		return "detail";
	}

	@GetMapping("/open")
	public String open(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("mphone") != null) {
			return "open";
		} else {
			return "redirect:/login"; 
		}

	}

	@GetMapping("/open2")
	public String open2() {
		return "open2";
	}

	@RequestMapping("/open3")
	public String open3(HttpServletRequest request, Model model, HttpSession session) {
		String mphone = (String) session.getAttribute("mphone");
		if (mphone == null) {
			return "redirect:/login";
		}

		Map<String, Object> memberData = accountService.MnameMphone(mphone);
		String mname = (String) memberData.get("mname");
		
		model.addAttribute("mphone", mphone);
		model.addAttribute("mname", mname);

		String referer = request.getHeader("referer");
		if (referer == null || !referer.contains("open2")) {
			return "redirect:/open";
		}
		return "open3";
	}


	
	@PostMapping("/open4")
	public String open4(Model model, HttpServletRequest request) {
		
		String aholder = request.getParameter("aholder");
		model.addAttribute("aholder", aholder);
		System.out.println("값 : "+ aholder);
		
		String referer = request.getHeader("referer");
		if (referer == null || !referer.contains("open3")) {
			return "redirect:/open";
		}
		return "open4";
	}

	@PostMapping("/tossaccount")
	public String tossaccount(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request, HttpSession session) {

		if (session.getAttribute("mphone") != null) {
			
			String aholder = request.getParameter("aholder");
			System.out.println("값2 : "+ aholder);
			model.addAttribute("aholder", aholder);
			System.out.println("값3 : "+ aholder);
			
			
			int randomacc = (int) Math.floor(1000 + Math.random() * 9000);
			String randomstr = String.valueOf(randomacc);

			map.put("mphone", session.getAttribute("mphone"));
			map.put("aaccount", randomstr);
			map.put("abank", "토스뱅크");
			map.put("aholder", aholder);

			int result = accountService.tossInsert(map);
			if (result == 1) {
				return "open5";
			} else {
				return "redirect:/open";
			}

		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/open5")
	public String open5(HttpServletRequest request) {
		String referer = request.getHeader("referer");
		if (referer == null || !referer.contains("open4")) {
			return "redirect:/open";
		}
		return "open5";
	}
/*
	@GetMapping("/home")
	public String home(HttpServletRequest request, HttpSession session) {

		if (session.getAttribute("mphone") != null) {
			return "home";
		} else {
			return "redirect:/login"; // 나중에 로그인페이지로
		}

	}
*/
}
