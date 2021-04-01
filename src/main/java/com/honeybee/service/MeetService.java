package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.MeetVO;

public interface MeetService {
	
	public void register(MeetVO meet);
	
	public MeetVO get(Long mno);
	
	public boolean modify(MeetVO meet);
	
	public boolean remove(Long mno);
	
	public List<MeetVO> getList();
	
	public List<MeetVO> getMyList(String id);
	

}
