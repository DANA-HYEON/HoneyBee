package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.SubscribeVO;

public interface SubscribeMapper {
	
	public List<SubscribeVO> getSubscribeList(String id); //내가 구독한 회원 리스트 가져오기	

}
