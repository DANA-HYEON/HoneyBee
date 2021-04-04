package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;

public interface FreeMapper {

	public List<FreeVO> getList();
	
	// CREATE
	public int insert(FreeVO vo);
	
	// READ
	public FreeVO read(Long fno);
	
	// UPDATE
	public int update(FreeVO vo);
	
	// DELETE
	public int delete(FreeVO vo);
	
	public FreeVO getMyList(String id);
	
	// Paging
	public List<FreeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
}
