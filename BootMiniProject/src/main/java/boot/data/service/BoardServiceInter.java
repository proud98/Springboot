package boot.data.service;

import java.util.List;

import boot.data.dto.BoardDto;

public interface BoardServiceInter {
	
	public int getToatalCount();
	public void updateReadCount(String num);
	public BoardDto getData(String num);
	public int getMaxNum();
	public List<BoardDto> getList(int start, int perpage); //map string으로 풀어서 써주기
	public void insertBoard(BoardDto dto);

}
