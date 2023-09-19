package com.groupware.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MailController {
	@GetMapping("/mail")
	public String home() {
		
		return "mail";
	}
}
