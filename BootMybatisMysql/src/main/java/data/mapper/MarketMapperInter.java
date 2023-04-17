package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MarketDto;

@Mapper
public interface MarketMapperInter {
	
	//mapperInter의 id 이름과 같아야함!!
	public int getTotalCount();
	public void insertMarket(MarketDto dto);
	public List<MarketDto> getAllDatas();
	public void deleteMarket(String num);
	public MarketDto getNum(String num);
	public void updateMarket(MarketDto dto);

}
