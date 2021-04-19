package com.honeybee.service;

import java.util.List;

import com.honeybee.mapper.FreeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.domain.ThumbVO;
import com.honeybee.mapper.FreeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.transaction.annotation.Transactional;

@Service
@Log4j
public class FreeReplyServiceImpl implements FreeReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private FreeMapper freeMapper;

	@Transactional
	@Override
	public int register(FreeReplyVO vo) {
		log.info("register..........." + vo);

		freeMapper.updateReplyCnt(vo.getFno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public FreeReplyVO get(Long frno) {
		log.info("get..........");
		return mapper.read(frno);
	}

	@Override
	public boolean modify(FreeReplyVO vo) {
		log.info("modify........");
		return mapper.update(vo) == 1;
	}

	@Transactional
	@Override
	public boolean remove(Long frno) {
		log.info("remove.........." + frno);

		FreeReplyVO vo = mapper.read(frno);

		freeMapper.updateReplyCnt(vo.getFno(), -1);
		return mapper.delete(frno) == 1;
	}
	
	@Override
	public List<FreeReplyVO> readmyfreereply(String id){ //내가 자유게시물에 쓴 댓글 목록 가져오기
		log.info("freereplyservice.............");
		return mapper.readmyfreereply(id);
	}
	
	@Override
	public List<FreeReplyVO> getfreereplystatus(String id) { //내가 댓글 단 자유게시물의 상태 가져오기.
		log.info("getreststaus.................");
		return mapper.getfreereplystatus(id);
	}

	@Override
	public List<FreeReplyVO> getList(Criteria cri, Long fno) {
		return mapper.getList(cri, fno);
	}

	@Transactional
	@Override
	public int registerAnswer(FreeReplyVO vo) {

		freeMapper.updateReplyCnt(vo.getFno(), 1);
		return mapper.insertAnswer(vo);
	}

	@Transactional
	@Override
	public int thumbUp(ThumbVO vo) {
		mapper.updateThumbCnt(vo.getFrno(), 1);
		return mapper.thumbUp(vo.getId(), vo.getFrno());
	}

	@Transactional
	@Override
	public int cancelThumbUp(ThumbVO vo) {
		mapper.updateThumbCnt(vo.getFrno(), -1);
		return mapper.cancelThumbUp(vo.getId(), vo.getFrno());
	}

	@Override
	public boolean check(String id, Long frno) {
		return mapper.checkThumbed(id, frno) == null;
	}

	@Override
	public void freplyremove(Long mrno) { // 내가 자유게시물에 쓴 댓글 삭제
		mapper.freplyremove(mrno);
	}

	@Override
	public boolean checkReply(Long frno) {
		return mapper.checkReply(frno) == null ? true : false; // 답글 없으면 true
	}


}
