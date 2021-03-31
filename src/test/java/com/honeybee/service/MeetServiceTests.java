package com.honeybee.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.MeetVO;
import com.honeybee.mapper.MeetMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MeetServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private MeetService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		MeetVO meet = new MeetVO();
		
		meet.setCid("02");
		meet.setCid2("01");
		meet.setId("idididid");
		meet.setTitle("이것은 제목 테스트입니다.");
		meet.setSmry("이것은 모임 섬머리 설명 테스트입니다.");
		meet.setContent("이것은 모임 내용입니다. 모임 내용입니다. 모임 내용입니다. 모임 내용입니다.");
		meet.setStartDt("202103310730");
		meet.setEndDt("202103310930");
		meet.setRecsDt("202103161200");
		meet.setReceDt("202103201800");
		meet.setRecNo(20);
		meet.setCurrNo(15);
		meet.setCnclNo(1);
		meet.setHit(25);
		meet.setThumb(10);
		meet.setCharge("N");
		meet.setOnoff("OFF");
		meet.setPlace("서울 마포구 홍대 어쩌구저쩌구");
		meet.setLink("www.naver.com");
		meet.setImg("IMG");
		
		service.register(meet);
		log.info("생성된 게시물의 번호 : " + meet.getGno());
	}
	
	@Test
	public void testGet() {
		log.info(service.get(11L));
	}
	
	@Test
	public void testDelete() {
		log.info("remove result : " + service.remove(23L));
	}
	
	@Test
	public void testUpdate() {
		
		MeetVO meet = service.get(21L);
		
		if(meet == null) {
			return;
		}
		
		meet.setTitle("하이 수정수정수정");
		log.info("modify result : " + service.modify(meet));
	}
}
