package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.MeetVO;
import com.honeybee.mapper.MeetMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MeetServiceImpl implements MeetService {
	
	@Setter(onMethod_ =@Autowired)
	private MeetMapper mapper;


	@Override
	public void register(MeetVO meet) {
		log.info("register................");
		mapper.insertSelectKey(meet);
	}

	@Override
	public MeetVO get(Long gno) {
		log.info("get.....................");
		return mapper.read(gno);
	}

	@Override
	public boolean modify(MeetVO meet) {
		log.info("modify........................." + meet);
		return mapper.update(meet) == 1;
	}

	@Override
	public boolean remove(Long gno) {
		log.info("remove..............." + gno);
		return mapper.delete(gno) == 1;
	}
	
	@Override
	public List<MeetVO> getList() {

		log.info("getlist.............");
		return mapper.getList();
	}
	
	@Override
	public List<MeetVO> getMyList(String id) {
		log.info("getlist.............");
		return mapper.getMyList(id);
	}
	



}
