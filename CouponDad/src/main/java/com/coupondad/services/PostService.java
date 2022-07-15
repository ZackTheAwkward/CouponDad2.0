package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Post;

public interface PostService {

	public List<Post> indexAll();

	public List<Post> indexByUsername(String username);

	public Post findById(String username, int postId);

	public Post addPost(String username, Post post);

	public Post updatePost(String username, Post post, int postId);

	public Post disablePost(String username, Post post, int postId);

}
