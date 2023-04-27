package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReBoardDto;
import boot.data.service.ReBoardService;

@Controller
public class ReBoardController {
	
	@Autowired
	ReBoardService service;
	
	@GetMapping("/reboard/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage, 
			@RequestParam(value = "searchcolum",required = false) String sc, @RequestParam(value = "searchword",required = false) String sw ) {
		
		ModelAndView model=new ModelAndView();
		
		int totalPage; 
		int startPage; 
		int endPage; 
		int start; 
		int perPage=5; 
		int perBlock=5; 
		
		//전체 갯수
		int totalCount=service.getTotalCount(sc, sw);
		
		//총 페이지 갯수
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
		
		//각 블럭의 시작 페이지 
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		    
		if(endPage>totalPage)
		   endPage=totalPage;
	    
	    //각 페이지에서 불러 올 시작번호
	    start=(currentPage-1)*perPage; 
	    
	    List<ReBoardDto> list=service.getPagingList(sc, sw, start, perPage);
	    
	    
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
		
		model.setViewName("/reboard/boardlist");
		return model;
	}
	
	//글쓰기 form으로 이동
	@GetMapping("/reboard/form")
	public String form(@RequestParam(defaultValue = "0") int num, 
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep, 
			@RequestParam(defaultValue = "0") int relevel, 
			@RequestParam(defaultValue = "1") int currentPage, Model model) {
		
		/**답글일 때 넘어오는 값
		새 글일 경우 모두 null이므로 defaultValue값으로 전달**/
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		//제목에 새 글일 경우 ""
		String subject="";
		//답글일 경우에는 해당 제목 넣기
		if(num>0) {
			subject=service.getData(num).getSubject();
		}
		//subject도 model에 저장
		model.addAttribute("subject", subject);
		
		return "/reboard/writeform";
	}
	
	
	//insert action 처리
	@PostMapping("/reboard/insert")
	   public String insert(ReBoardDto dto,int currentPage,List<MultipartFile> upload,
	         HttpSession session)
	   {
	      
	      String path=session.getServletContext().getRealPath("/photo");
	      
	      
	      if(upload.get(0).getOriginalFilename().equals(""))
	         dto.setPhoto("no");
	      else {
	         
	         String photo="";
	         int idx=1;
	         SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	         
	         for(MultipartFile multi:upload)
	         {
	            String newName=idx++ +"_"+sdf.format(new Date())+multi.getOriginalFilename();
	            photo+=newName+",";
	            
	            try {
	               multi.transferTo(new File(path+"\\"+newName));
	            } catch (IllegalStateException | IOException e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	         }
	         
	         photo=photo.substring(0, photo.length()-1);
	         
	         dto.setPhoto(photo);
	      }
	      
	      
	      service.insertReBoard(dto);
	      
	      return "redirect:list?currenrPge="+currentPage;
	   }
	
}
