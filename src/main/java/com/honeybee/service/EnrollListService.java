package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.EnrollListVO;
import com.honeybee.domain.ThumbVO;

public interface EnrollListService {

	
	public List<EnrollListVO> getEnrollList();
	
	public List<EnrollListVO> getEnrollStatus(String id);
	
	public List<EnrollListVO> getEnrollTitle(String id);
	
	public int insert(EnrollListVO vo); //다현
	
	public EnrollListVO checkApplyList(String eno); //신청 되어있는지 체크
	
	public int delete(EnrollListVO vo); //신청 취소
}
