package com.groupware.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TodoController {
	@GetMapping("/todo")
	public String todo(HttpServletRequest req, Model model) {
		return "todo/todo";
	}
}
