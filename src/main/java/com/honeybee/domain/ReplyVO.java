package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long mno; //모임게시물번호
	private Long mRno; //댓글번호
	
	private String id; //회원id
	private String nick; //회원 닉네임
	private Long mRno2; //대댓글번호
	private String reply; //댓글내용
	private int layer; //대댓글계층
	private int bundle; //댓글그룹
	private int bunOrder; //댓글그룹순서
	private Date regDt; //댓글작성일자
	private Date uptDt; //댓글수정일자
	private Date DelDt; //댓글삭제일자
}
