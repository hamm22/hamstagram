package com.ham.sns.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.sns.comment.dto.CommentDetail;
import com.ham.sns.comment.service.CommentService;
import com.ham.sns.common.FileManager;
import com.ham.sns.like.service.LikeService;
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
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private CommentService commentService;
	
	public int addPost(int userId, String contents, MultipartFile imageFile) {
		
		// 파일을 특정 위치에 저장
		String imagePath = FileManager.saveFile(userId, imageFile);

		return postRepository.insertPost(userId, contents, imagePath);
	}
	
	public List<PostDetail> getPostList(int loginUserId) {
		List<Post> postList = postRepository.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			// 게시글 사용자 정보
			User user = userService.getUser(post.getUserId());
			
			// 게시글 좋아요 개수
			int likeCount = likeService.getLikeCount(post.getId());
			
			// 게시글에 로그인한 사용자가 좋아요를 했는지 여부 
			boolean isLike = likeService.isLikeByUserIdAndPostId(loginUserId, post.getId());
			
			// 게시글별 댓글 목록 
			List<CommentDetail> commentList = commentService.getCommentListByPostId(post.getId());
			
			PostDetail postDetail = new PostDetail();	
			postDetail.setId(post.getId());
			postDetail.setContents(post.getContents());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setUserId(post.getUserId());
			postDetail.setUserLoginId(user.getLoginId());
			postDetail.setLikeCount(likeCount); // 하나의 객체로 만들어짐
			postDetail.setLike(isLike);
			postDetail.setCommentList(commentList);
			postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}
	
	// delete
	public int deletePost(int userId, int id) {
		
		// 로그인한 사용자가 작성한 게시글이 아닌경우
		// 정상적으로 삭제가 되었다면 1의 값이 리턴되어야함
		Post post = postRepository.selectPost(id);
		if(userId != post.getUserId()) {
			return -1;
		}
		
		FileManager.removeFile(post.getImagePath()); // 이미지
		
		likeService.deleteLikeByPostId(id); // 게시글 아이디 전달
		commentService.deleteCommentByPostId(id); // 게시글
		
		return postRepository.deletePost(id);
		
	}

}
