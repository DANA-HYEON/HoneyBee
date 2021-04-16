package com.honeybee.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.honeybee.domain.InquiryVO;
import com.honeybee.service.InquiryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/inquiry/*")
@Log4j
@AllArgsConstructor
public class InquiryController {

	private InquiryService service;

	@PostMapping(value = "/report/{objno}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> report(@RequestBody InquiryVO vo, @PathVariable("objno") Long objno) {

		log.info("INQUIRY VO: " + vo);

		int reportCnt = vo.getFno() != null ? service.reportFno(vo) : service.reportFrno(vo);

		return reportCnt == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

}
