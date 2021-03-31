package com.honeybee.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MeetVO {
	
	private long gno; //모임번호
	private String cid; //모임카테고리
	private String cid2; //모집상태
	private String id; //회원ID
	private String title; //모임제목
	private String smry; //모임요약내용
	private String content; //모임상세내용(NCLUB)
	private String startDt; //모임시작일자
	private String endDt; //모임종료일자
	private String recsDt; //모임모집시작일자
	private String receDt; //모임모집종료일자
	private int recNo; //모집인원
	private int currNo; //현재인원
	private int cnclNo; //취소인원
	private int hit; //조회수
	private int thumb; //찜수
	private String charge; //유무료구분
	private String onoff; //온오프라인 여부
	private String place; //모임장소
	private String link; //링크
	private String img; //대표이미ㅣ
	private Date regDt; //모임개설일자
	private Date updDt; //모임수정일자
	private Date delDt; //모임삭제일자
}
