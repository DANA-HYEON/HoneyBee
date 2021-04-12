package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;

public interface MeetMapper {

	public List<MeetVO> getList(); 
	
	public void insert(MeetVO meet); //PK값 없는거

	public void insertSelectKey(MeetVO meet); //PK값 있는거

	public MeetVO read(Long mno); //게시물 읽기

	public int delete(Long mno); //게시물 삭제

	public int update(MeetVO meet); //게시물 수정
	
	public List<MeetVO>  getListWithPaging(Criteria cri); //페이징 + 최신순

    public List<MeetVO> getListTest(String id); //내가 속한 모임 리스트 가져오기
	
	public List<MeetVO> getNick(String id); //닉네임 가져오기

	public int getTotalCount(Criteria cri); //전체 게시물 갯수 가져오기
	
	public int getTotalCountWithCat(Criteria cri); //카테고리 별 전체 게시물 갯수 가져오기
	
	public List<MeetVO> getListWithPagingAndCat(Criteria cri); //카테고리, 페이징한 리스트 가져오기
	
	public String getCategoryName(Long mno); //모임 게시물 카테고리 cid에 따라 코드테이블의 cname가져오기

	public List<MeetVO> getListWithCategory(String cid); //내가 개설한 모임을 카테고리별로 가져오기


}
