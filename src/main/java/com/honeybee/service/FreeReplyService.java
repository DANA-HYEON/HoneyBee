package com.honeybee.service;

import com.honeybee.domain.FreeReplyVO;

public interface FreeReplyService {
	
	public int register(FreeReplyVO vo);
	
	public FreeReplyVO get(Long frno);
	
	public boolean modify(FreeReplyVO vo);
	
	public boolean remove(Long frno);
	
//	public List<FreeReplyVO> getList()

}
