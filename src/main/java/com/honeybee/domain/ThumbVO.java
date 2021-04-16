package com.honeybee.domain;

import lombok.Data;

@Data
public class ThumbVO {


	private String thumbno;  // 찜 및 좋아요 번호 // 회원id + 게시물번호
	private String id; //회원 id
	private Long mno; //모임게시물 번호
	private Long fno; // 자유게시물 번호
	private Long frno; // 자유게시물 댓글 번호


}
