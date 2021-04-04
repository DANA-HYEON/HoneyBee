package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;

public interface MeetMapper {

	public List<MeetVO> getList();


	public void insert(MeetVO meet); //PK값 없는거

	public void insertSelectKey(MeetVO meet); //PK값 있는거

	public MeetVO read(Long gno);

	public int delete(Long gno);

	public int update(MeetVO meet);

	public List<MeetVO> getMyList(String id);
	
	public List<MeetVO>  getLsitWithPaging(Criteria cri); //페이징

  public List<MeetVO> getListTest(String id);
	
	public List<MeetVO> getNick(String id);

	public int getTotalCount(Criteria cri); //전체 게시물 갯수 가져오기
}
