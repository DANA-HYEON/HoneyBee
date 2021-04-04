package com.honeybee.mapper;

import java.util.List;

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
		meet.setCid("02");
		meet.setCid2("01");
		meet.setId("idididid");
		meet.setTitle("test");
		meet.setSmry("testtesttest");
		meet.setContent("testtesttesttesttest");
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
		meet.setPlace("testtesttesttest");
		meet.setLink("www.naver.com");
		meet.setImg("IMG");

		mapper.insert(meet);
		log.info("test : " + meet);
	}

	@Test
	public void testInsertSelectKey() {
		MeetVO meet = new MeetVO();
		meet.setCid("02");
		meet.setCid2("01");
		meet.setId("idididid");
		meet.setTitle("test.");
		meet.setSmry("test.");
		meet.setContent("testtesttest.");
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
		meet.setPlace("testtest");
		meet.setLink("www.naver.com");
		meet.setImg("IMG");

		mapper.insertSelectKey(meet);
		log.info("test :  " + meet);

	}

	@Test
	public void testRead() {
		log.info(mapper.read(20L));
	}

	@Test
	public void testDelete() {
		log.info("testtest : " + mapper.delete(20L));
	}

	@Test
	public void testUpdate() {
		MeetVO meet = new MeetVO();
		meet.setMno(21L);
		meet.setTitle("ddd");
		meet.setSmry("dddddddddd");
		meet.setContent("dddddddddddd.");
		meet.setStartDt("202103312222");
		meet.setEndDt("222222222222");
		meet.setRecsDt("222222222222");
		meet.setReceDt("222222222222");
		meet.setRecNo(99);
		meet.setCharge("Y");
		meet.setOnoff("ON");
		meet.setPlace("ddd");
		meet.setLink("wwww");
		meet.setImg("www");

		log.info("ddddddddd : " + mapper.update(meet));
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
