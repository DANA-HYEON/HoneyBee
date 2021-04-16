package com.honeybee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honeybee.domain.UserVO;

public interface UserService {

	public void register(UserVO user);
	
	public UserVO get(String Id);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String Id);
	
	public List<UserVO> getList();
	
	public UserVO getMyList(String id);
	
	public void updateimg(UserVO uvo);

	public UserVO getimg(String ID);

	public void infomodify(UserVO uvo);

	public void nickmodify(UserVO uvo);

	public int nickChk(String nick);

	public boolean checkId(String id);

}
