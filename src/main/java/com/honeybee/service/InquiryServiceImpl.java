package com.honeybee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.honeybee.domain.InquiryVO;
import com.honeybee.mapper.InquiryMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquiryServiceImpl implements InquiryService {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;

	@Override
	public int reportFno(InquiryVO vo) {
		log.info("REPORTED FNO : " + vo);
		
		return mapper.reportBadFno(vo);
	}

	@Override
	public int reportFrno(InquiryVO vo) {
		log.info("reported frno : " + vo);
		
		return mapper.reportBadFrno(vo);
	}

	@Override
	public InquiryVO get(Long ino) {
		log.info("GET INQUIRY...");
		
		return mapper.read(ino);
	}

	@Override
	public boolean remove(Long ino) {
		log.info("REMOVE INQUIRY...");
		
		return mapper.delete(ino) == 1;
	}

	@Override
	public List<InquiryVO> getReportList() {
		log.info("GET REPORT LIST IN SERVICE");
		
		return mapper.getReportList();
	}

	@Override
	public List<InquiryVO> getInquiryList() {
		log.info("GET INQUIRY LIST IN SERVICE");
		
		return mapper.getInquiryList();
	}
	

}
