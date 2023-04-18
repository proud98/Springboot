package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("bookdto")
@Data
public class BookDto {
	
	private int num;
	private String bookname;
	private String bookwriter;
	private int bookprice;
	private String bookphoto;
	private String bookcompany;
	private Timestamp ipgoday;

}
