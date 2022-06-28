package com.coupondad.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coupondad.entities.User;
import com.coupondad.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;

	@Override
	public User getUserById(int userId) {
		Optional<User> userOpt = userRepo.findById(userId);
		if (userOpt.isPresent()) {

			return userOpt.get();
		}
		return null;

	}

}
