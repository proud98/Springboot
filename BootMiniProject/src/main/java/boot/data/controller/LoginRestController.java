package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@RestController
public class LoginRestController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/member/login") //매핑이름은 맘대로 정하고 ajax의 url이랑 맞춰만주면 됨
	public Map<String, String> loginproc(String id, String pass, HttpSession session){
		//리턴값 돌려주기 위해서....ajax에서 { : } {1:1} 이런식으로 받아야해서 맵 형태
		
		Map<String, String> map=new HashMap<>();
		
		int result=service.loginIdPassCheck(id, pass);
		
		if(result==1) {
			
			//세션설정
			session.setMaxInactiveInterval(60*60*4); //세션 4시간 동안 저장
			
			//로그인 한 정보 얻기
			MemberDto mdto=service.getDataId(id);
			//session에 저장
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginname", mdto.getName());
		}
		
		map.put("result", result==1?"success":"fail"); //위에서 처리한 result를 1이면 success, 0이면 fail 로 설정하고 result라고 재지정
		
		return map;
		
	}
	
	//세션삭제
	@GetMapping("/member/logout")
	public void logoutproc(HttpSession session) {
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
	}

}
