package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@GetMapping("/")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		//모델에 저장
		model.addObject("name", "하랑");
		model.addObject("addr", "서울시");
		model.addObject("hp", "010-1234-5678");
		
		//포워드
		model.setViewName("redirect:sist/home");
		
		return model;
	}

}
