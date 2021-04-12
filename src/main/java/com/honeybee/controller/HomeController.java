package com.honeybee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.UserVO;
import com.honeybee.service.CodeTableService;
import com.honeybee.service.UserService;

import lombok.Setter;

@Controller
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private CodeTableService cService;

	@Setter(onMethod_ = @Autowired)
	private UserService uService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("category", cService.getCatList());
		
		return "home";
	}
	
	@RequestMapping("/login")
	public void login() {

	}

	@GetMapping("/register")
	public void register() {

	}

	@PostMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {

		uService.register(user);
		rttr.addFlashAttribute("result", user.getId());

		return "redirect:/";
	}

	@RequestMapping("/tos")
	public void tos() {

	}

	@PostMapping("/idCheck")
	public String idCheck(@ModelAttribute("id") String id) {

		return "redirect:/register";
	}

}
