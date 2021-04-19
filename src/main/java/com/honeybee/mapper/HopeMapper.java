package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.HopeVO;

public interface HopeMapper {
	
	public List<HopeVO> getList(String id); // 관심 지역 관심 카테고리 가져오기.
	
	public int hopeInsert(HopeVO hvo); //관심지역, 관심카테고리 입력하기
	
	public String cidSearch(String cname); //cid가져오기
	
	public void delete(String id); //기존 관심목록 지우기
}
