package com.honeybee.mapper;

import java.util.List;


import com.honeybee.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();
	
	public void insert(UserVO user);
	
	public UserVO read(String id);
	
	public int delete(String id);
	
	public int update(UserVO user);
	
	public UserVO getMyList(String id);
	
	public String checkId(String id);
	
	
}
