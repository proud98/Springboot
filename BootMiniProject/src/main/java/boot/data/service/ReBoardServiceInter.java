package boot.data.service;

import java.util.List;
import boot.data.dto.ReBoardDto;

public interface ReBoardServiceInter {
	
	public int getMaxNum();
	public int getTotalCount(String searchcolum, String searchword);
	public List<ReBoardDto> getPagingList(String searchcolum, String searchword,int start,int perpage);
	public void insertReBoard(ReBoardDto dto);
	public void updateReStep(int regroup,int restep);
	public void updateReadCount(int num);
	public ReBoardDto getData(int num);
	public void updateReBoard(ReBoardDto dto);
	public void deleteReBoard(int num);
	public void likesUpdate(int num);

}
