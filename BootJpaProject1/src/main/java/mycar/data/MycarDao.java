package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {
	
	@Autowired
	MycarDaoInter carInter; //인터페이스 자동 주입..dto와 id 값이 들어있음
	
	//insert
	public void insertCar(MycarDto dto) {
		
		carInter.save(dto); //id유무에 따라서 자동으로 insert or update
	}
	
	//전체출력
	public List<MycarDto> getAllDatas(){
		
		return carInter.findAll(); //.findAll()는 전체 출력
	}
	
	//삭제
	public void delete(long num) {
		
		carInter.deleteById(num);
	}
	
	//수정 num에 대한 데이터 얻기
	public MycarDto getData(long num) {
		
		return carInter.getReferenceById(num);
	}
	
	//수정
	public void updateCar(MycarDto dto) {
		
		carInter.save(dto);
	}

}
