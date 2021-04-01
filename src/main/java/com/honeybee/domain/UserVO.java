package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	
	private String id;
	private String cid;
	private String pwd;
	private String name;
	private String birth;
	private int sex;
	private String email;
	private String telno;
	private String url;
	private String rcvyn;
	private String nick;
	private double scor;
	private String img;
	private Date regdt;
	private Date upddt;
	private Date deldt;
	
	

}
