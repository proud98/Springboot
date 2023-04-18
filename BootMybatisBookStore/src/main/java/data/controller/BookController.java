package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import data.dto.BookDto;
import data.mapper.BookMapperInter;

@Controller
public class BookController {
	
	@Autowired
	BookMapperInter mapper;
	
	@GetMapping("/")
	public String home() {
		
		return "redirect:book/list";
	}
	
	@GetMapping("/book/list")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		List<BookDto> list=mapper.getAllDatas();
		
		for(BookDto dto:list) {
	
			String [] photos=dto.getBookphoto().split(",");
			dto.setBookphoto(photos[0]);
		}
		
		mview.addObject("totalCount", totalCount);
		mview.addObject("list", list);
		
		mview.setViewName("booklist");
		return mview;
	}
	
	@GetMapping("/book/add")
	public String add() {
		
		return "addform";
	}
	
	@PostMapping("/book/insert")
	public ModelAndView insert(@ModelAttribute BookDto dto, @RequestParam ArrayList<MultipartFile> photo, HttpSession session) {
		
		ModelAndView mview=new ModelAndView();

		String path=session.getServletContext().getRealPath("/upload");
		
		ArrayList<String> files=new ArrayList<String>();

		
		for(MultipartFile f:photo) {
			String fileName=f.getOriginalFilename()+",";
			
			files.add(fileName);
			//dto.setBookphoto(fileName);

			try {
				f.transferTo(new File(path+"\\"+fileName.substring(0, fileName.length() - 1)));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			
		}
		
		
		 String fileName = String.join("", files);
		    if (fileName.endsWith(",")) {
		    	fileName = fileName.substring(0, fileName.length() - 1);
		    }
		    dto.setBookphoto(fileName);
		    
		    
		mapper.insertBook(dto);
		
		mview.addObject("path", path);
		mview.addObject("files", files);
		
		mview.setViewName("redirect:list");
			
		return mview;
		
		
	}
	

}
