package com.honeybee.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.ThumbVO;

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
		vo.setContent("\"힘든 시기에 회사를 다니며 누구나가 창업을 꿈꾼다.\"<br>" + 
				"내가 생각 하는 아이템이 어떤지 제 3자의 눈으로 이야기 해 줄 수 있는 모임을 만들고 싶다.<br>" + 
				"나의 생각과 우리의 생각을 공유해서 또 다른 무언가 만들 수 있다면 창업을 준비 하는 것은 헛된 시간이 아닐것입니다.<br>" + 
				"기초 지식이 없어도 퇴근 후에 커피 한잔 하면서 서로의 생각을 이야기 할 소모임 입니다.<br>" + 
				"같이 하실 분들을 모집 합니다.<br>" + 
				"참여자 : 아이디어가 있는 모든 사람<br>" + 
				"장소 : 서울 1호선 개봉역 인근<br>" + 
				"시간 : 퇴근 후 커피 한잔");
		
		service.register(vo);
		assertTrue(vo.getId().equals("dukgomul"));
	}
	
	@Test
	public void testGet() {
		FreeVO vo = service.get(4975L);
		
		assertTrue(vo != null && vo.getFno() == 4975L);
	}
	
	@Test
	public void testModify() {
		FreeVO vo = service.get(5004L);
		String oldTitle = vo.getTitle();
		vo.setTitle("수정했다@$^");
		
		assertTrue(service.modify(vo));
		
		String newTitle = vo.getTitle();
		
		assertTrue(!oldTitle.equals(newTitle) && newTitle.equals("수정했다@$^"));
	}
	
	@Test
	public void testRemove() {
		assertTrue(service.get(4977L).getDeldt() == null);
		assertTrue(service.remove(4977L));
	}
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria(2, 10);
		service.getList(cri).forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testGetTotal() {
		Criteria cri = new Criteria();
		service.getTotal(cri);
	}
	
	@Test
	public void testThumbUp() {
		ThumbVO vo = new ThumbVO();
		vo.setId("nrudev");
		vo.setFno(3995L);
		
		// 좋아요와 좋아요 취소 테스트 한번에
		if (service.check(vo.getId(), vo.getFno())) {
			log.info("THUMB UP!!!!!!!!");
			assertTrue(service.thumbUp(vo) == 1);
		} else {
			log.info("CANCEL THUMB UPㅠ^ㅠ");
			assertTrue(service.cancelThumbUp(vo) == 1);
		}
	}
	
	

}
