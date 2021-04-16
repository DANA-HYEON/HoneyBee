package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.ReplyVO;
import com.honeybee.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MeetReplyServiceImpl implements MeetReplyService {

	@Setter(onMethod_ =@Autowired)
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("register..............");
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long mRno) {
		log.info("get............" + mRno);
		return mapper.read(mRno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify............" + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(Long mRno) {
		log.info("remove........." + mRno);
		return mapper.delete(mRno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long mno) {
		log.info("get Reply List of a board " + mno);
		return mapper.getListWithPaging(cri, mno);
	}

	@Override
	public int registerReply(ReplyVO vo) {
		log.info("register Reply..............");
		return mapper.insertReply(vo);
	}

	@Override // 세훈 내가 자유게시물에 쓴 댓글 목록 가져오기
	public List<ReplyVO> readmymeetreply(String id) {
		log.info("readmymeetreply...................");
		return mapper.readmymeetreply(id);
	}

	@Override // 세훈 내가 댓글 달았던 자유 게시물의 스테이터스 가져오기
	public List<ReplyVO> getmeetreplystatus(String id) {
		log.info("getmeetreplystatus................");
		return mapper.getmeetreplystatus(id);
	}

	@Override // 내가 모임게시물에 쓴 댓글 삭제
	public void mreplyremove(Long mrno) {
		log.info("mreplyremove................");
		mapper.mreplyremove(mrno);
	}
}
