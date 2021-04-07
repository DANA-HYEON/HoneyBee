package com.honeybee.service;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;

public interface FreeReplyService {
	
	public int register(FreeReplyVO vo);
	
	public int registerAnswer(FreeReplyVO vo);
	
	public FreeReplyVO get(Long frno);
	
	public boolean modify(FreeReplyVO vo);
	
	public boolean remove(Long frno);
	
	public List<FreeReplyVO> getList(Criteria cri, Long fno);
	
	public List<FreeReplyVO> readmyfreereply(String id); //내가 자유게시물에 쓴 댓글 목록 가져오기
	
	public List<FreeReplyVO> getfreereplystatus(String id); //내가 자유게시물에 쓴 댓글이 달린 게시글 상태 조회
	
	
	
}
