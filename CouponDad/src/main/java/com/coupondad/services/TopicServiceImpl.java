package com.coupondad.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.coupondad.entities.Topic;
import com.coupondad.repositories.TopicRepository;

public class TopicServiceImpl implements TopicService {
	
	@Autowired
	private TopicRepository topicRepo;

	@Override
	public List<Topic> findAll() {
		return topicRepo.findAll();
	}

	@Override
	public Topic findByName(String name) {
		return topicRepo.findByName(name);
	}

}
