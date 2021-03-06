package com.coupondad.controllers;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.coupondad.entities.User;
import com.coupondad.services.UserService;

@RestController
@CrossOrigin({ "*", "http://localhost:8080" })
public class UserController {
	@Autowired
	private UserService userService;

	// SMOKE TEST ONLY, DELETE/COMMENT OUT LATER
	@GetMapping("test/users/{userId}")
	public User getUserForTest(@PathVariable Integer userId, HttpServletResponse res) {
		User user = userService.getUserById(userId);
		if (user == null) {
			res.setStatus(404);
		}
		return user;
	}

}
