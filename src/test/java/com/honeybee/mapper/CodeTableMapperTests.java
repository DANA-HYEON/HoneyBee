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
public class CodeTableMapperTests {
	
	@Setter(onMethod_ =@Autowired)
	private CodeTableMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getCatList().forEach(meet -> log.info(meet.getCName()));
	}

}
