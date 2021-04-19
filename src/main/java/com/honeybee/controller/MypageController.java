package com.honeybee.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.AttachFileDTO;
import com.honeybee.domain.CodeTableVO;
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.HopeVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.MsgVO;
import com.honeybee.domain.ReplyVO;
import com.honeybee.domain.UserVO;
import com.honeybee.service.CodeTableService;
import com.honeybee.service.EnrollListService;
import com.honeybee.service.FreeReplyService;
import com.honeybee.service.FreeService;
import com.honeybee.service.HopeService;
import com.honeybee.service.MeetReplyService;
import com.honeybee.service.MeetService;
import com.honeybee.service.SubscribeService;
import com.honeybee.service.ThumbService;
import com.honeybee.service.UserService;
import com.honeybee.service.MsgService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class MypageController {

	private UserService service;
	private MeetService mservice;
	private FreeService fservice;
	private EnrollListService eservice;
	private ThumbService tservice;
	private SubscribeService sservice;
	private MsgService msgservice;
	private FreeReplyService frservice;
	private CodeTableService cservice;
	private MeetReplyService mrservice;
	private HopeService hservice;

	@GetMapping("/posted")
	public void posted(Model model, String id) {
		log.info("posted");
		model.addAttribute("list", fservice.getMyList("HOHO995@naver.com"));
//		model.addAttribute("list", fservice.getMyList(id)); // id를 받아서 리스트 가져옴
	}

	@GetMapping("/sendmsg")
	public void getsendmsg(Model model) {
		model.addAttribute("sendmsg", msgservice.getsendList("HOHO995@naver.com"));
	}

	@GetMapping("/freply")
	public void freply(Model model) {
		List<FreeReplyVO> arr = frservice.getfreereplystatus("HOHO995@naver.com");
		List<String> arr2 = new ArrayList<>();
		for (int i = 0; i < arr.size(); i++) {
			if (arr.get(i).getDeldt() == null) {
				arr2.add("원글 보기▶");
			} else {
				arr2.add("삭제된 글");
			}
		}
		model.addAttribute("replylist", frservice.readmyfreereply("HOHO995@naver.com"));
		model.addAttribute("replystatus", arr2);
	}

	@GetMapping("/mreply")
	public void mreply(Model model) {

		List<ReplyVO> arr = mrservice.getmeetreplystatus("HOHO995@naver.com");
		List<String> arr2 = new ArrayList<>();
		log.info(arr.get(0));
		for (int i = 0; i < arr.size(); i++) {
			if (arr.get(i).getDelDt() == null) {
				arr2.add("원글 보기▶");
			} else {
				arr2.add("삭제된 글");
			}
		}
		model.addAttribute("replylist", mrservice.readmymeetreply("HOHO995@naver.com"));
		model.addAttribute("replystatus", arr2);
	}

	@GetMapping("/regCenter")
	public void regCenter(Model model, HttpServletRequest request) {
		model.addAttribute("meet", mservice.getListTest("HOHO995@naver.com"));
		model.addAttribute("nick", mservice.getNick("HOHO995@naver.com"));
		model.addAttribute("code", cservice.getCatList());

	}

	@GetMapping("/home")
	public void home(Model model) {
		model.addAttribute("meet", mservice.getListTest("HOHO995@naver.com"));
		model.addAttribute("user", service.getMyList("HOHO995@naver.com"));
		model.addAttribute("enrollStatus", eservice.getEnrollStatus("HOHO995@naver.com"));
		model.addAttribute("enrollTitle", eservice.getEnrollTitle("HOHO995@naver.com"));
		model.addAttribute("thumbList", tservice.getThumbList("HOHO995@naver.com"));
		model.addAttribute("thumbRegDate", tservice.getThumbRegDate("HOHO995@naver.com"));
		model.addAttribute("subscribeList", sservice.getSubscribeList("HOHO995@naver.com"));
		model.addAttribute("getimg", service.getimg("HOHO995@naver.com"));
	}

	@RequestMapping("/register")
	public String register(UserVO user, RedirectAttributes rttr) {
		service.register(user);
		rttr.addFlashAttribute("result", user.getCid());
		return "mypage/modify";
	}

	@GetMapping("/get")
	public void get(@RequestParam("id") String id, Model model) {
		model.addAttribute("user", service.get(id));

	}

	@PostMapping("/mypostdelete")
	public String mypostdelete(Model model, HttpServletRequest request) {
		log.info("modify test 입니다~~~~~~~~~~~~~~~~~~");
		String[] arr = request.getParameterValues("mypostcheck");
		for (int i = 0; i < arr.length; i++) {
			fservice.mypostremove(arr[i]);
		}
		return "redirect:/mypage/home";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/home";
	}

	@GetMapping("/rcvmsg")
	public void getrcvmsg(Model model) {
		model.addAttribute("rcvmsg", msgservice.getrcvList("HOHO995@naver.com"));
	}

	@PostMapping("/rcvmsgdelete")
	public String rcvmsgdelete(Model model, HttpServletRequest request) {
		String[] arr = request.getParameterValues("rcvmsgcheck");
		for (int i = 0; i < arr.length; i++) {
			msgservice.rcvmsgremove(arr[i]);
		}
		return "redirect:/mypage/home";
	}

	@PostMapping("/sendmsgdelete")
	public String sendmsgdelete(Model model, HttpServletRequest request) {
		String[] arr2 = request.getParameterValues("sendmsgcheck");
		for (int i = 0; i < arr2.length; i++) {
			msgservice.sendmsgremove(arr2[i]);
		}
		return "redirect:/mypage/home";
	}

	@GetMapping("/pwdcheck")
	public void pwdcheck(Model model) {
		log.info("발신함~~~~~~~~~~~~~~~~");
	}

	@PostMapping("/sendmsgtest")
	public String sendmsg(Model model, HttpServletRequest request, MsgVO msg) {
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("msgcontent");
		msg.setId("HOHO995@naver.com");
		msg.setId2(receiver);
		msg.setContent(content);
		msgservice.sendmsg(msg);
		return "redirect:/mypage/sendmsg";
	}

//	@ResponseBody
//	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@GetMapping("/modify")
	public void modify(Model model) {
		model.addAttribute("user", service.getMyList("HOHO995@naver.com"));
		model.addAttribute("cat", cservice.getCatList());
		model.addAttribute("upper", cservice.upperregion());
		model.addAttribute("hope", hservice.getList("HOHO995@naver.com"));
	}

	@GetMapping("/readcontent")
	public String readcontent(Model model, HttpServletRequest request) {
		String[] readtest = request.getParameterValues("mypostcheck");
		return "redirect:/meet/get?mno=32";
	}

	@GetMapping("/redirecttest")
	public String redirecttest(Model model, String cid) {
		model.addAttribute("meet", mservice.getListWithCategory(cid));
		model.addAttribute("nick", mservice.getNick("HOHO995@naver.com"));
		model.addAttribute("code", cservice.getCatList());
		return "/mypage/regCenter";
	}

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		String uploadFolder = "C:\\upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("upload File Size : " + multipartFile.getSize());

			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {

		log.info("upload ajax");
	}

	@PostMapping("/freplydelete")
	public void freplydelete(HttpServletRequest request, Long frno) {
		String[] arr = request.getParameterValues("myreplycheck");
		for (int i = 0; i < arr.length; i++) {
			frservice.freplyremove(Long.parseLong(arr[i]));
		}
	}

	@PostMapping("/mreplydelete")
	public void mreplydelete(HttpServletRequest request, Long mrno) {
		String[] arr = request.getParameterValues("myreplycheck");
		log.info("모임댓글삭제테스트입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		log.info(arr);
		for (int i = 0; i < arr.length; i++) {
			mrservice.mreplyremove(Long.parseLong(arr[i]));
		}
	}

	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);

	}

	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName, Model model) {
		log.info("fileName: " + fileName);

		File file = new File("c:\\upload\\" + fileName);

		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile, Model model) {
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		String uploadFolderPath = getFolder();
		// make Folder----------

		File uploadPath = new File(uploadFolder, uploadFolderPath);
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String extension = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().indexOf(".") + 1);
			String uploadFileName = "HOHO995@naver.com" + "." + extension; // 여기에 아이디 넣기
//			String path = uploadFolderPath.replace("\\", "/") + "/";
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			attachDTO.setFileName(uploadFileName);
			UserVO uvo = new UserVO();
			uvo.setId("HOHO995@naver.com");
			uvo.setImg(uploadFileName);
			service.updateimg(uvo);

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				attachDTO.setUploadPath(uploadFolderPath);
				if (checkImageType(saveFile)) {
					attachDTO.setImage(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					thumbnail.close();
				}
				list.add(attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@PostMapping("/myinfomodify") // 내 정보 수정
	public String myinfomodify(HttpServletRequest request, Model model, UserVO uvo, HopeVO hvo) {
		int gender = Integer.parseInt(request.getParameter("gender"));
		String year = request.getParameter("year"); 
		String month = request.getParameter("month");
		String day = request.getParameter("day"); //생년월일 
		String forSplitReg= request.getParameter("region");
		String forSplitCat= request.getParameter("category");
		String[] reg=forSplitReg.split(",");
		String[] cat=forSplitCat.split(",");
		uvo.setSex(gender);
		uvo.setBirth(year + month + day);
		uvo.setId("HOHO995@naver.com");
		service.infomodify(uvo);
		
		hservice.delete("HOHO995@naver.com");
		hvo.setId("HOHO995@naver.com");	
		for(int i=0; i<cat.length; i++) {
			hvo.setCid(hservice.cidSearch(cat[i]));
			log.info("set된 값 체크입니다~~"+hvo.getCid());
			hservice.hopeInsert(hvo);
		} //관심 카테고리를 db에 insert
		for(int i=0; i<reg.length; i++) {
			hvo.setCid(hservice.cidSearch(reg[i]));
			log.info("set된 지역 체크입니다~~~~"+hvo.getCid());
						hservice.hopeInsert(hvo);
		} //관심지역을 db에 insert
		return "redirect:/mypage/modify";
	}

	@PostMapping("/nickmodify") // 닉네임 수정
	public String nickmodify(HttpServletRequest request, Model model, UserVO uvo) {
		String nick = request.getParameter("nick");
		uvo.setNick(nick);
		uvo.setId("HOHO995@naver.com");
		service.nickmodify(uvo);
		String afternick = service.getMyList("HOHO995@naver.com").getNick();
		return afternick;
	}

	@ResponseBody
	@RequestMapping(value = "/nickChk", method = RequestMethod.POST)
	public int nickChk(String nick) {
		log.info(service.nickChk(nick));
		return service.nickChk(nick);
	}

	@ResponseBody
	@RequestMapping(value = "/detailregion", method = RequestMethod.POST)
	public List<CodeTableVO> detailregion(String cid) {
		return cservice.detailregion(cid);
	}



}
