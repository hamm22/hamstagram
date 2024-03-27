package com.ham.sns.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ham.sns.post.service.PostService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	@Autowired
	private PostService postService;
	
	@PostMapping("/create")
	public Map<String, String> createFeed(
			@RequestParam("contents") String contents
			,@RequestParam(value="imageFile", required=false) MultipartFile file // 필수항목이 아닌경우 required=false
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId"); // userId 정수
		
		int count = postService.addPost(userId, contents, file);
		
		Map<String, String> resultMap = new HashMap<>();
	
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
}
