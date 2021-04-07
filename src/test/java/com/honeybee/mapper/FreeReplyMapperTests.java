package com.honeybee.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private FreeReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	
	private Long[] fnoArr = { 5L, 6L, 7L, 8L, 9L };
	@Test
	public void testInsert() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			FreeReplyVO vo = new FreeReplyVO();
			vo.setFno(fnoArr[i % 5]);
			vo.setId("hehe");
			vo.setReply("댓글 테스트" + i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		FreeReplyVO vo = mapper.read(3L);
		log.info(vo);
	}
	
	@Test
	public void testUpdate() {
		FreeReplyVO vo = mapper.read(2L);
		vo.setReply("이거 수정했어요");
		
		int cnt = mapper.update(vo);
		log.info("UPDATE COUNT: " + cnt);
	}
	
	@Test
	public void testDelete() {
		int cnt = mapper.delete(4L);
		log.info("DELETE COUNT: " + cnt);
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<FreeReplyVO> list = mapper.getList(cri, fnoArr[0]);
		list.forEach(reply -> log.info(reply));
	}
	
}
