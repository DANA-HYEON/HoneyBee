package com.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.honeybee.service.CodeTableService;

import lombok.Setter;

@Controller
public class HomeController {
	
	@Setter(onMethod_ =@Autowired)
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
