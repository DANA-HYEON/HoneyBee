package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MsgVO {

	private	Long msgno;  
	private String id;
	private String id2;
	private String content;
	private Date regDt;
	private Date delDt;

}
