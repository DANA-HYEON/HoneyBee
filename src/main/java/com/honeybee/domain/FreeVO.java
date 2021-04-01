package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {
	
	private Long fno;
	private String id;
	private String title;
	private String content;
	private Long hit;
	private int thumb;
	private Date regdt;
	private Date upddt;
	private Date deldt;

}
