package com.toss.charge;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChargeController {

	@Autowired
	private ChargeService chargeService;
	
	@GetMapping("/charge")
	public String charge(HttpServletRequest request, HttpSession session, Model model) {

		// 값을 유지한 채로 보냄 = 통로역할
				
		return "charge";
	}

	@PostMapping("/charge")
	public String sendList(HttpServletRequest request, Model model, HttpSession session) {
		AccountsDTO dto = new AccountsDTO();
		dto.setAaccount(request.getParameter("aaccount"));
		
		List<AccountsDTO> list = chargeService.charge(dto);
		model.addAttribute("list", list); 
		//System.out.println(list);
		
		session.setAttribute("aaccount", request.getParameter("aaccount"));

		return "charge";
	}

	@GetMapping("/charge2")
	public String charge2() {

		return "charge2";

	}

	@PostMapping("/charge2")
	public String charge2(@RequestParam("aaccount") String aaccount, Model model) {
		System.out.println("charge에서 온 값 : " + aaccount);

		List<AccountsDTO> list = chargeService.charge2(aaccount);

		model.addAttribute("aaccount", aaccount);

//		System.out.println(list);
		model.addAttribute("list", list);
//		System.out.println(list);

		return "charge2";
	}

	@GetMapping("/charge3")
	public String charge3() {

		return "charge3";
	}

	@PostMapping("/charge3")
	public String charge3(@RequestParam("aaccount") String aaccount, Model model) {

		System.out.println("charge에서 온 값 : " + aaccount);

		List<AccountsDTO> list = chargeService.charge2(aaccount);

		model.addAttribute("aaccount", aaccount);

//		System.out.println(list);
		model.addAttribute("list", list);
//		System.out.println(list);

		return "charge3";
	}

	@ResponseBody
	@PostMapping("/chargeCheck2") // 회원 보내기 ajax
	public String chargeCheck2(@RequestParam Map<String, Object> map) {
		System.out.println(map);
		int result = chargeService.chargeCheck2(map);
		System.out.println(result);
		JSONObject json = new JSONObject();
		json.put("result", result);
		System.out.println(json.toString());

		return json.toString();
	}

	@PostMapping("/charge4")
	public String totalList(@RequestParam Map<String, Object> map, @RequestParam ("aaccount") String aaccount, @RequestParam ("trAccount0") String trAccount0, @RequestParam ("trAbank0") String trAbank0, Model model) {
		System.out.println(map);
		List<AccountsDTO> list = chargeService.sendList2(aaccount);
		model.addAttribute("list", list); 
		//System.out.println(list);

		List<AccountsDTO> list2 = chargeService.abCheck(map);
		model.addAttribute("list2", list2); 
		//System.out.println(list2);

		return "charge4";
	}

	@GetMapping("/charge5")
	public String charge5() {
		
		return "charge5";
	}

	@PostMapping("/charge5")
	public String totalList2(@RequestParam Map<String, Object> map, @RequestParam ("aaccount") String aaccount, @RequestParam ("trAccount0") String trAccount0, @RequestParam ("trAbank0") String trAbank0, Model model) {
		System.out.println(map);
		List<AccountsDTO> list = chargeService.sendList2(aaccount);
		model.addAttribute("list", list); 
		System.out.println(list);

		List<AccountsDTO> list2 = chargeService.abCheck(map);
		model.addAttribute("list2", list2); 
		System.out.println(list2);
		
		model.addAttribute("list3", map);
		
		int list4 = chargeService.trSave0(map);
		int list5 = chargeService.trSave1(map);
		
		int list6 = chargeService.acChange0(map);
		int list7 = chargeService.acChange1(map);

		return "charge5";
	}

	// 내 소중한 자료들 
	/*
	@GetMapping("/gugmin")
	public ModelAndView gugmin() {
		ModelAndView mv = new ModelAndView("gugmin");

		List<String> name = chargeService.bankName();

		mv.addObject("abank", "국민은행");
		mv.addObject("abalance", "1980000");

		List<Map<String, Object>> list = chargeService.toList();
		System.out.println(list);

		// 선택한 Map에서 원하는 데이터 추출
		Map<String, Object> selectedMap = list.get(0);
		Object loginAbank = selectedMap.get("abank");
		Object loginAaccount = selectedMap.get("aaccount");

		mv.addObject("loginAbank", loginAbank);
		mv.addObject("loginAaccount", loginAaccount);

		return mv;
	}

	@GetMapping("/nhbank")
	public ModelAndView nhbank() {
		ModelAndView mv = new ModelAndView("nhbank");

		List<String> name = chargeService.bankName();

		mv.addObject("abank", "NH농협");
		mv.addObject("abalance", "1004000");

		List<Map<String, Object>> list = chargeService.toList();
		System.out.println(list);

		int index = 0;

		// 선택한 Map에서 원하는 데이터 추출
		Map<String, Object> selectedMap = list.get(index);
		Object loginAbank = selectedMap.get("abank");
		Object loginAaccount = selectedMap.get("aaccount");

		mv.addObject("loginAbank", loginAbank);
		mv.addObject("loginAaccount", loginAaccount);

		return mv;
	}

	@GetMapping("/kakao")
	public ModelAndView kakao() {
		ModelAndView mv = new ModelAndView("kakao");

		List<String> name = chargeService.bankName();

		mv.addObject("abank", "카카오뱅크");
		mv.addObject("abalance", "176000");

		List<Map<String, Object>> list = chargeService.toList();
		System.out.println(list);

		int index = 0;

		// 선택한 Map에서 원하는 데이터 추출
		Map<String, Object> selectedMap = list.get(index);
		Object loginAbank = selectedMap.get("abank");
		Object loginAaccount = selectedMap.get("aaccount");

		mv.addObject("loginAbank", loginAbank);
		mv.addObject("loginAaccount", loginAaccount);

		return mv;
	}

	@GetMapping("/toss")
	public ModelAndView toss() {
		ModelAndView mv = new ModelAndView("toss");

		List<String> name = chargeService.bankName();

		mv.addObject("abank", "토스뱅크");
		mv.addObject("abalance", "666623526000");

		List<Map<String, Object>> list = chargeService.toList();
		System.out.println(list);

		int index = 0;

		// 선택한 Map에서 원하는 데이터 추출
		Map<String, Object> selectedMap = list.get(index);
		Object loginAbank = selectedMap.get("abank");
		Object loginAaccount = selectedMap.get("aaccount");

		mv.addObject("loginAbank", loginAbank);
		mv.addObject("loginAaccount", loginAaccount);

		return mv;
	}

	@GetMapping("/shinhan")
	public ModelAndView shinhan() {
		ModelAndView mv = new ModelAndView("shinhan");

		List<String> name = chargeService.bankName();

		mv.addObject("abank", "신한은행");
		mv.addObject("abalance", "-100000000");

		List<Map<String, Object>> list = chargeService.toList();
		System.out.println(list);

		int index = 0;

		// 선택한 Map에서 원하는 데이터 추출
		Map<String, Object> selectedMap = list.get(index);
		Object loginAbank = selectedMap.get("abank");
		Object loginAaccount = selectedMap.get("aaccount");

		mv.addObject("loginAbank", loginAbank);
		mv.addObject("loginAaccount", loginAaccount);

		return mv;
	}

	@GetMapping("/charge2")
	public ModelAndView charge2(@RequestParam ModelAndView mv) {
		mv.setViewName("charge2");
		
		List<String> name = chargeService.bankName(); 
		System.out.println(name);
		mv.addObject("name", name);

		return mv;
	
	}

	 // upChar
	 @PostMapping("/main") 
	 public String upchar(ModelAndView mv, HttpServletRequest request) { 
	 	int result = chargeService.toCharge(mv);
	  
	 	if (result == 1) { 
	 		return "redirect:/index"; 
	 	} else { 
	 		return "redirect:/charge"; 
		} 
	}
*/
	
	/*
	 * @GetMapping("/charge3") public ModelAndView charge3(ModelAndView mv) {
	 * 
	 * List<Map<String, Object>> list = chargeService.toList();
	 * System.out.println(list); mv.addObject("list", list);
	 * 
	 * return mv; }
	 */

}
