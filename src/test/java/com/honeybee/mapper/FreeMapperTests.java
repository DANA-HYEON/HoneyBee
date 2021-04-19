package com.honeybee.mapper;

import static org.junit.Assert.assertTrue;

import java.util.List;

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
public class FreeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FreeMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(vo -> log.info(vo));
		
		FreeVO vo = mapper.getList().get(0);
		assertTrue(vo.getFno() != 0 && vo.getDeldt() == null);
	}
	
	@Test
	public void testInsert() {
		FreeVO vo = new FreeVO();
		vo.setId("nrudev");
		vo.setTitle("사회인야구 포수 모집합니다~~~");
		vo.setContent("It's FREE!!!!! 포수라면 입회비 없이 편하게 야구하세요!!!! ");
		
		log.info(vo);
		int cnt = mapper.insert(vo);
		assertTrue(cnt == 1);
	}
	
	@Test
	public void testRead() {
		FreeVO vo = mapper.read(4988L);
		log.info(vo);
		
		assertTrue(vo != null && vo.getDeldt() == null);
	}
	
	@Test
	public void testUpdate() {
		FreeVO vo = mapper.read(4987L);
		
		String oldId = vo.getId();
		
		if (vo != null) {
			vo.setId("sujung");
			vo.setTitle("수정합니다.");
			vo.setContent("changed content");
			vo.setHit(5000L);
			vo.setThumb(5);
		}
		
		int cnt = mapper.update(vo);
		log.info("UPDATE COUNT: " + cnt);
		
		assertTrue(cnt == 1 && !(oldId.equals(vo.getId())));
	}
	
	@Test
	public void testDelete() {
		int delCnt = mapper.delete(6L);
		FreeVO deletedVo = mapper.read(6L);
		
		assertTrue(delCnt == 1 && deletedVo == null);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		
		List<FreeVO> list = mapper.getListWithPaging(cri);
		list.forEach(vo -> log.info(vo.getFno()));
	}
	
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("헬로");
		cri.setType("TC");
		
		List<FreeVO> list = mapper.getListWithPaging(cri);
		list.forEach(vo -> log.info(vo));
	}
	
	@Test
	public void testGetTotal() {
		Criteria cri = new Criteria();
		
		mapper.getTotalCount(cri);
	}
	
	@Test
	public void testUpdateReplyCnt() {
		FreeVO vo = mapper.read(5012L);
		int repCnt = vo.getReplyCnt();
		
		mapper.updateReplyCnt(5012L, 1);
		
		FreeVO newVo = mapper.read(5012L);
		int newRepCnt = newVo.getReplyCnt();
		
		log.info("repCnt : " + repCnt);
		log.info("newRepCnt : " + newRepCnt);
		
		assertTrue(newRepCnt == repCnt + 1);
	}
	
	@Test
	public void testHitup() {
		FreeVO vo = mapper.read(4977L);
		Long hitCnt = vo.getHit();
		
		mapper.hitup(4977L, 1);
		
		FreeVO newVo = mapper.read(4977L);
		Long newHitCnt = newVo.getHit();
		
		log.info("hitCnt : " + hitCnt);
		log.info("newHitCnt : " + newHitCnt);
		
		assertTrue(newHitCnt == hitCnt + 1);
	}
	
	@Test
	public void testThumbUp() {
		ThumbVO vo = new ThumbVO();
		vo.setId("abcd");
		vo.setFno(4966L);
		
		int cnt = mapper.thumbUp(vo.getId(), vo.getFno());
		log.info(vo);

		assertTrue(cnt == 1);
	}
	
	@Test
	public void testCheckThumbed() {
		ThumbVO vo = mapper.checkThumbed("abcd", 4966L);
		
		if (vo == null) return;
	}

	@Test
	public void testCancelThumbUp() {
		int cnt = mapper.cancelThumbUp("abcd", 4966L);
	}
	
	
}
