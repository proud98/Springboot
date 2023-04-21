package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	MemberService service;
	
	//0. root 설정
	@GetMapping("/login/main") //menu.jsp에 있는 주소가 매핑주소
	public String loginform(HttpSession session,Model model) {
		
		//2
		//폼의 데이터를 얻어줌
		String myid=(String)session.getAttribute("myid"); //세션으로부터 myid를 가져와서 myid라고 저장
		//로그인 상태인지 아닌지 판단
		String loginok=(String)session.getAttribute("loginok"); //세션으로부터 loginok를 가져와서 loginok라고 저장
		
		//한 번도 실행 안하면 null이니까 로그아웃 상태면 loginform으로 else면 logoutform으로
		if(loginok==null) {			
			return "/login/loginform";
		}else {
			//로그인 중이면 request에 로그인한 이름 저장
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/login/logoutform"; //로그인 상태면 main은 logout폼으로
			
		}		
		
	}
	
	//1. loginform action 처리
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id, @RequestParam String pass, @RequestParam(required = false) String cbsave, HttpSession session, Model model ) {
		//cbsave(아이디저장)은 체크 할 수도 있고 안 할수도 있으니 안했을 때 오류 나지 않게 기본적으론 null이 저장돠게끔 required = false 주기
		
		//id와 pass 받기
		int check=service.loginIdPassCheck(id, pass);
		
		//일치(1)인지 불일치(0)인지
		if(check==1) {
			
			session.setMaxInactiveInterval(60*60*8); //8시간동안 세션 저장
			
			//세션에 저장
			session.setAttribute("myid", id); //id를 받아서 myid라고 저장
			session.setAttribute("loginok", "yes"); //yes라는 문자열을 loginok라고 함 ex) <c:if test="${loginok=='yes }">로그인 중입니다.</c:if> 이렇게 사용
			session.setAttribute("saveok", cbsave); //cbsave를 받아서 saveok라고 저장
			
			//id에 대한 데이터 얻기
			MemberDto dto=service.getDataId(id);		
			session.setAttribute("loginphoto", dto.getPhoto()); //로그인 한 상태에서 세션에는 모든 값들을 다 저장해서 가져다 쓸 수 있음 (name,pass 등등)
			
			return "redirect:main"; //return은 main으로 보냄 (main에서는 세션을 set한걸 받아서 로그인인지 로그아웃인지 상태 판단)
		}else {
			
			return "/login/passfail"; //로그인 실패시 passfail로 보냄
		}
		
	}
	
	//3. logoutform 에서 로그아웃 버튼 눌렀을 때 세션 삭제
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		
		return "redirect:main";
	}

}
