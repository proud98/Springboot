package boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.model.PersonDto;

@Controller
public class FormController {
	
	@GetMapping("/sist/form1")
	public String form1() {
		
		return "form/form1"; //WEB-INF/board/form/form1.jsp
	}
	
	@GetMapping("/sist/form2")
	public String form2() {
		
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3() {
		
		return "form/form3";
	}
	
	@PostMapping("/sist/read1")
	public String read1(Model model, @RequestParam String name, @RequestParam int java, @RequestParam int spring) {
		
		model.addAttribute("name", name);
		model.addAttribute("java", java);
		model.addAttribute("spring", spring);
		
		return "result/result1";
	}
	
	@PostMapping("/sist/read2")
	public String read2(@ModelAttribute PersonDto dto) {
		
		return "result/result2";
	}
	
	/*
	 * @PostMapping("/sist/read2") public String read2(@ModelAttribute PersonDto
	 * dto, Model model) {
	 * 
	 * model.addAttribute("dto", dto);
	 * 
	 * return "result/result2"; }
	 */
	
	@PostMapping("/sist/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		//map으로 읽을 경우 폼의 name이 key값으로 입력값이 value값으로 저장
		ModelAndView model=new ModelAndView();
		
		//겂 얻어오기
		model.addObject("name", map.get("name"));
		model.addObject("blood", map.get("blood"));
		model.addObject("hp", map.get("hp"));
		
		//포워드
		model.setViewName("result/result3");
		
		return model;
	}

}
