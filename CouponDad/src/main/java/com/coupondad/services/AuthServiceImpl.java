package com.coupondad.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.coupondad.entities.User;
import com.coupondad.repositories.UserRepository;

public class AuthServiceImpl implements AuthService {
	
	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private UserRepository userRepo;

	@Override
	public User register(User user) {
		user.setPassword(encoder.encode(user.getPassword()));
		user.setActive(true);
		user.setRole("standard");
		
		userRepo.saveAndFlush(user);
		
		return user;
		
	}

	@Override
	public User getUserByUsername(String username) {
		return userRepo.findByUsername(username);
	}

}
