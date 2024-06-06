package com.ham.sns.comment.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ham.sns.comment.domain.Comment;

import jakarta.transaction.Transactional;

public interface CommentRepository extends JpaRepository<Comment, Integer> {  // 레파지토리에 다룰 테이블, 그에사용할 entity
	
	// WHERE `postId` = #{}
	public List<Comment> findByPostId(int postId);
	
	@Transactional
	public void deleteByPostId(int postId);
	
}
