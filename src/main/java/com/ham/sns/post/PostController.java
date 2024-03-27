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
	
	@GetMapping("/create-view2")
	public String inputPost() {
		return "post/input";
	}
	
	@GetMapping("/timeline-view")
	public String Timeline(Model model
							, HttpSession session) {
	
	List<PostDetail> postList = postService.getPostList();
	
	model.addAttribute("postList", postList);
		
	return "post/timeline";
	}

}
