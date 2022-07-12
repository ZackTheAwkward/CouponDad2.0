package com.coupondad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coupondad.entities.Topic;

public interface TopicRepository extends JpaRepository<Topic, Integer> {

	Topic findByName(String name);
}
