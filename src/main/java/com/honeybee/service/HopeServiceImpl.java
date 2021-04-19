package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.HopeVO;
import com.honeybee.mapper.CodeTableMapper;
import com.honeybee.mapper.HopeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class HopeServiceImpl implements HopeService {
	
	
	@Setter(onMethod_ =@Autowired)
	private HopeMapper hMapper;
	
	@Override
	public List<HopeVO> getList(String id){
		return hMapper.getList(id);
	}
	
	@Override
	public int hopeInsert(HopeVO hvo) {
		return hMapper.hopeInsert(hvo);  //관심지역, 관심카테고리 입력하기
	}
	
	
	@Override
	public String cidSearch(String cname) {
		return hMapper.cidSearch(cname);   //cid가져오기
	}
	
	@Override
	public void delete(String id) {
		hMapper.delete(id);//기존 관심목록 지우기
	}


}
