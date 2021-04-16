package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.InquiryVO;

public interface InquiryService {
	
	// 자유게시물 신고
	public int reportFno(InquiryVO vo);
	
	// 자유게시물 댓글 신고
	public int reportFrno(InquiryVO vo);
	
	public InquiryVO get(Long ino);
	
	public boolean remove(Long ino);
	
	public List<InquiryVO> getReportList();
	
	public List<InquiryVO> getInquiryList();

}
