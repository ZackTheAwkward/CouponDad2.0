package com.coupondad.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coupondad.entities.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByUsername(String username);
	

}
