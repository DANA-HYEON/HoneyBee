package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.CodeTableVO;

public interface CodeTableMapper {
	
	public List<CodeTableVO> getCatList(); //카테고리 리스트 가져오기
}
