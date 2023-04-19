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
import org.springframework.web.multipart.MultipartFile;

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
	      
	      // return "/member/gaipSuccess";
	      return "redirect:list";
	   }
	
	//나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "/member/myinfo";
	}

}
