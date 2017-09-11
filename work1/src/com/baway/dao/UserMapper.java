package com.baway.dao;

import java.util.List;

import com.baway.pojo.User;

public interface UserMapper {

	public void addUser(User user);

	public List<User> selectUser();
	
}
