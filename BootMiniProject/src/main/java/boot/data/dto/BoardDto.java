package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("BoardDto")
public class BoardDto {
	
	   private String num;
	   private String name;
	   private String myid;
	   private String subject;
	   private String content;
	   private String uploadfile; //insert할때 multipart 대신에
	   private MultipartFile upload; //dto 멤버로 줄수도 있음 
	   private int readcount;
	   private Timestamp writeday;
	   
	   private int acount; //제목에 댓글 수 
}
