package com.honeybee.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private UserService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testRegister() {
//		UserVO user = new UserVO();
//		user.setId("ka124321ms");
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
//		service.register(user);
//	}
//	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testGet() {
//		log.info(service.get("kams2"));
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("REMOVE RESULT : " + service.remove("kams"));
//	}
	
	@Test
	public void testUpdate() {
		UserVO user = service.get("kams2");

		if(user == null) {
			return;
		}
    
		user.setCid("U00124");
		log.info("MODIFY RESULT: " + service.modify(user));
		
	}
	
	
}
