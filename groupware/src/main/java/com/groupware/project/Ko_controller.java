package com.groupware.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Ko_controller {
	
	@GetMapping("ko_calendar")
	public String home() {
		return "ko_calendar";
	}

}
