package com.honeybee.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.ReplyVO;
import com.honeybee.service.MeetReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class MeetReplyController {
	
	private MeetReplyService service;
	
	//댓글등록
	@PostMapping(value = "/new", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		log.info("ReplyVO : " + vo);
		
		//대댓글 등록
		if(vo.getLayer() == 1) {
			int insertReplyCount = service.registerReply(vo);
			
			log.info("Reply Insert Count : " + insertReplyCount);
			
			return insertReplyCount == 1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		//댓글 등록
		int insertCount = service.register(vo);
		
		log.info("Reply Insert Count : " + insertCount);
		
		return insertCount == 1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//특정 게시물의 댓글 리스트 가져오기
	@GetMapping(value="/pages/{mno}/{page}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("mno") Long mno){
		log.info("getList...................");
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, mno), HttpStatus.OK);
	}
	
	//댓글 조회
	@GetMapping(value="/{mrno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("mrno") Long mrno){
		log.info("get : " + mrno);
		
		return new ResponseEntity<>(service.get(mrno), HttpStatus.OK);
	}
	
	//댓글삭제
	@DeleteMapping(value="/{mrno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("mrno") Long mrno){
		log.info("remove : " + mrno);
		
		return service.remove(mrno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{mrno}", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("mrno") Long mrno){
		vo.setMrno(mrno);
		
		log.info("mno  : " + mrno);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
