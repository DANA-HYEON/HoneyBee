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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.honeybee.domain.AttachFileDTO;
import com.honeybee.domain.FreeReplyVO;
import com.honeybee.domain.FreeVO;
import com.honeybee.domain.MeetVO;
import com.honeybee.domain.MsgVO;
import com.honeybee.domain.UserVO;
import com.honeybee.service.CodeTableService;
import com.honeybee.service.EnrollListService;
import com.honeybee.service.FreeReplyService;
import com.honeybee.service.FreeService;
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

	@GetMapping("/posted")
	public void posted(Model model, String id) {
		log.info("posted");
//		model.addAttribute("list", fservice.getMyList("HOHO995@naver.com"));
		model.addAttribute("list", fservice.getMyList(id)); // id를 받아서 리스트 가져옴
	}

	@GetMapping("/sendmsg")
	public void getsendmsg(Model model) {
		log.info("sendmsg");
		log.info(msgservice.getsendList("HOHO995@naver.com"));
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
	

	@GetMapping("/regCenter")
	public void regCenter(Model model, HttpServletRequest request) {
		log.info("list");
		log.info(mservice.getNick("HOHO995@naver.com"));
		log.info("---------------------------------");
		log.info(cservice.getCatList());
		log.info(request.getParameter("cid"));
		model.addAttribute("meet", mservice.getListTest("HOHO995@naver.com"));
		model.addAttribute("nick", mservice.getNick("HOHO995@naver.com"));
		model.addAttribute("code", cservice.getCatList());

	}

	@GetMapping("/home")
	public void home(Model model) {
		log.info("홈입니다!!!!!");
		log.info("-----------------------------------");
		log.info(tservice.getThumbList("HOHO995@naver.com"));
		model.addAttribute("meet", mservice.getListTest("HOHO995@naver.com"));
		model.addAttribute("user", service.getMyList("HOHO995@naver.com"));
		model.addAttribute("enrollStatus", eservice.getEnrollStatus("HOHO995@naver.com"));
		model.addAttribute("enrollTitle", eservice.getEnrollTitle("HOHO995@naver.com"));
		model.addAttribute("thumbList", tservice.getThumbList("HOHO995@naver.com"));
		model.addAttribute("thumbRegDate", tservice.getThumbRegDate("HOHO995@naver.com"));
		model.addAttribute("subscribeList", sservice.getSubscribeList("HOHO995@naver.com"));
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

//	@PostMapping("/modify")
//	public void modify(Model model, HttpServletRequest request) {
//		log.info("modify test 입니다~~~~~~~~~~~~~~~~~~");
//		String[] arr = request.getParameterValues("mypostcheck");
//		for (int i = 0; i < arr.length; i++) {
//			fservice.mypostremove(arr[i]);
//		}
////		return "redirect:/mypage/home";
//	}

	@PostMapping("/remove")
	public String remove(@RequestParam("id") String id, RedirectAttributes rttr) {

		log.info("remove...." + id);
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/mypage/home";
	}

	@GetMapping("/rcvmsg")
	public void getrcvmsg(Model model) {
		log.info("수신함 체크입니다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		log.info(msgservice.getrcvList("HOHO995@naver.com"));
		model.addAttribute("rcvmsg", msgservice.getrcvList("HOHO995@naver.com"));
	}

	@PostMapping("/rcvmsgdelete")
	public String rcvmsgdelete(Model model, HttpServletRequest request) {
		log.info("수신함 메세지 삭제 test 입니다~~~~~~~~~~~~~~~~~~");
		String[] arr = request.getParameterValues("rcvmsgcheck");
		for (int i = 0; i < arr.length; i++) {
			msgservice.rcvmsgremove(arr[i]);
		}
		return "redirect:/mypage/home";
	}

	@PostMapping("/sendmsgdelete")
	public String sendmsgdelete(Model model, HttpServletRequest request) {
		log.info("발신함 메세지 삭제 test 입니다~~~~~~~~~~~~~~~~~~");
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

//	@PostMapping("myreplydelete")
//	public String myreplydelete

	@PostMapping("/sendmsgtest")
	public String sendmsg(Model model, HttpServletRequest request, MsgVO msg) {
		log.info("sendmsg..................");
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("msgcontent");
		msg.setId("HOHO995@naver.com");
		msg.setId2(receiver);
		msg.setContent(content);
		msgservice.sendmsg(msg);
		return "redirect:/mypage/sendmsg";
	}

	@GetMapping("/modify")
	public void modify() {

	}

	@GetMapping("/readcontent")
	public String readcontent(Model model, HttpServletRequest request) {
		String[] readtest = request.getParameterValues("mypostcheck");
		log.info("-------------------------------------");
		log.info(readtest == null);
		return "redirect:/meet/get?mno=32";
	}

	@GetMapping("/redirecttest")
	public String redirecttest(Model model, String cid) {
		log.info(mservice.getListWithCategory(cid));
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
	public ResponseEntity<byte[]> getFile(String fileName){
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
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		// make folder --------
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder
		for (MultipartFile multipartFile : uploadFile) {
			
			AttachFileDTO attachDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				if (checkImageType(saveFile)) {
					
					attachDTO.setImage(true);;
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
}
