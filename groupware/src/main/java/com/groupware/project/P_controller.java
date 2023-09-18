package com.groupware.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class P_controller {
	@GetMapping("/header")
	public String header() {
		return "P_header";
	}
}
