package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.MeetVO;

public interface MeetService {
	
	public void register(MeetVO meet);
	
	public MeetVO get(Long gno);
	
	public boolean modify(MeetVO meet);
	
	public boolean remove(Long gno);
	
	public List<MeetVO> getList();

}
