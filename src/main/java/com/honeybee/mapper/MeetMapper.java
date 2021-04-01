package com.honeybee.mapper;

import java.util.List;


import com.honeybee.domain.MeetVO;

public interface MeetMapper {
	
	public List<MeetVO> getList();
	
	public void insert(MeetVO meet); //PK값 없는거
	 
	public void insertSelectKey(MeetVO meet); //PK값 있는거
	
	public MeetVO read(Long gno);
	
	public int delete(Long gno);
	
	public int update(MeetVO meet);

	public List<MeetVO> getMyList(String id);

}
