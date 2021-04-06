
package com.honeybee.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] mnoArr= {100L,99L,98L,97L,96L};
	
	@Setter(onMethod_ =@Autowired)
	public ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	
	//댓글 입력 테스트
	@Test
	public void testCreate() {
		
			ReplyVO vo = new ReplyVO();
			
			//게시물의번호
			vo.setMno(mnoArr[0]);
			vo.setId("tony");
			
			vo.setReply("이것은 댓글 내용입니다.");
			//vo.setMRno2(1L);
			vo.setLayer(1);
			vo.setBundle(0);
			vo.setBunOrder(0);
			
			
			mapper.insert(vo);
	}
	
	
	//특정 댓글 가져오기
	@Test
	public void testRead() {
		Long targetMRno = 3L;
		
		ReplyVO vo = mapper.read(targetMRno);
		log.info(vo);
	}
	
	//댓글 삭제하기
	@Test
	public void testDelete() {
		Long targetMRno = 3L;
		
		mapper.delete(targetMRno);
	}
	
	
	//댓글 수정하기
	@Test
	public void testUpdate() {
		Long targetMRno = 10L;
		
		ReplyVO vo = mapper.read(targetMRno);
		vo.setReply("updated reply");
		
		int count = mapper.update(vo);
		log.info("update count : " + count);
	}
	
	//특정 게시물의 댓글 리스트 불러오기
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, mnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
}
