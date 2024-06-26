package com.ham.sns.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ham.sns.post.domain.Post;

@Mapper
public interface PostRepository {
	
	public int insertPost(@Param("userId")int userId
			, @Param("contents") String contents
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();
	
	public Post selectPost(@Param("id") int id);
	
	// delete
	public int deletePost(@Param("id") int id);

}
