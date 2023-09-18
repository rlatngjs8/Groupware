package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//import com.himedia.springboot.ReviewDTO;

@Controller
public class HwanController {
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
//	@GetMapping("/get_addressBook")
//	public String get_addressBook() {
//	  ArrayList<ReviewDTO> review_get = pdao.select_review(space_id);
//	    JSONArray ja = new JSONArray();
//	    for (int i = 0; i < review_get.size(); i++) {
//	        JSONObject jo = new JSONObject();
//	        jo.put("", review_get.get(i).getReview_id());
//	        jo.put("", review_get.get(i).getSpace_id());
//	        jo.put("", review_get.get(i).getUserid());
//	        jo.put("", review_get.get(i).getRating());
//	        jo.put("", review_get.get(i).getReview_content());
//	        jo.put("", review_get.get(i).getCreated());
//	        ja.add(jo);
//	    }
//	    return ja.toJSONString();
//	}
//	

}
