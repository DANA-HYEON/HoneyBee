package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.ThumbVO;


public interface ThumbMapper {

	public List<ThumbVO> getThumbList(String id); //내가 찜한 모임의 목록 가져오기
	
	public List<ThumbVO> getThumbRegDate(String id); //내가 찜한 모임의 등록날짜 가져오기
}
