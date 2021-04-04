package com.honeybee.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class FreeControllerTests {
	
	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/free/list"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/free/reg")
				.param("title", "테스트 title")
				.param("content", "테스트 content")
				.param("id", "nrudev")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/free/modify")
				.param("fno", "3")
				.param("id", "hahaha")
				.param("title", "title rechange!!!")
				.param("content", "내용도다시수정!!!!")
				.param("hit", "6000")
				.param("thumb", "16"))
			.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testDelete() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/free/del")
				.param("fno", "3")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/free/list")
				.param("pageNum", "2")
				.param("amount", "50"))
			.andReturn().getModelAndView().getModelMap());
	}

}
