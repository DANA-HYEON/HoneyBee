package com.honeybee.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.PageDTO;
import com.honeybee.service.CodeTableService;
import com.honeybee.service.MeetService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/meet/*")
@AllArgsConstructor
public class MeetController {

	private MeetService service;
	private CodeTableService cService;


	@RequestMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list total");
		log.info("list total : " + cri);
		System.out.println("category pick : " + cri.getCid());
		
		//카테고리 미 선택시 리스트
		if(cri.getCid() == null || cri.getCid().equals("카테고리") || cri.getCid().equals("M000")) {
			
			cri.setCid("M000");
			model.addAttribute("list", service.getList(cri)); //모임게시물 리스트 가져오기
			model.addAttribute("category", cService.getCatList());
			model.addAttribute("pickCat", "M000");
			
			int total = service.getTotal(cri);
			log.info("total : " + total);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			return;
		}
		
		//카테고리 선택 후 검색시 리스트 
		log.info("list category");
		log.info("list category : " + cri);
		
		model.addAttribute("list", service.getListWithCat(cri)); //모임게시물 리스트 (페이징, 카테고리)가져오기
		model.addAttribute("category", cService.getCatList());
		
		System.out.println("pickCat : " + cri.getCid());
		model.addAttribute("pickCat", cri.getCid());

		int total = service.getTotalWithCat(cri);

		log.info("total : " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	
	@PostMapping("/reg")
	public String register(MeetVO meet, RedirectAttributes rttr) {
		log.info("register : " + meet);

		service.register(meet);

		rttr.addFlashAttribute("result", meet.getMno());

		return "redirect:/meet/list";
	}


	@GetMapping("/reg")
	public void register(Model model) {
		model.addAttribute("category", cService.getCatList());
	}


	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("mno") Long mno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or /modify");
		model.addAttribute("meet", service.get(mno));
		
		MeetVO meet = service.get(mno);
		
		cri.setCid(meet.getCid());
		log.info("cri : " + cri);
		System.out.println("이 게시물의 카테고리번호는 ? " + service.get(mno).getCid3());
		System.out.println("이 게시물의 카테고리번호는 ? " + service.get(mno).getCid());
		model.addAttribute("category", cService.getCatList());
		model.addAttribute("pickedCat", service.get(mno).getCid());
		model.addAttribute("categoryName", service.getCategoryName(mno)); //해당 모임게시물의 카테고리 이름 cname 보내기
	}


	@PostMapping("/modify")
	public String modify(MeetVO meet, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, Model model, HttpServletRequest request) {
		log.info("modify : " + meet);


	    System.out.println("meet.getCid() : " + meet.getCid());
	    
		if(service.modify(meet)) {
			rttr.addFlashAttribute("result", "success");
		}

		//수정한 카테고리 값 
		System.out.println("cid : " + meet.getCid());
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("cid", cri.getCid());
		
		
		return "redirect:/meet/list";
	}


	@RequestMapping("/remove")
	public String remove(@RequestParam("mno") Long mno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove.............." + mno);

		if(service.remove(mno)) {
			rttr.addFlashAttribute("result" , "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("cid", cri.getCid());

		return "redirect:/meet/list";
	}
	
}

