package com.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;

public interface FreeReplyMapper {
		
	// Create
	public int insert(FreeReplyVO vo);
	public int insertAnswer(FreeReplyVO vo);
	
	// Read
	public FreeReplyVO read(Long frno);
	
	// Update
	public int update(FreeReplyVO vo);
	
	// Delete
	public int delete(Long frno);
	
	public List<FreeReplyVO> getList(@Param("cri") Criteria cri, @Param("fno") Long fno);

	// 내가 자유게시물에 쓴 댓글 목록 가져오기
	public List<FreeReplyVO> readmyfreereply(String id);
	
	// 내가 댓글 달았던 자유 게시물의 스테이터스 가져오기
	public List<FreeReplyVO> getfreereplystatus(String id);
	

	
	
}
