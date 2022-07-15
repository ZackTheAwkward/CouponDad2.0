package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Comment;
import com.coupondad.entities.User;

public class CommentServiceImpl implements CommentService {

	@Override
	public List<Comment> findAllByPostId(int postId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment createCommentOnComment(Comment comment, int inReplyToId, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment disableComment(String username, int commentId, int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserByCommentId(String username, int commentId, int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createComment(int postId, Comment comment, String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
