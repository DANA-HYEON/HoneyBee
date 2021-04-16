package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.CodeTableVO;
import com.honeybee.mapper.CodeTableMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class CodeTableServiceImpl implements CodeTableService{
	
	@Setter(onMethod_ =@Autowired)
	private CodeTableMapper cMapper;

	@Override
	public List<CodeTableVO> getCatList() {
		log.info("Service getCategoryList..............");
		return cMapper.getCatList();
	}
	
	@Override
	public List<CodeTableVO> upperregion(){
		log.info("Service getUpperregion..............");
		return cMapper.upperregion();
	}
	
	@Override
	public List<CodeTableVO> detailregion(String cid){
		log.info("Service getdetailregion..............");
		return cMapper.detailregion(cid);
	}
	

}
