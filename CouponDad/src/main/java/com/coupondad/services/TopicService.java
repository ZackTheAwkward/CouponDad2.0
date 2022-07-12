package com.coupondad.services;

import java.util.List;

import com.coupondad.entities.Topic;

public interface TopicService {
	
	public List<Topic> findAll();
	
	public Topic findByName(String name);
	
	

}
