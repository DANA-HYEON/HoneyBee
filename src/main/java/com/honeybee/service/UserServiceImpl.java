package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.UserVO;
import com.honeybee.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public void register(UserVO user) {
		
		log.info("register........"+user);
		
		mapper.insert(user);
	}
	
	
	@Override
	public List<UserVO> getList(){
		log.info("getlist.............");
		return mapper.getList();
	}
	
	@Override
	public UserVO get(String Id) {
		log.info("get........" + Id);
		return mapper.read(Id);
	}
	
	@Override
	public boolean modify(UserVO user) {
		log.info("modify........" + user);
		
		return mapper.update(user) ==1;
	}
	
	public boolean remove(String Id) {
		
		log.info("remove."+Id);
		
		return mapper.delete(Id)==1;
	}
	
	
	

}
