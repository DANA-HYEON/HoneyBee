package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MeetReplyVO {
	private int GRNO; //댓글번호
	private int GNO; //모임게시물번호
	private String ID; //회원ID
	private int GRNO2; //대댓글번호
	private String REPLY; //댓글내용
	private int LAYER; //대댓글계층
	private int BUNDLE; //댓글그룹
	private int BUNORDER; //댓글그룹순서
	private String NICK; //닉네임
	private Date REGDT; //댓글작성일자
	private Date UPTDT; //댓글수정일자
	private Date DELDT; //댓글삭제일자
}
