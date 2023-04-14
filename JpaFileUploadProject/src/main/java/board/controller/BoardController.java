package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDao;
import board.data.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/")
	public String home() {
		
		return "redirect:board/list";
		
	}
	
	@GetMapping("/board/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		List<BoardDto> list=dao.getAllData();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("list");
		
		return model;
	}
	
	@GetMapping("/board/writeform")
	public String form() {
		
		return "addform";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto, @RequestParam MultipartFile upload, HttpSession session) {
		
		//업로드 된 실제경로
		String realPath=session.getServletContext().getRealPath("/save");
		System.out.println(realPath);
		
		/*사진을 실제경로에 업로드 시킨 후 그 파일명을 dto의 photo에 저장 > uploadName이라고 이름 지정
		  사진을 안넣으면 no라고 저장*/
		String uploadName=upload.getOriginalFilename();
		
		if(upload.isEmpty()) {
			dto.setPhoto("no");
		}else {
			dto.setPhoto(uploadName);
		}
		
		//실제 업로드
		try {
			upload.transferTo(new File(realPath+"\\"+uploadName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//db저장
		dao.insertBoard(dto);
		
		return "redirect:list";
	}

}
