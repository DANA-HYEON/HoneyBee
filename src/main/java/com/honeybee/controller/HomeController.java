package com.honeybee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private CodeTableService cService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("category", cService.getCatList());
		
		return "home";
	}
	
	@RequestMapping("/login")
	public void login() {
		
	}
	
}
