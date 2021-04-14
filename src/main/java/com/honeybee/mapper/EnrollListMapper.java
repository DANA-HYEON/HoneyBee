package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.EnrollListVO;


public interface EnrollListMapper {

	
	public List<EnrollListVO> getEnrollList();
	
	public List<EnrollListVO> getEnrollStatus(String id);  //내가 신청한 모임의 신청상태
	
	public List<EnrollListVO> getEnrollTitle(String id); //내가 신청한 모임의 이름
	
	public int insert(EnrollListVO vo); //다현 모임게시판에서 신청하기 누를 시 insert 
	
	public EnrollListVO checkApplyList(String eno); //다현 이미 신청되어있는지 체크
	
	public int delete(EnrollListVO vo); //다현 삭제
}