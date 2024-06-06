package com.ham.sns.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ham.sns.like.domain.Like;
import com.ham.sns.like.service.LikeService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/post")
@RestController
public class LikeRestController {

	@Autowired
	private LikeService likeService;

	@PostMapping("/like")
	public Map<String, String> like(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		Like like = likeService.addLike(userId, postId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(like != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 좋아요 취소
	@DeleteMapping("/unlike")
	public Map<String, String> Unlike(@RequestParam("postId") int postId
										, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		Like like = likeService.deleteLike(userId, postId);

		Map<String, String> resultMap = new HashMap<>();
				
		if(like != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
}
