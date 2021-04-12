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
	public int updateHit(FreeVO vo);
	
	// DELETE
	public int delete(FreeVO vo);
	
	public List<FreeVO> getMyList(String id);
	
	// Paging
	public List<FreeVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public void mypostremove(String fno); //김세훈 테스트
	
}