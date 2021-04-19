package com.honeybee.mapper;

import java.util.List;

import static org.junit.Assert.assertTrue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.Criteria;
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
		meet.setCid("M001");
		meet.setCid2("01");
		meet.setId("idididid");
		meet.setTitle("TEST입니다.");
		meet.setSmry("Smry입니다.");
		meet.setContent("Content입니다.");
		meet.setStartDt("2021-04-19 02:40");
		meet.setEndDt("2021-04-19 05:40");
		meet.setRecsDt("2021-04-18 02:40");
		meet.setReceDt("2021-04-18 02:40");
		meet.setRecNo(20);
		meet.setCurrNo(15);
		meet.setCnclNo(1);
		meet.setHit(25);
		meet.setThumb(10);
		meet.setCharge("N");
		meet.setOnoff("OFF");
		meet.setPlace("한강");
		meet.setLink("www.naver.com");
		meet.setImg("IMG");
		
		int cnt = mapper.insert(meet);
		
		assertTrue(cnt == 1);
	}
	
	
	@Test
	public void testInsertSelectKey() {
		MeetVO meet = new MeetVO();
		meet.setCid("M001");
		meet.setCid2("01");
		meet.setId("idididid");
		meet.setTitle("TEST입니다.");
		meet.setSmry("Smry입니다.");
		meet.setContent("Content입니다.");
		meet.setStartDt("2021-04-19 02:40");
		meet.setEndDt("2021-04-19 05:40");
		meet.setRecsDt("2021-04-18 02:40");
		meet.setReceDt("2021-04-18 02:40");
		meet.setRecNo(20);
		meet.setCurrNo(15);
		meet.setCnclNo(1);
		meet.setHit(25);
		meet.setThumb(10);
		meet.setCharge("N");
		meet.setOnoff("OFF");
		meet.setPlace("한강");
		meet.setLink("www.naver.com");
		meet.setImg("IMG");
		
		
		mapper.insertSelectKey(meet);
		int cnt = mapper.insert(meet);
		
		assertTrue(cnt == 1);
	}
	
	
	@Test
	public void testRead() {
		log.info(mapper.read(10L));
		assertTrue(mapper.read(10L) != null);
	}
	
	
	@Test
	public void testDelete() {
		
		assertTrue(mapper.delete(10L) == 1);
	}
	
	
	@Test
	public void testUpdate() {
		MeetVO meet = mapper.read(11L);
		log.info(meet);
		meet.setTitle("수정 업데이트 제목");
		meet.setSmry("수정 업데이트 Smry");
		meet.setContent("수정 업데이트 Content");
		meet.setStartDt("2021-04-18 02:40");
		meet.setEndDt("2021-04-18 02:40");
		meet.setRecsDt("2021-04-18 02:40");
		meet.setReceDt("2021-04-18 02:40");
		meet.setRecNo(99);
		meet.setCharge("Y");
		meet.setOnoff("ON");
		meet.setPlace("서울특별시 강서구 화곡동 999-9");
		meet.setLink("wwww.naver.com");
		meet.setImg("IMG");

		assertTrue(mapper.update(meet) == 1);
	}

	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();

		cri.setPageNum(3);
		cri.setAmount(10);

		List<MeetVO> list = mapper.getListWithPaging(cri);
		list.forEach(meet -> log.info(meet));
	}

	
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("하이");
		cri.setType("TC");

		List<MeetVO> list = mapper.getListWithPaging(cri);

		list.forEach(meet -> log.info(meet));
	}
}
