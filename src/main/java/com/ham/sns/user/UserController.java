package com.ham.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@GetMapping("/login-view")
	public String inputLogin() {
		return "user/login";
	}
	
	@GetMapping("/join-view")
	public String inputJoin() {
		return "user/join";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		// 세션에 저장된 사용자 정보를 삭제한다.
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		// 로그인 페이지로 redirect
		return "redirect:/user/login-view";
		
	}
}
