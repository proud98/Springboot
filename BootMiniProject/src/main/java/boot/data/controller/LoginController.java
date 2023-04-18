package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/login/main") //menu.jsp에 있는 주소가 매핑주소
	public String loginform() {
		
		return "/login/loginform";
	}

}
