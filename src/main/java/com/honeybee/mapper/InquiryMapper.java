package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.InquiryVO;

public interface InquiryMapper {
	
	// CREATE
	// 자유게시물 신고
	public int reportBadFno(InquiryVO vo);
	// 자유게시물 댓글 신고
	public int reportBadFrno(InquiryVO vo);
	
	// READ
	public InquiryVO read(long ino);
	
	// 신고/문의는 수정 불가처리.
	
	// DELETE
	public int delete(long ino);
	
	// 신고 리스트 확인
	public List<InquiryVO> getReportList();
	
	// 문의 리스트 확인
	public List<InquiryVO> getInquiryList();
}
