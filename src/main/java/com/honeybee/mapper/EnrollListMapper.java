package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.EnrollListVO;


public interface EnrollListMapper {

	
	public List<EnrollListVO> getEnrollList();
	
	public List<EnrollListVO> getEnrollStatus(String id);  //내가 신청한 모임의 신청상태
	
	public List<EnrollListVO> getEnrollTitle(String id); //내가 신청한 모임의 이름
	
	
}
