package com.honeybee.domain;

import lombok.Data;

@Data
public class SubscribeVO {
	
	private Long subno;  //구독SEQ
	private String id; //회원ID
	private String id2; //모임개설자

}
