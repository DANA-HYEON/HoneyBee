package com.honeybee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.honeybee.domain.SubscribeVO;
import com.honeybee.mapper.SubscribeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SubscribeServiceImpl implements SubscribeService {
	
	private SubscribeMapper smapper;

	@Override
	public List<SubscribeVO> getSubscribeList(String id) {
		log.info("SubscribeList................");
		return smapper.getSubscribeList(id);
	}
	
	

}
