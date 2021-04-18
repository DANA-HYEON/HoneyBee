package com.honeybee.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName; //파일이름
	private String uploadPath; //업로드된 경로

	private String uuid;
	private boolean image;

	private Long fno;
	private Long mno;
	private Long ino;

}
