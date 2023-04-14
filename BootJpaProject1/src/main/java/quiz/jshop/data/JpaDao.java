package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JpaDao {
	
	@Autowired
	JpaDaoInter jpaInter;
	
	//insert
	public void insert(JpaShopDto dto) {
		
		jpaInter.save(dto);
	}
	
	//목록출력
	public List<JpaShopDto> getAllData(){
		
		return jpaInter.findAll();
	}
	
	//num data조회
	public JpaShopDto getNum(int num) {
		
		return jpaInter.getReferenceById(num);
	}

}
