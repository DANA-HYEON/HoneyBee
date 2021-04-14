package com.honeybee.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {
	
	// 페이징
	private int pageNum;
	private int amount;
	
	// 검색
	private String type;
	private String keyword;
	
	//카테고리
    private String cid;
    
    //정렬기준
    private String order;
	
	public Criteria() {
		this(1, 10, "latest");
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public Criteria(int pageNum, int amount, String order) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.order = order;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}

}
