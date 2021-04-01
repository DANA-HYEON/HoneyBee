package com.honeybee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.FreeVO;
import com.honeybee.service.FreeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/free/*")
@AllArgsConstructor
public class FreeController {
	
	private FreeService fservice;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", fservice.getList());
	}
	
	@GetMapping("/reg")
	public void register() {
		
	}
	
	@PostMapping("/reg")
	public String register(FreeVO vo, RedirectAttributes rttr) {
		log.info("register: " + vo);
		fservice.register(vo);
		rttr.addFlashAttribute("result", vo.getFno());
		
		return "redirect:/free/list";
	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("fno") Long fno, Model model) {
		log.info("/get or modify");
		model.addAttribute("free", fservice.get(fno));
	}
	
	@PostMapping("/modify")
	public String modify(FreeVO vo, RedirectAttributes rttr) {
		log.info("modify: " + vo);
		
		if (fservice.modify(vo))
			rttr.addFlashAttribute("result", "success");
		
		return "redirect:/free/list";
	}
	
	@PostMapping("/del")
	public String remove(@RequestParam("fno") Long fno, RedirectAttributes rttr) {
		
		log.info("remove..." + fno);
		if (fservice.remove(fno))
			rttr.addFlashAttribute("result", "success");
		
		return "redirect:/free/list";
	}

}
