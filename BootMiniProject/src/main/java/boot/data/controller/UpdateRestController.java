package boot.data.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
public class UpdateRestController {
	
	@Autowired
	MemberService service;
	
	
	@PostMapping("/member/up")
	public void memberUp(String num, @ModelAttribute MemberDto dto) {
		
		service.updateMember(dto);
			
	}
	
	

}
