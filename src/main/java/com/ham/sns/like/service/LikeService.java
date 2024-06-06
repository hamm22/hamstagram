package com.ham.sns.like.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.sns.like.domain.Like;
import com.ham.sns.like.repository.LikeRepository;

@Service
public class LikeService {
	
	@Autowired
	private LikeRepository likeRepository;
	
	public Like addLike(int userId, int postId) {
		
		Like like = Like.builder()
				.postId(postId)
				.userId(userId)
				.build();
		
		return likeRepository.save(like);
	}
	
	// 특정 게시글의 좋아요 개수 돌려주는 기능
	public int getLikeCount(int postId) {
		return likeRepository.countByPostId(postId);
	}
	
	// 특정 사용자가 특정 게시글에 좋아요했는지 여부
	// 이다 아니다 일때는 is로 키워드 시작이고 boolean 사용
	public boolean isLikeByUserIdAndPostId(int userId, int postId){
		
		int count = likeRepository.countByUserIdAndPostId(userId, postId);
		
		if(count >= 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	// delete
	public Like deleteLike(int userId, int postId) {
		
//		Optional<Like> optionalLike = likeRepository.findByPostIdAndUserId(postId, userId);
//		
//		Like like = optionalLike.orElse(null);
//		
//		if(like != null) {
//			likeRepository.delete(like);
//		}
		likeRepository.deleteByUserIdAndPostId(userId, postId);
		
		return new Like();
	}
	
	public void deleteLikeByPostId(int postId) {
		likeRepository.deleteByPostId(postId);
	}
}
