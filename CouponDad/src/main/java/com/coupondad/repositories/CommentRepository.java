package com.coupondad.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coupondad.entities.Comment;

public interface CommentRepository extends JpaRepository {
	
	List<Comment> findByPost_Id(int postId);
	
	List<Comment> findByUser_UsernameAndId(String username, int commentId);

}
