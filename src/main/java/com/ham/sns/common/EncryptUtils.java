package com.ham.sns.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {
	
public static String md5(String message){ // 이 메소드는 static으로 객체 생성없이 사용할 수 있음
		
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			
			byte[] bytes = message.getBytes();
			md.update(bytes); // 암호화 수행
			
			byte[] digest = md.digest();
			
			// byte배열을 16진수 형태의 문자열로 만드는 과정
			// & 비트 연산
			for(int i = 0; i < digest.length; i ++) {
				// 비트 연산
				result += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// 잘못된 문자열을 받았을떄
			e.printStackTrace();
			return null;
		}
		
		return result;
	}
}
