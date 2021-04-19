package com.honeybee.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String uuid;
	private String uploadPath; //업로드된 경로
	private String fileName; //파일이름
	private boolean image; // 파일 타입이 이미지 여부인지 확인

	private Long fno; // 자유게시물 번호
	private Long mno; // 모임게시물 번호
	private Long ino; // 문의글 번호

}
