package com.groupware.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HwanController {
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	

}
