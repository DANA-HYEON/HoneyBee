package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.UserVO;

public interface UserService {

	public void register(UserVO user);
	
	public UserVO get(String Id);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String Id);
	
	public List<UserVO> getList();
	
	
}
