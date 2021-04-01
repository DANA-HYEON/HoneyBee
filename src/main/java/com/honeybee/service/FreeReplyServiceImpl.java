package com.honeybee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.FreeReplyVO;
import com.honeybee.mapper.FreeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FreeReplyServiceImpl implements FreeReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyMapper mapper;

	@Override
	public int register(FreeReplyVO vo) {
		log.info("register...........");
		return mapper.insert(vo);
	}

	@Override
	public FreeReplyVO get(Long frno) {
		log.info("get..........");
		return mapper.read(frno);
	}

	@Override
	public boolean modify(FreeReplyVO vo) {
		log.info("modify........");
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long frno) {
		log.info("remove..........");
		return mapper.delete(frno) == 1;
	}

}
