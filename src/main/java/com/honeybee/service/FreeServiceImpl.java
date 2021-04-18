package com.honeybee.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.ThumbVO;
import com.honeybee.mapper.FreeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.transaction.annotation.Transactional;

@Log4j
@Service
@AllArgsConstructor
public class FreeServiceImpl implements FreeService {
	
	private FreeMapper mapper;
	
	@Override
	public void register(FreeVO vo) {
		mapper.insert(vo);
	}

	@Transactional
	@Override
	public FreeVO get(Long fno) {

		mapper.hitup(fno, 1);
		return mapper.read(fno);
	}

	@Override
	public boolean modify(FreeVO vo) {
		log.info("modify........." + vo);
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(FreeVO vo) {
		return mapper.delete(vo) == 1;
	}

	@Override
	public List<FreeVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public List<FreeVO> getMyList(String id) {
		return mapper.getMyList(id);
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public void mypostremove(String fno) {
		mapper.mypostremove(fno); //김세훈 테스트
	}

	@Transactional
	@Override
	public int thumbUp(ThumbVO vo) {
		mapper.updateThumbCnt(vo.getFno(), 1);
		return mapper.thumbUp(vo.getId(), vo.getFno());
	}
	
	@Transactional
	@Override
	public int cancelThumbUp(ThumbVO vo) {
		mapper.updateThumbCnt(vo.getFno(), -1);
		return mapper.cancelThumbUp(vo.getId(), vo.getFno());
	}

	@Override
	public boolean check(String id, Long fno) {
		return mapper.checkThumbed(id, fno) == null;
	}

}
