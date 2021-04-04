package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.ThumbVO;

public interface ThumbService {

	public List<ThumbVO> getThumbList(String id);
	
	public List<ThumbVO> getThumbRegDate(String id);

}
