package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.honeybee.domain.EnrollListVO;
import com.honeybee.mapper.EnrollListMapper;
import com.honeybee.mapper.MeetMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class EnrollListServiceImpl implements EnrollListService {

	@Setter(onMethod_ =@Autowired)
	private EnrollListMapper eMapper;
	
	@Setter(onMethod_ =@Autowired)
	private MeetMapper mapper;

	@Override
	public List<EnrollListVO> getEnrollList() {
		log.info("Service getEnrollList..............");
		return eMapper.getEnrollList();
	}
	
	@Override
	public List<EnrollListVO> getEnrollStatus(String id){
		log.info("service getEnrollStatus........");
		return eMapper.getEnrollStatus(id);
	}
	
	@Override
	public List<EnrollListVO> getEnrollTitle(String id){
		log.info("service getEnrollStatus........");
		return eMapper.getEnrollTitle(id);
	}

	
	@Transactional
	@Override
	public int insert(EnrollListVO vo) {
		log.info("insert enroll_list..........");
		mapper.applyUpdate(vo.getMno());
		return eMapper.insert(vo);
	}

	@Override
	public EnrollListVO checkApplyList(String eno) {
		log.info("check from  EnrolListVO...............");
		return eMapper.checkApplyList(eno);
	}

	@Transactional
	@Override
	public int delete(EnrollListVO vo) {
		log.info("delete enrollList data..........");
		mapper.deleteUpdate(vo.getMno());
		return eMapper.delete(vo);
	}
}
