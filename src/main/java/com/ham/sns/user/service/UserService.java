package com.ham.sns.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.sns.user.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public int addUser(String loginId ,String password, String name, String email, String phoneNumber) {
		return userRepository.insertUser(loginId, password, name, email, phoneNumber);
	}
	
	// 중복
	public boolean isDuplicateId(String loginId) {
		int count = userRepository.selectCountId(loginId);
		return count != 0;
	}
}
