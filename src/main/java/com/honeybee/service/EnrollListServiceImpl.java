package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.EnrollListVO;
import com.honeybee.mapper.EnrollListMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class EnrollListServiceImpl implements EnrollListService {

	@Setter(onMethod_ =@Autowired)
	private EnrollListMapper eMapper;

	@Override
	public List<EnrollListVO> getEnrollList() {
		log.info("Service getEnrollList..............");
		return eMapper.getEnrollList();
	}
	
	@Override
	public List<EnrollListVO> getEnrollStatus(String id){
		log.info("service getEnrollStatus........");
		return eMapper.getEnrollStatus(id);
	}
	
	@Override
	public List<EnrollListVO> getEnrollTitle(String id){
		log.info("service getEnrollStatus........");
		return eMapper.getEnrollTitle(id);
	}
			
		
	
	
	
	
}
