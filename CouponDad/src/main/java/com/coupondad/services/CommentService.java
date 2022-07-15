package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Comment;
import com.coupondad.entities.User;

public interface CommentService {
	
	public List<Comment> findAllByPostId(int postId);
	
	public Comment createCommentOnComment(Comment comment, int inReplyToId, String username);
	
	public Comment disableComment(String username, int commentId, int userId);
	
	public User findUserByCommentId(String username, int commentId, int userId);
	
	public User createComment(int postId, Comment comment, String username);

}
