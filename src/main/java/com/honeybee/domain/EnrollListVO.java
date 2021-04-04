package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EnrollListVO {
	
	private String id;  //회원 id
	private String cid; //모임카테고리
	private String cid2; // 신청상태
	private Long mno; //모임게시물번호
	private Date edt; //모임신청일자
	private Date cncldt; //모임취소일자
	private Date rjtdt; //모임거절일자
	
}
