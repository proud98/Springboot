package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {
	
	public int getTotalCount(); //sql의 아이디가 됨
	public void insertIpgo(IpgoDto dto);
	public List<IpgoDto> getAllDatas(); //전체리스트

}
