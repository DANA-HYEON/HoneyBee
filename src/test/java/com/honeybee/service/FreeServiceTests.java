package com.honeybee.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeServiceTests {
	
	@Setter(onMethod_ = { @Autowired })
	private FreeService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		log.info("register..........");
		FreeVO vo = new FreeVO();
		vo.setId("dukgomul");
		vo.setTitle("제목입니다~");
		vo.setContent("\"힘든 시기에 회사를 다니며 누구나가 창업을 꿈꾼다.\"\n" + 
				"\n" + 
				"내가 생각 하는 아이템이 어떤지 제 3자의 눈으로 이야기 해 줄 수 있는 모임을 만들고 싶다.\n" + 
				"\n" + 
				"나의 생각과 우리의 생각을 공유해서 또 다른 무언가 만들 수 있다면 창업을 준비 하는 것은 헛된 시간이 아닐것입니다.\n" + 
				"\n" + 
				"기초 지식이 없어도 퇴근 후에 커피 한잔 하면서 서로의 생각을 이야기 할 소모임 입니다.\n" + 
				"\n" + 
				"같이 하실 분들을 모집 합니다.\n" + 
				"\n" + 
				"참여자 : 아이디어가 있는 모든 사람\n" + 
				"\n" + 
				"장소 : 서울 1호선 개봉역 인근\n" + 
				"\n" + 
				"시간 : 퇴근 후 커피 한잔");
		
		service.register(vo);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(10L));
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2, 10)).forEach(vo -> log.info(vo));
	}

}
