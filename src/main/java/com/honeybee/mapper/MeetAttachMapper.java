package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.MeetAttachVO;

public interface MeetAttachMapper {
	
	public void insert(MeetAttachVO vo);
	
	public void delete(String uuid);
	
	public List<MeetAttachVO> findByMno(Long Mno);

}
