package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;

public interface MeetMapper {

	public List<MeetVO> getList();


	public void insert(MeetVO meet); //PK값 없는거

	public void insertSelectKey(MeetVO meet); //PK값 있는거

	public MeetVO read(Long gno); //게시물 읽기

	public int delete(Long gno); //게시물 삭제

	public int update(MeetVO meet); //게시물 수정

	//public MeetVO getMyList(String id); UserMapper참조
	
	public List<MeetVO>  getListWithPaging(Criteria cri); //페이징

    public List<MeetVO> getListTest(String id); //내가 속한 모임 리스트 가져오기
	
	public List<MeetVO> getNick(String id); //닉네임 가져오기

	public int getTotalCount(Criteria cri); //전체 게시물 갯수 가져오기
}
