package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;

public interface MeetService {

	public void register(MeetVO meet);

	public MeetVO get(Long mno);

	public boolean modify(MeetVO meet);

	public boolean remove(Long mno);

	public List<MeetVO> getList();

  public MeetVO getMyList(String id);

	public List<MeetVO> getList(Criteria cri); //페이징 리스트 가져오기

	public int getTotal(Criteria cri); //게시물 전체 갯수 가져오기
	
	public List<MeetVO> getListTest(String id);
	
	public List<MeetVO> getNick(String id);

}
