package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("IpgoDto")
public class IpgoDto {
	
	private String num;
	private String sangpum;
	private String photoname;
	private int price;
	private Timestamp ipgoday;
	
	private String dimage; //대표 이미지 변수 추가하기

}
