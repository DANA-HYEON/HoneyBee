package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {
	
	private long fno;
	private String id;
	private String title;
	private String content;
	private long hit;
	private int thumb;
	private Date regdt;
	private Date upddt;
	private Date deldt;

}
