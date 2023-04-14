package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JpaController {
	
	@Autowired
	JpaDao dao;
	
	@GetMapping("/shop/form")
	public String form() {
		return "insertform";
	}
	
	@PostMapping("/shop/insert")
	public String insertShop(@ModelAttribute JpaShopDto dto) {
		
		dao.insert(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/shop/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<JpaShopDto> list=dao.getAllData();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("shoplist");
		
		return model;
	}
	
	@GetMapping("/shop/detail")
	public ModelAndView detail(int num) {
		
		ModelAndView mview=new ModelAndView();
		
		JpaShopDto dto=dao.getNum(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("detail");
		
		return mview;
		
	}
	
	


}
