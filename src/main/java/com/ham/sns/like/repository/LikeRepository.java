package com.ham.sns.like.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ham.sns.like.domain.Like;

import jakarta.transaction.Transactional;

// JPA
public interface LikeRepository extends JpaRepository<Like, Integer>{

	// 좋아요 개수 조회 (정수)
	// select count(*) from like where postid = #{}
	public int countByPostId(int postId);
	
	// select count(*) from like where postid = #{} AND userId= #{}
	public int countByUserIdAndPostId(int userId, int postId);
	
	// delete
	public Optional<Like> findByPostIdAndUserId(int userId, int postId); // 한행을 조회할때는 optional (JPA)
	
	// delete  from `like` where `userId`
	@Transactional
	public void deleteByUserIdAndPostId(int userId, int postId); // delete는 void를 사용해야함
	
	// delete from `like` where `postId` = #{}
	@Transactional
	public void deleteByPostId(int postId);
}