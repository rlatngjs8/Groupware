package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class Ko_controller {
	@Autowired
	private CalendarDAO cdao;
	
	@GetMapping("ko_calendar")
	public String ko_calendar() {
		return "ko_calendar";
	}

	@GetMapping("/getPlan")
	@ResponseBody
	public String getPlan() {
		ArrayList<CalendarDTO> alCalendar = cdao.getPlan();		
		JSONArray ja = new JSONArray();
		for(int i=0; i<alCalendar.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("calendar_no",alCalendar.get(i).calendar_no);
			jo.put("calendar_title", alCalendar.get(i).calendar_title);
			jo.put("calendar_memo", alCalendar.get(i).calendar_memo);
			jo.put("calendar_start", alCalendar.get(i).calendar_start);
			jo.put("calendar_end", alCalendar.get(i).calendar_end);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@GetMapping("ko_addPlan")
	public String ko_addPlan() {
		return "ko_addPlan";
	}
	@PostMapping("planInsert")
	public String planInsert(HttpServletRequest req) {
		String title = req.getParameter("ipt_tit");
		String start = req.getParameter("startHidden");
		String end = req.getParameter("endHidden");
		String content = req.getParameter("contentArea");
//		cdao.planInsert(title,start,end,content);
		return "ko_calendar";
	}
}
