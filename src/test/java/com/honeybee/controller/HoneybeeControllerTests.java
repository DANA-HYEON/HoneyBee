package com.honeybee.controller;

import java.util.Date;

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
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class HoneybeeControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
//	
//	@Test
//	public void testList() throws Exception {
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/honeybee/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testRegister()throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/honeybee/register")
//				.param("id", "kams414124")
//				.param("cid", "R001")
//				.param("pwd", "pwdthis")
//				.param("name", "세훈")
//				.param("birth", "20131101")
//				.param("sex",  "1")
//				.param("email", "kams1011@naver.com")
//				.param("telno", "01041109310")
//				.param("url", "www.google.com")
//				.param("rcvyn", "N")
//				.param("nick", "sokodomo")
//				.param("img", "img/src/saaa/")			
//				).andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	
//	@Test
//	public void testGet() throws Exception {
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/honeybee/get")
//				.param("id", "kams"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
	
	@Test
	public void testModify() throws Exception{
		
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/honeybee/modify")
						.param("id", "kams")
						.param("pwd", "pwdmodify")
						.param("cid", "cidmodify")
						.param("name", "세훈이")
						.param("birth", "1234565")
						.param("sex", "1")
						.param("email", "rlatpgnsyu7698@gmail.com")
						.param("telno", "010431104012")
						.param("url", "jerwiopj.com")
						.param("rcvyn", "Y")
						.param("nick",  "hoho")
						.param("scor", "123")
						.param("img", "imgimgimgimgimgimg")
						)
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		}
	
	
//	@Test
//	public void testRemove()throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/honeybee/remove")
//				.param("id", "kams2")
//				).andReturn().getModelAndView().getViewName();
//			log.info(resultPage);
//	}
	
	
	
}
