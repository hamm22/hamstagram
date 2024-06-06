package com.ham.sns.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.sns.post.dto.PostDetail;
import com.ham.sns.post.service.PostService;

import jakarta.servlet.http.HttpSession;


@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@GetMapping("/create-view")
	public String inputTimeline() {
		return "post/timeline";
	}
	
	@GetMapping("/timeline-view")
	public String Timeline(Model model
							, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postService.getPostList(userId);
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}

}
