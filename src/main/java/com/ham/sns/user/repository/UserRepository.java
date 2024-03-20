package com.ham.sns.user.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserRepository {
	
	public int insertUser(@Param("loginId")String loginId
			,@Param("password") String password
			,@Param("name") String name
			,@Param("email") String email
			,@Param("phoneNumber") String phoneNumber);
	
	// 중복
	public int selectCountId(@Param("loginId") String loginId);
}
