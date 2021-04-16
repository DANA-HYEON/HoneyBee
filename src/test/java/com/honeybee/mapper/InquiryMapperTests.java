package com.honeybee.mapper;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.InquiryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InquiryMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	@Test
	public void testReportBadFno() {
		InquiryVO vo = new InquiryVO();
		
		vo.setId("asdf");
		vo.setTitle("이 게시물 너무 저질이에요");
		vo.setContent("이 게시물은 매우 저질스럽고, 커뮤니티 규정을 위반한 내용을 담고 있습니다. 따라서 이 게시물을 신고합니다. 강력한 처벌 부탁드립니다.");
		vo.setFno(4993L);
		
		log.info(vo);
		assertTrue(mapper.reportBadFno(vo) == 1 && vo.getIno() != 0);
	}
	
	@Test
	public void testReportBadFrno() {
		InquiryVO vo = new InquiryVO();
		
		vo.setId("asdf");
		vo.setTitle("This comment is spam");
		vo.setContent("This comment is about illegal advertisement. Please erase it.");
		vo.setFrno(37L);
		
		log.info(vo);
		assertTrue(mapper.reportBadFrno(vo) == 1 && vo.getIno() != 0);
	}
	
	@Test
	public void testRead() {
		InquiryVO vo = mapper.read(11L);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		mapper.delete(12L);
		assertTrue(mapper.read(12L).getDeldt() != null);
	}
	
	@Test
	public void testGetReportList() {
		mapper.getReportList().forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testGetInquiryList() {
		mapper.getInquiryList().forEach(vo -> log.info(vo));
	}

}
