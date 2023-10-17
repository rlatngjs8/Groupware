package com.groupware.project;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class MailFile {
	@Autowired
	private MailDAO mdao;
	
	@GetMapping("/mailFiledownload")
	public ResponseEntity<Object> download(HttpServletRequest req, HttpServletResponse response) {
		String attachment = req.getParameter("attachment");
		try {
			attachment = URLEncoder.encode(attachment, "UTF-8"); //16진수로
			
		}  catch (UnsupportedEncodingException e1) {
            e1.printStackTrace();
        }
//		String path = "C:/Users/1234/git/Groupware/groupware/src/main/resources/static/mailImg/"+attachment;
		String path = "/home/opc/server/Groupware/groupware/src/main/resources/static/mailImg/"+attachment;
		
		try {
			Path filePath = Paths.get(path); //경로표현
			Resource resource = new InputStreamResource(Files.newInputStream(filePath)); // 파일 resource 얻기
            
			File file = new File(path);
			
//			String deAttachment = URLDecoder.decode(attachment, "UTF-8");
//			deAttachment = deAttachment.substring(deAttachment.indexOf(".")+1); 
			attachment = attachment.substring(attachment.indexOf(".")+1); 
			
			HttpHeaders headers = new HttpHeaders();
			// 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(attachment).build());
//			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());
			
			
			// 응답으로 변환될 정보를 모두 담은 요소들을 객체로 만들어서 반환
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			System.out.println("error");
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
	}
}
