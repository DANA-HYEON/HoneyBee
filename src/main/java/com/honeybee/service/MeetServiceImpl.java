package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.EnrollListVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.ThumbVO;
import com.honeybee.mapper.EnrollListMapper;
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

	@Transactional
	@Override
	public MeetVO get(Long mno) {
		log.info("get.....................");
		views(mno);
		return mapper.read(mno);
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

	//내가 개설한 모임을 카테고리별로 가져오기
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

	@Override
	public List<MeetVO> getListWithCategory(String cid){
		log.info("getListWithCategory...............");
		return mapper.getListWithCategory(cid);
	}//내가 개설한 모임을 카테고리별로 가져오기

	@Override
	public boolean views(Long mno) {
		log.info("counting views.............");
		return mapper.countViews(mno) == 1;
	}

	@Transactional
	@Override
	public boolean thumbs(ThumbVO vo) {
		log.info("counting thumbs............");

		insertThumbList(vo);
		return mapper.countThumbs(vo.getMno()) == 1;
	}

	@Override
	public void insertThumbList(ThumbVO vo) {
		log.info("insert into thumb_list...........");
		mapper.insertThumbList(vo);
	}


	@Transactional
	@Override
	public boolean deleteThumbList(ThumbVO vo) {
		log.info("delete from thumb_list...........");
		mapper.deleteThumbList(vo);
		return mapper.countThumbs(vo.getMno()) == 1;
	}

	@Override
	public ThumbVO checkThumbList(String thumbno) {
		log.info("check from thumb_list...........");
		return mapper.checkThumbList(thumbno);
	}


	@Override
	public int applyUpdate(Long mno) {
		log.info("updaet meet CURRNO...........");
		return mapper.applyUpdate(mno);
	}

	@Override
	public int deleteUpdate(EnrollListVO vo) {
		log.info("update meet currRno-1 and CNCLNO+1..........");
		return mapper.deleteUpdate(vo.getMno());
	}

	@Override
	public int updateImg(MeetVO vo) {
		log.info("update meet Img.................");
		return mapper.updateImg(vo.getMno(), vo.getImg());
	}

	@Override
	public MeetVO getImg(Long mno) {
		log.info("get Img from meet............");
		return mapper.getImg(mno);
	}

	@Override
	public String getCid(Long mno, String cid3) {
		log.info("get Cid from meet.............");
		return mapper.getCid(mno, cid3);
	}
}
