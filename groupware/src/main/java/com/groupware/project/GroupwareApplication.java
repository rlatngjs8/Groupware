package com.groupware.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@CrossOrigin(origins = "*", allowedHeaders = "*") // CORS 설정 추가
public class GroupwareApplication {

	public static void main(String[] args) {
		SpringApplication.run(GroupwareApplication.class, args);
	}

}
