package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	
	private Long ino; // 신고/문의번호
	private String id; // 신고/문의자
	
	private int cat; // 신고/문의분류
	private String title; //신고/문의제목
	private String content; // 신고/문의내용
	
	private char status; // 신고/문의처리상태
	private String answer; // 신고/문의답변
		
	private Long mno; // 신고된 모임번호  
	private Long mrno; // 신고된 댓글번호
	private Long fno; // 신고된 자유게시물번호
	private Long frno;
	
	private Date regdt; //신고/문의등록일자
	private Date deldt; // 신고/문의삭제일자
	

}
