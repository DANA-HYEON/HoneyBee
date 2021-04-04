package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.ThumbVO;
import com.honeybee.mapper.ThumbMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ThumbServiceimpl implements ThumbService {

	@Setter(onMethod_ =@Autowired)
	private ThumbMapper tMapper;
	
	
	@Override
	public List<ThumbVO> getThumbList(String id) {
		log.info("Service getThumbList..............");
		return tMapper.getThumbList(id);
	}
	
	@Override
	public List<ThumbVO> getThumbRegDate(String id){
		log.info("Service getThumbList..............");
		return tMapper.getThumbRegDate(id);
}
}
