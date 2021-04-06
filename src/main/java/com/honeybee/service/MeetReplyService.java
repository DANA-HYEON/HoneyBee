package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.ReplyVO;

public interface MeetReplyService {
	
	
	public int register(ReplyVO vo); //댓글 등록
	
	public int registerReply(ReplyVO vo); //대댓글 등록
	
	public ReplyVO get(Long mRno); //댓글 가져오기
	
	public int modify(ReplyVO vo); //댓글 수정
	
	public int remove(Long mRno); //댓글 삭제
	
	public List<ReplyVO> getList(Criteria cri, Long mno); //특정 게시물의 댓글 가져오기

}
