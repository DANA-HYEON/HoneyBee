package com.honeybee.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.FreeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FreeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testInsert() {
		FreeVO vo = new FreeVO();
		vo.setId("nrudev");
		vo.setTitle("사회인야구 포수 모집합니다~~~");
		vo.setContent("사회인 야구팀 불곡에서 포수를 모집합니다. 무료입니다.");
		
		log.info(vo);
		mapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		FreeVO vo = mapper.read(1L);
		log.info(vo);
	}
	
	@Test
	public void testUpdate() {
		FreeVO vo = mapper.read(1L);
		vo.setId("sujung");
		vo.setTitle("수정합니다.");
		vo.setContent("changed content");
		vo.setHit(5000L);
		vo.setThumb(5);
		
		int cnt = mapper.update(vo);
		log.info("UPDATE COUNT: " + cnt);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete(2L));
	}
	
}
