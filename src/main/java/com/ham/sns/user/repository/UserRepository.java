package com.ham.sns.user.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.sns.user.domain.User;

@Mapper
public interface UserRepository {
	
	public int insertUser(@Param("loginId")String loginId
			,@Param("password") String password
			,@Param("name") String name
			,@Param("email") String email
			,@Param("phoneNumber") String phoneNumber);
	
	// 중복
	public int selectCountId(@Param("loginId") String loginId);
	
	//로그인
	public User selectUserByLoginIdAndPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	// 사용자 정보 조회
	public User selectUser(@Param("id") int id);
}
