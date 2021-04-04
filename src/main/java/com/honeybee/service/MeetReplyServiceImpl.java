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

}
