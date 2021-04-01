package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.FreeReplyVO;

public interface FreeReplyMapper {
		
	// Create
	public int insert(FreeReplyVO vo);
	
	// Read
	public FreeReplyVO read(Long frno);
	
	// Update
	public int update(FreeReplyVO vo);
	
	// Delete
	public int delete(Long frno);

}
