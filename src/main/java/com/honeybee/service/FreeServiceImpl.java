package com.honeybee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.honeybee.domain.FreeVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.mapper.FreeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FreeServiceImpl implements FreeService {
	
	private FreeMapper mapper;
	
	@Override
	public void register(FreeVO vo) {
		mapper.insert(vo);
	}

	@Override
	public FreeVO get(Long fno) {
		return mapper.read(fno);
	}

	@Override
	public boolean modify(FreeVO vo) {
		log.info("modify........." + vo);
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long fno) {
		return mapper.delete(fno) == 1;
	}

	@Override
	public List<FreeVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<FreeVO> getMyList(String id) {
		return mapper.getMyList(id);
	}


	
}
