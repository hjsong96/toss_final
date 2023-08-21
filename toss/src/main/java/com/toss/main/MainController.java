package com.toss.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

   @Autowired
   private MainService mainService;
   
   @PostMapping("/main")
   public String main(HttpServletRequest request, Model model) {
      
      String aaccount = request.getParameter("aaccount");
      
      Map<String, Object> accountInfo = mainService.accountInfo(aaccount);
      //System.out.println(accountInfo);
      
      model.addAttribute("accountInfo", accountInfo);
      
      /*
      // public List<Map<String, Object>> transactionList(int ttoggle, String aaccount)
      List<Map<String, Object>> transactionList = mainService.transactionList(-1, aaccount);
      
      for(int i=0 ; i < transactionList.size(); i++) {
         String[] date = transactionList.get(i).get("tdate").toString().split(" ")[0].toString().split("-");
         String[] time = transactionList.get(i).get("tdate").toString().split(" ")[1].toString().split(":");
         
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("year", date[0]);
         map.put("month", date[1]);
         map.put("date", date[2]);
         map.put("hour", time[0]);
         map.put("minute", time[1]);
         map.put("second", time[2]);
         //System.out.println(map);
         
         model.addAttribute("transactiondate"+i, map);
      }
      //System.out.println(transactionList);
      
      model.addAttribute("transactionList", transactionList);
      */
      
      return "main";
   }
   
   @ResponseBody
   @PostMapping(value = "/chgList", produces = "application/text; charset=utf8")
   public String main(@RequestParam("option") String value, @RequestParam("aaccount") String aaccount) {
      System.out.println(Integer.parseInt(value));
      List<Map<String, Object>> transactionList = mainService.transactionList(Integer.parseInt(value), aaccount);
      
      //System.out.println(Integer.parseInt(value));
      //System.out.println(aaccount);
      
      JSONObject json = new JSONObject();
      JSONArray listArr = new JSONArray(transactionList);
      json.put("transactionList", listArr);
      
      JSONArray dateArr = new JSONArray();
      for(int i=0 ; i < transactionList.size(); i++) {
         String[] date = transactionList.get(i).get("tdate").toString().split(" ")[0].toString().split("-");
         String[] time = transactionList.get(i).get("tdate").toString().split(" ")[1].toString().split(":");
         
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("year", date[0]);
         map.put("month", date[1]);
         map.put("date", date[2]);
         map.put("hour", time[0]);
         map.put("minute", time[1]);
         map.put("second", time[2]);
         //System.out.println(map);
         
         dateArr.put(map);
      }
      json.put("transactionDate", dateArr);
      
      System.out.println(listArr.get(0));
      System.out.println(dateArr.get(0));
      
      return json.toString();
   }
   
}