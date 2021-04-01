package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.FreeVO;

public interface FreeService {
	
	public void register(FreeVO vo);
	
	public FreeVO get(Long fno);
	
	public boolean modify(FreeVO vo);
	
	public boolean remove(Long fno);
	
	public List<FreeVO> getList();
	
	public List<FreeVO> getMyList(String id);

}
