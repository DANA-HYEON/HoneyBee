package com.honeybee.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.honeybee.service.CodeTableService;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */

@Controller
@AllArgsConstructor
public class HomeController {
	
	private CodeTableService cService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("category", cService.getCatList());
		
		return "home";
	}
	
}
