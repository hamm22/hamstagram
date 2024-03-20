package com.ham.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/login-view")
	public String inputLogin() {
		return "user/login";
	}
	
	@GetMapping("/user/join-view")
	public String inputJoin() {
		return "user/join";
	}
}
