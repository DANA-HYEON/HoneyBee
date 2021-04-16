package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.CodeTableVO;

public interface CodeTableService{
	
	public List<CodeTableVO> getCatList();
	
	public List<CodeTableVO> upperregion(); 
	
	public List<CodeTableVO> detailregion(String cid);
}
