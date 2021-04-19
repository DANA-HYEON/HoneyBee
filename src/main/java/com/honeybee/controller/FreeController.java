package com.honeybee.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.PageDTO;
import com.honeybee.domain.ThumbVO;
import com.honeybee.service.FreeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/free/*")
@AllArgsConstructor
public class FreeController {
	
	private FreeService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/reg")
	public void register() {
		
	}
	
	@PostMapping("/reg")
	public String register(FreeVO vo, RedirectAttributes rttr) {
		log.info("register: " + vo);
		service.register(vo);
		rttr.addFlashAttribute("result", vo.getFno());
		
		return "redirect:/free/list";
	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("free", service.get(fno));
	}
	
	@PostMapping("/modify")
	public String modify(FreeVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + vo);
		
		if (service.modify(vo))
			rttr.addFlashAttribute("result", "success");
		
		return "redirect:/free/list" + cri.getListLink();
	}
	
	@RequestMapping("/del")
	public String remove(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + fno);
		
		if (service.get(fno).getDeldt() == null)
			service.remove(fno);
		
		return "redirect:/free/list" + cri.getListLink();
	}
		
	@RequestMapping(method = { RequestMethod.POST }, value = "/{fno}", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> thumbUp(@RequestBody ThumbVO vo) {
		log.info("ThumbVO : " + vo);
		int heartCnt = service.check(vo.getId(), vo.getFno()) ? service.thumbUp(vo) : service.cancelThumbUp(vo);
		log.info("HEART COUNT : " + heartCnt);
		
		return heartCnt == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	


}
