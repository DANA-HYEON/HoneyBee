package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeReplyVO { // 자유게시물 댓글
	
	private Long frno; // 댓글번호
	private Long frno2; // 답글 대상이 되는 댓글번호
	private Long fno; // 댓글이 달린 자유게시물 번호
	
	private String id; // 댓글 작성자
	private String nick; // 댓글 작성자 닉네임
	private String reply; // 댓글 내용
	
	private int thumb; // 댓글 좋아요 수
	private int layer; // 댓글 깊이
	private int bundle; // 댓글 묶음
	private double bunorder; // 댓글 묶음 순서
	
	private Date regdt; // 작성일자
	private Date uptdt; // 수정일자
	private Date deldt; // 삭제일자
	

}
