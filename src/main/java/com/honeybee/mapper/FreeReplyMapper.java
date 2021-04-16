package com.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.domain.ThumbVO;

public interface FreeReplyMapper {
		
	// Create
	public int insert(FreeReplyVO vo);
	public int insertAnswer(FreeReplyVO vo);
	
	// Read
	public FreeReplyVO read(long frno);
	
	// Update
	public int update(FreeReplyVO vo);
	
	// Delete
	public int delete(Long frno);
	
	public List<FreeReplyVO> getList(@Param("cri") Criteria cri, @Param("fno") Long fno);

	// 내가 자유게시물에 쓴 댓글 목록 가져오기
	public List<FreeReplyVO> readmyfreereply(String id);
	
	// 내가 댓글 달았던 자유 게시물의 스테이터스 가져오기
	public List<FreeReplyVO> getfreereplystatus(String id);
	
	// 댓글 좋아요
	public int thumbUp(@Param("id") String id, @Param("frno") long frno);

	// 댓글 좋아요 취소
	public int cancelThumbUp(@Param("id") String id, @Param("frno") long frno);

	// 댓글 좋아요 여부 체크
	public ThumbVO checkThumbed(@Param("id") String id, @Param("frno") long frno);

	// 자유게시물에 내가 단 댓글 삭제
	public void freplyremove(Long mrno);

	public void updateThumbCnt(@Param("frno") long frno, @Param("amount") int amount);

	// 답글이 달려있는지 여부 체크
	public FreeReplyVO checkReply(long frno);
}
