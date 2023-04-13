package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {
	
	@Autowired
	MycarDao dao;
	
	//시작루트 설정
	@GetMapping("/")
	public String start() {
		
		return "redirect:car/carform";
	}
	
	//form주소 
	@GetMapping("car/carform")
	public String form() {
		
		return "caraddform";
	}
	
	//insert
	@PostMapping("/car/insert")
	public String insertCar(@ModelAttribute MycarDto dto) {
		
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	//list
	@GetMapping("/car/list")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		//dao 가져오기
		List<MycarDto> list=dao.getAllDatas();
		
		//저장
		mview.addObject("list", list);
		mview.addObject("totalCount", list.size());
		
		mview.setViewName("carlist");
		
		return mview;
	}
	
	//delete
	@GetMapping("/car/delete")
	@ResponseBody
	public void delete(long num) {
		
		dao.delete(num);
		
	}
	
	//update
	@GetMapping("/car/updateform")
	public ModelAndView updateform(long num) {
		
		ModelAndView mview=new ModelAndView();
		
		//dao 받아오기
		MycarDto dto=dao.getData(num);
		//request에 저장
		mview.addObject("dto", dto);
		
		//포워드
		mview.setViewName("carupdateform");
		
		return mview;
	}
	
	@PostMapping("car/update")
	public String update(@ModelAttribute MycarDto dto) {
		
		dao.updateCar(dto);
		
		return "redirect:list";
	}

}
