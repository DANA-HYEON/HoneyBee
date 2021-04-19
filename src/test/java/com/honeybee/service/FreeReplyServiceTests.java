package com.honeybee.service;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.FreeReplyVO;
import com.honeybee.mapper.FreeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeReplyServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyService service;
	
	@Test
	public void testRegister() {
		FreeReplyVO vo = new FreeReplyVO();
		vo.setFno(2000L);
		vo.setId("asdf");
		vo.setReply("TESTING");
		vo.setBundle(2000L);
		
		assertTrue(service.register(vo) == 1);
	}
	
	@Test
	public void testGet() {
		FreeReplyVO vo = service.get(284L);
		assertTrue(vo != null && vo.getDeldt() == null);
	}
	
	@Test
	public void testModify() {
		FreeReplyVO vo = service.get(285L);
		String oldReply = vo.getReply();
		
		if (vo != null)
			vo.setReply("일론 머스크 아닙니당");
		
		service.modify(vo);
		
		String changedReply = vo.getReply();
		
		log.info("oldReply : " + oldReply);
		log.info("changedReply : " + changedReply);
		
		assertTrue(!oldReply.equals(changedReply));
	}
	
	@Test
	public void testRemove() {
		assertTrue(service.remove(299L));
	}

}
