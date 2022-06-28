package com.coupondad.services;

import com.coupondad.entities.User;

public interface AuthService {
	public User register(User user);
	public User getUserByUsername(String username);


}
