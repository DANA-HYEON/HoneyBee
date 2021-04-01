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
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MeetControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/meet/list")).andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/meet/reg")
				.param("cid", "05")
				.param("cid2", "01")
				.param("id", "USAsuper0101")
				.param("title", "Controller테스트 새글 제목 모임")
				.param("smry", "모임 요약 내용 테스트 입니다. 컨트롤러")
				.param("content", "Controller 내용내용내용내용내용내용 테스트 내용내용내용내용 ")
				.param("startDt", "999999999999")
				.param("endDt", "999999999999")
				.param("recsDt", "999999999999")
				.param("receDt", "999999999999")
				.param("recNo", "100")
				.param("currNo", "100")
				.param("cnclNo", "0")
				.param("hit", "50")
				.param("thumb", "101")
				.param("charge", "N")
				.param("onoff", "OFF")
				.param("place", "서우러울서울서울ㅇ서울")
				.param("link", "www.naver.com")
				.param("img", "This is img")).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testGet() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/meet/get")
				.param("mno", "17"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/meet/modify")
				.param("mno", "45")
				.param("cid", "09")
				.param("cid2", "09")
				.param("id", "USAsuper0101")
				.param("title", "오늘 만우절 삐용삐용 테스트 새글 제목 모임")
				.param("smry", "모임 요약 내용 테스트 입니다. 컨트롤러")
				.param("content", "Controller 내용내용내용내용내용내용 테스트 내용내용내용내용 ")
				.param("startDt", "999999999999")
				.param("endDt", "999999999999")
				.param("recsDt", "999999999999")
				.param("receDt", "999999999999")
				.param("recNo", "100")
				.param("currNo", "100")
				.param("cnclNo", "0")
				.param("hit", "50")
				.param("thumb", "101")
				.param("charge", "N")
				.param("onoff", "OFF")
				.param("place", "서우러울서울서울ㅇ서울")
				.param("link", "www.naver.com")
				.param("img", "This is img")).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testRemove() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/meet/remove").param("mno", "19"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}
