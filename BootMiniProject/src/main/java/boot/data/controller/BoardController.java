package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.service.BoardService;
import boot.data.service.MemberService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/board/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		//총 개수
		int totalCount=service.getToatalCount();
		
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
	    
	    List<BoardDto> list=service.getList(start, perPage);
	    
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
		
		model.setViewName("/board/boardlist");
		
		return model;

	}
	
	@GetMapping("/board/form")
	public String form() {
		
		return "/board/writeform";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto, HttpSession session) {
		
		//업로드 할 폴더 지정
		String path=session.getServletContext().getRealPath("/photo");
		
		//업로드 할 파일명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//업로드 안 한 경우 no나 null
		if(dto.getUpload().getOriginalFilename().equals("")) {
			
			dto.setUploadfile("no");
		}else {
			//업로드 한 경우
			String uploadFile="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadFile);
			
			//실제 업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadFile));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 id 얻어서
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid); // dto에 저장하기
		
		//이름은 memberservice에서 얻어서 dto에 저장 
		String name=mservice.getName(myid);
		dto.setName(name);
		
		//db에 insert
		service.insertBoard(dto);
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/board/content")
	public ModelAndView content(String num, @RequestParam(defaultValue = "1") int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		service.updateReadCount(num); //조회수증가
		
		BoardDto dto=service.getData(num); 
		
		
		//업로드 파일의 확장자 구하기
		int dotte=dto.getUploadfile().lastIndexOf("."); //마지막 도틍의 위치 최고심2.jpg 의 . 을 말하는 듯
		String ext=dto.getUploadfile().substring(dotte+1); //dotte의 다음 글자부터 끝까지 추출 j부터 g까지
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif") || ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg")) {
			
			mview.addObject("bupload", true); //파일이 이미지인지
		}else {
			mview.addObject("bupload", false); //아닌지
		}
		
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/board/content");
		
		return mview;
	}
	
}
