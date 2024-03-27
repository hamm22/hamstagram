package com.ham.sns.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ham.sns.common.FileManager;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{
	
	// 클라이언트에게 이미지를 보여줌
	// 파일이미지 보여줌
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH + "/");
	}
}
