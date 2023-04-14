package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insertBoard(BoardDto dto) {
		
		daoInter.save(dto);
		
	}
	
	//list
	public List<BoardDto> getAllData(){
		
		//return daoInter.findAll();

		//내림차순으로 출력
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	//detail (num에 대한 데이터값)
	public BoardDto getData(long num) {
		
		return daoInter.getReferenceById(num);
	}
	
	//update
	public void updateBoard(BoardDto dto) {
		
		daoInter.save(dto);
	}
	
	//delete
	public void deleteBoard(long num) {
		
		daoInter.deleteById(num);
	}

}
