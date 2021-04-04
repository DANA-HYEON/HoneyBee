package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.EnrollListVO;

public interface EnrollListService {

	
	public List<EnrollListVO> getEnrollList();
	
	public List<EnrollListVO> getEnrollStatus(String id);
	
	public List<EnrollListVO> getEnrollTitle(String id);
}
