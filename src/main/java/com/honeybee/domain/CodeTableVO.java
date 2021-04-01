package com.honeybee.domain;

import lombok.Data;

@Data
public class CodeTableVO {
	
	private String cId; //코드유형ID
	private String cType; //코드유형명
	private String cNo; //코드번호
	private String cName; //코드명
	private int order; //정렬순서
	private String exp; //코드설명
}
