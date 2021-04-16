package com.honeybee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo); //댓글 등록
	
	public int insertReply(ReplyVO vo); //대댓글 등록
	
	public ReplyVO read(Long mRno);
	
	public int delete(Long mRno);
	
	public int update(ReplyVO reply);
	
	//페이징 처리를 위한 cri, 게시물 번호 전달
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("mno") Long mno);
	
	// 세훈 내가 자유게시물에 쓴 댓글 목록 가져오기
	public List<ReplyVO> readmymeetreply(String id);

	// 세훈 내가 댓글 달았던 자유 게시물의 스테이터스 가져오기
	public List<ReplyVO> getmeetreplystatus(String id);

	public void mreplyremove(Long mrno); // 내가 자유게시물에 쓴 댓글 삭제

}
