package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberServiceInter;

@Controller
public class MemberController {
	
	@Autowired
	MemberServiceInter service; //mapper를 품은 애
	
	@GetMapping("/member/form") //menu에서 준 매핑주소
	public String memberlist() {
		
		return "/member/memberform"; 
	}
	
	@GetMapping("/member/list")
	public String list(Model model) {
		
		//전체조회
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		
		return "/member/memberlist";
	}
	
	//id 중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheckPass(@RequestParam String id){
		
		Map<String, Integer> map=new HashMap<>();
		
		//id로 0 or 1 반환
		int n=service.getSearchId(id);
		
		map.put("count", n); //n을 받아와서 count 변수에 저장 {"count":0}
		
		return map;
		
	}
	
	//insert
	@PostMapping("/member/insert")
	   public String insert(@ModelAttribute MemberDto dto,
	                   @RequestParam MultipartFile myphoto,
	                   HttpSession session,
	                   Model model) {
	      
	      String path = session.getServletContext().getRealPath("/photo");
	      
	      int index = 1;
	      
	      if(myphoto.getOriginalFilename().equals(""))
	         dto.setPhoto("null");
	      else {
	         SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHss");
	         
	         String photoname = "f" + index++ + "_" + sdf.format(new Date()) + "_" + myphoto.getOriginalFilename();
	         
	         try {
	            myphoto.transferTo(new File(path + "//" + photoname));
	         } catch (IllegalStateException | IOException e) {
	            e.printStackTrace();
	         }
	         
	         dto.setPhoto(photoname);
	      }
	      
	      service.insertMember(dto);
	      
	      return "/member/gaipsuccess";
	      //return "redirect:list";
	   }
	
	//나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "/member/myinfo";
	}
	
	
	//회원목록 삭제
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num) {
		
		service.memberDelete(num);
	}
	
	//회원정보에서 사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoUpload(String num, MultipartFile photo, HttpSession session) {
		//ajax에서 파일업로드는 MultipartFilefmf form과 이름을 맞춰주지 않아도 됨
		
		//업로드 될 경로
		String path=session.getServletContext().getRealPath("/photo");
		
		//파일명구하기
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
		
		try {
			
			photo.transferTo(new File(path+"\\"+fName));
			
			service.updatePhoto(num, fName); //db 사진 수정 (세션은아직)
			session.setAttribute("loginphoto", fName); //세션까지 수정
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	


}
