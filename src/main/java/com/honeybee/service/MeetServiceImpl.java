package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.Criteria;
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
	

//	@Override
//	public MeetVO getMyList(String id) {
//		log.info("getlist.............");
//		return mapper.getMyList(id);
//		
//	}

	@Override
	public List<MeetVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public List<MeetVO> getListWithCat(Criteria cri) {
		log.info("get List with Category and criteria : " + cri);
		
		return mapper.getListWithPagingAndCat(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public int getTotalWithCat(Criteria cri) {
		log.info("get total count with category");
		return mapper.getTotalCountWithCat(cri);
	}
	
	
	@Override
	public List<MeetVO> getListTest(String id) {
		log.info("getlist.............");
		return mapper.getListTest(id);
	}
	
	@Override
	public List<MeetVO> getNick(String id) {
		log.info("getNick.............");
		return mapper.getNick(id);
	}

	@Override
	public String getCategoryName(Long mno) {
		log.info("get category name ..............");
		return mapper.getCategoryName(mno);
	}


	
}
