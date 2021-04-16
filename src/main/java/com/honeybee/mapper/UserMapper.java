package com.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honeybee.domain.UserVO;

public interface UserMapper {

	public List<UserVO> getList();
	
	public void insert(UserVO user);
	
	public UserVO read(String id);
	
	public int delete(String id);
	
	public int update(UserVO user);
	
	public UserVO getMyList(String id);

	public String checkId(String id);
	
	public void updateimg(@Param("id") String id, @Param("img") String FileName);

	public UserVO getimg(String ID);

	public void infomodify(UserVO uvo);

	public void nickmodify(UserVO uvo);

	public int nickChk(String nick);

}
