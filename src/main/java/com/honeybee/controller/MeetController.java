package com.honeybee.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.Criteria;
import com.honeybee.domain.EnrollListVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.PageDTO;
import com.honeybee.domain.ReplyVO;
import com.honeybee.domain.ThumbVO;
import com.honeybee.service.CodeTableService;
import com.honeybee.service.EnrollListService;
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
	private EnrollListService eService;
	

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
	public String register(MeetVO meet, HttpServletRequest request, RedirectAttributes rttr) {
		log.info("register : " + meet);
		meet.setContent(request.getParameter("ir1"));
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
		log.info("GetMapping get cri : " + cri.getCid());
		
		MeetVO vo = service.get(mno);
		model.addAttribute("meet", vo);


		log.info("cri : " + cri);
		model.addAttribute("category", cService.getCatList());
		model.addAttribute("pickedCat", vo.getCid());
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
	
	
	//찜 추가
	@PostMapping(value = "/thumb", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> thumbs(@RequestBody ThumbVO vo){
		log.info("ThumbVO vo : " + vo);

		return service.thumbs(vo) == true? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//찜 취소
	@DeleteMapping(value="/removeThumb", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ThumbVO vo){
		log.info("remove : " + vo);
		
		return service.deleteThumbList(vo) == true ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//찜 조회
	@GetMapping(value="/{thumbno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ThumbVO> get(@PathVariable("thumbno") String thumbno){
		log.info("get thumbno : " + thumbno);
		
		return new ResponseEntity<>(service.checkThumbList(thumbno), HttpStatus.OK);
	}

	//모임게시물 신청하기
		@PostMapping(value = "/apply", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> apply(@RequestBody EnrollListVO vo){
			log.info("EnrollListVO vo : " + vo);

			return eService.insert(vo) == 1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		
	//신청 되어있는지 조회
	@GetMapping(value="/mApply/{eno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<EnrollListVO> applyGet(@PathVariable("eno") String eno){
		log.info("get eno : " + eno);
		
		return new ResponseEntity<>(eService.checkApplyList(eno), HttpStatus.OK);
	}	
	
	//모임 취소
	@DeleteMapping(value="/removeApply", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> removeApply(@RequestBody EnrollListVO vo){
		log.info("EnrollListVO vo : " + vo);
		
		return eService.delete(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

