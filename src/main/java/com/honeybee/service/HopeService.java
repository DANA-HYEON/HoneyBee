package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.HopeVO;

public interface HopeService {
	
	public List<HopeVO> getList(String id);
	
	public void delete(String id); //기존 관심목록 지우기
	
	public int hopeInsert(HopeVO hvo); //관심지역, 관심카테고리 입력하기
	
	public String cidSearch(String cname); //cid가져오기


}
