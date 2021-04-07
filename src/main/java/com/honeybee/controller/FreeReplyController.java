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
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.service.FreeReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/freply/*")
@Log4j
@AllArgsConstructor
public class FreeReplyController {
	
	private FreeReplyService service;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody FreeReplyVO vo) {
		
		log.info("FreeReplyVO: " + vo);
		int insertCount = vo.getLayer() != 0 ? service.registerAnswer(vo) : service.register(vo);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK	) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{fno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<FreeReplyVO>> getList(@PathVariable("page") int page, @PathVariable("fno") Long fno) {
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(service.getList(cri, fno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{frno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<FreeReplyVO> get(@PathVariable("frno") Long frno) {
		
		return new ResponseEntity<>(service.get(frno), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{frno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("frno") Long frno) {
		
		return service.remove(frno) ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value = "/{frno}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody FreeReplyVO vo, @PathVariable("frno") Long frno) {
		vo.setFrno(frno);

		return service.modify(vo) ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		

 }
