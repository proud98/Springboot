package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReBoardDto;

@Mapper
public interface ReBoardMapperInter {
	
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<ReBoardDto> getPagingList(Map<String, Object> map);
	public void insertReBoard(ReBoardDto dto);
	public void updateReStep(Map<String, Integer> map);
	public void updateReadCount(int num);
	public ReBoardDto getData(int num);
	public void updateReBoard(ReBoardDto dto);
	public void deleteReBoard(int num);
	public void likesUpdate(int num);

}
