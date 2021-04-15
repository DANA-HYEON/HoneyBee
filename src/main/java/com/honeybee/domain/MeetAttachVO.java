package com.honeybee.domain;

import java.util.Date;

public class MeetAttachVO {
	
	private String uuid;
	private String fileName; //첨부파일 이름
	private String uploadPath; //업로드경로
	private char fileType; //첨부파일 타입
	private Date regDt; //첨부파일 등록일
	private Date delDt; //첨부파일 삭제일
	
	private Long mno; //모임게시물 번호
}
