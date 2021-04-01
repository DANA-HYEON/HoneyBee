package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MeetReplyVO {

	private int mrno; //댓글번호
	private int mno; //모임게시물번호

	private String id; //회원ID
	private int grno2; //대댓글번호
	private String reply; //댓글내용
	private int layer; //대댓글계층
	private int bundle; //댓글그룹
	private int bunOrder; //댓글그룹순서
	private String nick; //닉네임
	private Date regDt; //댓글작성일자
	private Date uptDt; //댓글수정일자
	private Date delDt; //댓글삭제일자

}
