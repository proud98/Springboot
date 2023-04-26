package boot.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberServiceInter;

@RestController
public class DbAnswerController {
	
	@Autowired
	MemberServiceInter memService;
	
	@Autowired
	BoardAnswerService dbService;
	
	//insert
	@PostMapping("/board/ainsert")
	public void insert(@ModelAttribute BoardAnswerDto dto, HttpSession session) {
		
		//세션에 로그인 한 아이디 얻기 
		String myid=(String)session.getAttribute("myid");
		
		//아이디를 넘겨서 name 얻기
		String name=memService.getName(myid);
		
		//dto에 넣기
		dto.setMyid(myid);
		dto.setName(name);
		
		//insert
		dbService.insertAnswer(dto);
		
	}
	
	//list
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(String num){
		
		return dbService.getAllAnswers(num);
	}
	
	//delete
	@GetMapping("/board/adelete")
	public void delete(String idx) {
		dbService.deleteAnswer(idx);
	}
	
	
	//getData
	@GetMapping("/board/updateform")
	public BoardAnswerDto data(String idx) {
		
		BoardAnswerDto dto=dbService.getAnswer(idx);
		return dto;
	}

	
	
	//update
	@PostMapping("/board/update")
	public void update(@ModelAttribute BoardAnswerDto dto, HttpSession session) {
		
		/*
		 * String myid=(String)session.getAttribute("myid");
		 * 
		 * String name=memService.getName(myid);
		 * 
		 * dto.setMyid(myid); dto.setName(name);
		 */
		
		
		dbService.updateAnswer(dto);
		
	}
	
	
	

}
