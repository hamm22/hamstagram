package com.ham.sns.comment.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter

public class CommentDetail {

	private int id; // pk
	private int userId;
	private String userLoginId;
	private String contents;
	
}
