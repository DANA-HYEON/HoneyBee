package com.honeybee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.UserVO;
import com.honeybee.service.FreeService;
import com.honeybee.service.MeetService;
import com.honeybee.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class MypageController {
	
	private UserService service;
	private MeetService mservice;
	private FreeService fservice;
	
	@GetMapping("/posted")
	public void posted(Model model) {
		log.info("posted");
		model.addAttribute("list", fservice.getMyList("kams"));
	}
	
	@GetMapping("/getmsg")
	public void getmsg(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	

	@GetMapping("/regCenter")
	public void regCenter(Model model) {
		log.info("list");
		model.addAttribute("list", mservice.getMyList("HOHO995@naver.com"));
	}
	
	
	@GetMapping("/home")
	public void home(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	
	@RequestMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {
		log.info("register: " + user);
		service.register(user);
		rttr.addFlashAttribute("result", user.getCid());
		return "mypage/modify";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("id") String id, Model model) {
		log.info("/get");
		model.addAttribute("user", service.get(id));
		
	}
	
	@PostMapping("/modify")
	public String modify(UserVO user, RedirectAttributes rttr) {
		log.info("modify: " + user);
		
		if(service.modify(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/pwdcheck";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		
		log.info("remove...." + id);
		if(service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/home";
	}

}
