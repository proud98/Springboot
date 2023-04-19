package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
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

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		
		return "/layout/main";	//홈 만큼은 언제나 main
		
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		//전체 개수 가져오기
		int totalCount=mapper.getTotalCount();
		
		//전체 조회
		List<IpgoDto> list=mapper.getAllDatas();
		
		//대표이지미
		for(IpgoDto dto:list) {
			
			String [] photos=dto.getPhotoname().split(","); //배열 형태로 사진 담기
			dto.setDimage(photos[0]); //photos 로 부터 온 0번째 사진을 dto에 새로 추가해줬던 변수 dimage에 담기
			System.out.println(dto.getDimage());
		}
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//model.setViewName("ipgolist"); jsp 리졸버
		model.setViewName("/ipgo/ipgolist"); //tiles 리졸버
		return model;
	}
	
	@GetMapping("/ipgo/form")
	public String form() {
		
		//return "ipgoform"; jsp 리졸버
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto,@RequestParam ArrayList<MultipartFile> upload, HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");
		
		String uploadName="";
		int idx=1; //사진에 줄 인덱스 번호
		
		//만약 upload의 첫번째 파일이 빈문자면
		if(upload.get(0).getOriginalFilename().equals("")) {
			uploadName="no"; //no라고 이름 지정해주겠음 (파일 텀부 안 한 경우)
		}else { //그게 아니고(파일 첨부가 됐으면)
			//for문으로 파일들 여러개 첨부
			for(MultipartFile f:upload) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx++ +"_"+sdf.format(new Date())+"_"+f.getOriginalFilename(); //인덱스번호 + 첨부한 시각 + 원래 파일이름 = fName
				uploadName+=fName+","; //fNamw과 , 누적시켜서 첨부
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//마지막 컴마 제거
			uploadName=uploadName.substring(0,uploadName.length()-1);
			
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpgo(dto);
		
		return "redirect:list";
	}
	
	//오시는길로 가기 서브레이아웃으로
	@GetMapping("load/map")
	public String map() {
		
		return "/sub/load/map"; //title 레이아웃은 /폴더명/파일명 or /sub/폴더명/파일명
	}
	

}
