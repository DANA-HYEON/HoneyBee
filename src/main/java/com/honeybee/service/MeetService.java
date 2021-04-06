package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;

public interface MeetService {

	public void register(MeetVO meet); //게시물 등록
 
	public MeetVO get(Long mno); //게시물 읽어오기

	public boolean modify(MeetVO meet); //게시물 수정

	public boolean remove(Long mno); //게시물 삭제

	public List<MeetVO> getList(); //게시물 전체 갯수 가져오기

    //public MeetVO getMyList(String id); UserMapper참조

	public List<MeetVO> getList(Criteria cri); //페이징 리스트 가져오기
	
	public List<MeetVO> getListWithCat(Criteria cri); //페이징, 카테고리 리스트 가져오기

	public int getTotal(Criteria cri); //게시물 전체 갯수 가져오기(with criteria 페이징 조건)
	
	public int getTotalWithCat(Criteria cri); //게시물 전체 갯수 가져오기(with category)
	
	public List<MeetVO> getListTest(String id); //내가 속한 모임 리스트 가져오기
	
	public List<MeetVO> getNick(String id); //닉네임 가져오기

}
