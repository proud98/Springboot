package data.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MarketDto;
import data.mapper.MarketMapperInter;

@Controller
public class MarketController {
	
	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/") //root 매핑
	public String start() {
		
		return "redirect:market/list"; //목록으로
	}
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount=mapper.getTotalCount();
		
		List<MarketDto> list=mapper.getAllDatas();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("marketlist");
		return model;
	}
	
	@GetMapping("/market/form")
	public String form() {
		
		return "addform";
	}
	
	@PostMapping("/market/insert")
	public String insert(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname(null); //사진 첨부 안하면 null 로 들어가고
		}else { //그게 아니면
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss"); //날짜와
			String photoname="f_"+sdf.format(new Date())+photo.getOriginalFilename(); //파일 이름을 합펴서 파일의 업로드 이름 지정
			
			//db에 저장
			dto.setPhotoname(photoname); 
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMarket(dto);
		
		return "redirect:list";
		
	}
	
	@GetMapping("/market/delete")
	public String delete(String num, HttpSession session) {
		
		String photoname=mapper.getNum(num).getPhotoname();
		if(photoname!=null) {
			String path=session.getServletContext().getRealPath("/upload");
			
			File file=new File(path+"\\"+photoname);
			file.delete();
		}
		
		mapper.deleteMarket(num);
		
		return "redirect:list";
	}	
	
	@GetMapping("/market/updateform")
	public ModelAndView uform(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		MarketDto dto=mapper.getNum(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("updateform");
		
		return mview;
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto, @RequestParam MultipartFile photo, HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals("")) {
			dto.setPhotoname("no"); //사진 첨부 안하면 null 로 들어가고
		}else { //그게 아니면
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss"); //날짜와
			String photoname="f_"+sdf.format(new Date())+photo.getOriginalFilename(); //파일 이름을 합펴서 파일의 업로드 이름 지정
			
			//db에 저장
			dto.setPhotoname(photoname); 
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.updateMarket(dto);
		
		return "redirect:list";
		
	}
	
	

}
