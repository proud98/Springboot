package boot.data.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.SmartDto;
import boot.data.service.SmartService;

@Controller
@RequestMapping("/smart")
public class SmartContoller {
	
	@Autowired
	SmartService service;
	
	@GetMapping("/form")
	public String form() {
		
		return "/smart/smartform";
	}
	
	//insert
	@PostMapping("/insert")
	public String insert(@ModelAttribute SmartDto dto) {
		
		service.insertShop(dto);
		
		return "redirect:list";
	}
	
	
	//리스트
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount=service.totalCount();
		
		int totalPage; 
		int startPage; 
		int endPage; 
		int start; 
		int perPage=5; 
		int perBlock=5; 
		     
		//총 페이지 갯수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭의 시작 페이지 
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		    
		if(endPage>totalPage)
		   endPage=totalPage;
	    
	    //각 페이지에서 불러 올 시작번호
	    start=(currentPage-1)*perPage; 
	    
	    List<SmartDto> list=service.getShopList(start, perPage); 
	    
	    int no=totalCount-(currentPage-1)*perPage;
	    
	    //출력에 필요한 변수를 model에 저장
	    model.addObject("totalCount", totalCount);
	    model.addObject("list", list);
	    model.addObject("totalPage", totalPage);
	    model.addObject("startPage", startPage);
	    model.addObject("endPage", endPage);
	    model.addObject("perBlock", perBlock);
	    model.addObject("currentPage", currentPage);
	    model.addObject("no", no);
		
		model.setViewName("/smart/smartlist");
		
		return model;
	}
	
	//상세보기
	@GetMapping("/detail")
	public ModelAndView detail(int num, int currentPage ) {
		
		ModelAndView model=new ModelAndView();
		
		SmartDto dto=service.getSangpum(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/smart/detail");
		
		return model;
		
	}
	
	@GetMapping("/delete")
	public String delete(int num) {
		service.deleteShop(num);
		return "redirect:list";
	}
	
	@GetMapping("/updateform")
	public ModelAndView update(int num, int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		SmartDto dto=service.getSangpum(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/smart/updateform");
		
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute SmartDto dto,int num,int currentPage) {
		
		service.updateSmart(dto);
		
		return "redirect:detail?num="+num+"&currentPage="+currentPage;
		
	}
	
	
	
	
	
}
