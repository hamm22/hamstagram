package com.ham.sns.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.sns.common.FileManager;
import com.ham.sns.post.domain.Post;
import com.ham.sns.post.dto.PostDetail;
import com.ham.sns.post.repository.PostRepository;
import com.ham.sns.user.domain.User;
import com.ham.sns.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	public int addPost(int userId, String contents, MultipartFile file) {
		
		// 파일을 특정 위치에 저장
		String imagePath = FileManager.saveFile(userId, file);

		return postRepository.insertPost(userId, contents, imagePath);
	}
	
	public List<PostDetail> getPostList() {
		List<Post> postList = postRepository.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>(); // 사용자 정보까지 포함
		
		for(Post post:postList) {
			
			User user = userService.getUser(post.getUserId());
			
			PostDetail postDetail = new PostDetail();
			postDetail.setId(post.getId());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setUserLoginId(user.getLoginId());
			
			postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}

}
