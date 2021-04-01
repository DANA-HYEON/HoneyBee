package com.honeybee.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.honeybee.domain.UserVO;
import com.honeybee.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	Date date = new Date();
	
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//
//	@Test
//	public void testInsert() {
//			UserVO user = new UserVO();
//			user.setId("kams2");
//			user.setPwd("pwd1234");
//			user.setName("김세훈");
//			user.setBirth("201111");
//			user.setSex(1);
//			user.setEmail("kams1011@naver.com");
//			user.setTelno("010-4110-9310");
//			user.setUrl("www.naver.com");
//			user.setRcvyn("y");
//			user.setNick("kams");
//			user.setScor(4L);
//			user.setImg("imageimageimageimage");
//			mapper.insert(user);
//	}
	
	
//	@Test
//	public void testUpdate() {
//		UserVO user = new UserVO();
//		user.setId("kams");
//		user.setCid("U002");
//		user.setPwd("pwd34");
//		user.setName("구희승");
//		user.setBirth("19931011");
//		user.setSex(2);
//		user.setEmail("kams1011@gmail.com");
//		user.setTelno("01012304124");
//		user.setUrl("www.daum.net");
//		user.setRcvyn("N");
//		user.setNick("Ohayo");
//		user.setScor(1L);
//		user.setImg("dodogeorhfqwer");
//		mapper.update(user);
//	}
	
	


//	@Test
//	public void testDelete() {
//		
//		log.info("delete count : " + mapper.delete("kams"));
//	}
}
