package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ReBoardDto;
import boot.data.mapper.ReBoardMapperInter;

@Service
public class ReBoardService implements ReBoardServiceInter {
	
	@Autowired
	ReBoardMapperInter mapper;

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapper.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolum, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolum", searchcolum);
		map.put("searchword", searchword);		
		
		return mapper.getTotalCount(map);
	}

	@Override
	public List<ReBoardDto> getPagingList(String searchcolum, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolum", searchcolum);
		map.put("searchword", searchword);	
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getPagingList(map);	
	}

	@Override
	public void insertReBoard(ReBoardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum(); //새 글일 경우 0이 들어감
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) {
			regroup=this.getMaxNum();
			restep=0;
			relevel=0;
		}else {
			//같은 그룹중에서 전달 받은 restep보다 큰 값.....답글일 경우 모두 일괄적으로 1씩 증가
			this.updateReStep(regroup, restep);
			//그 이후에 전달 받은 값도가 1크게 db 저장
			restep++;
			relevel++;
		}
		
		//변경 된 값들을 다시 dto에 담기
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		mapper.insertReBoard(dto);
	}

	@Override
	public void updateReStep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);		
		
		mapper.updateReStep(map);
		
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		mapper.updateReadCount(num);
		
	}

	@Override
	public ReBoardDto getData(int num) {
		// TODO Auto-generated method stub
		return mapper.getData(num);
	}

	@Override
	public void updateReBoard(ReBoardDto dto) {
		// TODO Auto-generated method stub
		mapper.updateReBoard(dto);
		
	}

	@Override
	public void deleteReBoard(int num) {
		// TODO Auto-generated method stub
		mapper.deleteReBoard(num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		mapper.likesUpdate(num);
	}

}
