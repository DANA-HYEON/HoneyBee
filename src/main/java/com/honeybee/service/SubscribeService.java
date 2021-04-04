package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.SubscribeVO;

public interface SubscribeService {

	
	public List<SubscribeVO> getSubscribeList(String id);
}
