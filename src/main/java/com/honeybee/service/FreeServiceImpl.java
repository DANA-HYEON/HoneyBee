package com.honeybee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;
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
	public boolean remove(FreeVO vo) {
		return mapper.delete(vo) == 1;
	}

	@Override
	public List<FreeVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public FreeVO getMyList(String id) {
		return mapper.getMyList(id);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}


	
}
