package com.honeybee.mapper;

import java.util.List;


import com.honeybee.domain.MeetVO;

public interface MeetMapper {
	
	public List<MeetVO> getList();
	
	public void insert(MeetVO meet); //PK값 모름
	 
	public void insertSelectKey(MeetVO meet); //PK값 체크가능
	
	public MeetVO read(Long gno);
	
	public int delete(Long gno);
	
	public int update(MeetVO meet);

}
