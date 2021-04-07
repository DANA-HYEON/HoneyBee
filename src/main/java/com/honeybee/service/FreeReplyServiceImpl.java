package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.mapper.FreeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FreeReplyServiceImpl implements FreeReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyMapper mapper;

	@Override
	public int register(FreeReplyVO vo) {
		log.info("register...........");
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

	@Override
	public boolean remove(Long frno) {
		log.info("remove..........");
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

	@Override
	public int registerAnswer(FreeReplyVO vo) {
		return mapper.insertAnswer(vo);
	}
	

}
