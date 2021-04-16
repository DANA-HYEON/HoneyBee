package com.honeybee.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

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
public class InquiryServiceTests {
	
	@Setter(onMethod_ = { @Autowired })
	private InquiryService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testReportFno() {
		InquiryVO vo = new InquiryVO();
		vo.setFno(4993L);
		vo.setId("asdf");
		vo.setTitle("이런 것들은 좀 삭제해라ㅡㅡ");
		vo.setContent("PLEASE~~~~");
		
		assertTrue(service.reportFno(vo) == 1);
	}
	
	@Test
	public void testReportFrno() {
		InquiryVO vo = new InquiryVO();
		vo.setFrno(263L);
		vo.setId("asdf");
		vo.setTitle("분탕질");
		vo.setContent("This is Buntang.");
		
		assertTrue(service.reportFrno(vo) == 1);
	}
	
	@Test
	public void testGet() {
		InquiryVO vo = service.get(12L);
		log.info(vo);
		
		assertTrue(vo != null);
	}
	
	@Test
	public void testRemove() {
		InquiryVO vo = service.get(11L);
		
		if (vo.getDeldt() == null || vo != null)
			assertTrue(service.remove(11L));
	}
	
	@Test
	public void testGetReportList() {
		List<InquiryVO> list = service.getReportList();
		
		InquiryVO vo = list.get(0);
		
		if (vo != null)
			assertTrue(vo.getCat() == 1 && vo.getDeldt() == null);
	}
	
	@Test
	public void testGetInquiryList() {
		List<InquiryVO> list = service.getInquiryList();
		
		InquiryVO vo = list.get(0);
		
		if (vo != null) {
			assertTrue(vo.getCat() == 2 && vo.getDeldt() == null
						&& vo.getFno() == 0 && vo.getFrno() == 0
						&& vo.getMno() == 0 && vo.getMrno() == 0);
		}
	}

}
