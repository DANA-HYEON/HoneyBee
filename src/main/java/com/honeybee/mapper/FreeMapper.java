package com.honeybee.mapper;

import java.util.List;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.ThumbVO;

import org.apache.ibatis.annotations.Param;

public interface FreeMapper {

	public List<FreeVO> getList();
	
	// CREATE
	public int insert(FreeVO vo);
	
	// READ
	public FreeVO read(Long fno);
	
	// UPDATE
	public int update(FreeVO vo);

	// DELETE
	public int delete(Long fno);
	
	public List<FreeVO> getMyList(String id);
	
	// Paging
	public List<FreeVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void mypostremove(String fno); //김세훈 테스트

	// 게시글 목록에 게시물별 댓글 개수 보이게
	public void updateReplyCnt(@Param("fno") Long fno, @Param("amount") int amount);

	// 게시물 조회수
	public void hitup(@Param("fno") Long fno, @Param("amount") int amount);
	
	// 게시물 좋아요
	public int thumbUp(@Param("id") String id, @Param("fno") Long fno);
	
	// 게시물 좋아요 취소
	public int cancelThumbUp(@Param("id") String id, @Param("fno") Long fno);
	
	// 특정 회원이 게시물 좋아요 했는지 여부 확인
	public ThumbVO checkThumbed(@Param("id") String id, @Param("fno") Long fno);
	
	// 게시물 좋아요 수 조회
	public void updateThumbCnt(@Param("fno") Long fno, @Param("amount") int amount);
	
}