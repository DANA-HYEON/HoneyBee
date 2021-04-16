package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.CodeTableVO;

public interface CodeTableMapper {
	
	public List<CodeTableVO> getCatList(); //카테고리 가져오기
	
	public List<CodeTableVO> upperregion(); //시,도 가져오기
	
	public List<CodeTableVO> detailregion(String cid); //세부 지역 가져오기
}
