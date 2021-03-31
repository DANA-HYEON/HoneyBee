package com.honeybee.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.MeetVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MeetMapperTests {
	
	@Setter(onMethod_ =@Autowired)
	private MeetMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(meet -> log.info(meet));
	}
	
	@Test
	public void insert() {
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
		
		mapper.insert(meet);
		log.info("등록 : " + meet);
	}
	
	@Test
	public void testInsertSelectKey() {
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
		
		mapper.insertSelectKey(meet);
		log.info("등록 : " + meet);
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(20L));
	}
	
	@Test
	public void testDelete() {
		log.info("취소 개수 : " + mapper.delete(20L));
	}
	
	@Test
	public void testUpdate() {
		MeetVO meet = new MeetVO();
		meet.setGno(21L);
		
		meet.setTitle("수정된 제목입니다");
		meet.setSmry("수정된 섬머리 내용입니다");
		meet.setContent("수정된 내용입니다.");
		meet.setStartDt("202103312222");
		meet.setEndDt("222222222222");
		meet.setRecsDt("222222222222");
		meet.setReceDt("222222222222");
		meet.setRecNo(99);
		meet.setCharge("Y");
		meet.setOnoff("ON");
		meet.setPlace("야야야야야야야야야");
		meet.setLink("wwww");
		meet.setImg("www");
		
		log.info("업뎃 된 갯수  : " + mapper.update(meet));
	}
	
	
}
