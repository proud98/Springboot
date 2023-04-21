package boot.data.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.MemberDto;
import boot.data.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {
	
	//ServiceInter를 받아와서 mapper를 구현하고 여기서 만든 mapper를 컨트롤러에서 구현??????????
	
	@Autowired
	MemberMapperInter mapper;

	@Override
	public List<MemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return mapper.getAllMembers(); //오버라이드 하새 return 값 주기
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		
		mapper.insertMember(dto);
		
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		
		return mapper.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapper.getName(id);
	}

	@Override
	public int loginIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		
		//mapper로 부터 받기 때문에 map을 받아야함
		Map<String, String> map=new HashMap<>();
		//map에다 put
		map.put("id", id);
		map.put("pass", pass);
		
		return mapper.loginIdPassCheck(map); //loginIdPassCheck에 map으로 들어감
	}

	@Override
	public MemberDto getDataId(String id) {
		// TODO Auto-generated method stub
		return mapper.getDataId(id);
	}

	@Override
	public void memberDelete(String num) {
		// TODO Auto-generated method stub
		
		mapper.memberDelete(num);
		
	}

	@Override
	public void updatePhoto(String num, String photo) {
		// TODO Auto-generated method stub
		
		Map<String, String> map=new HashMap<>();
		
		map.put("num", num);
		map.put("photo", photo);
		
		mapper.updatePhoto(map);
		
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		
		mapper.updateMember(dto);
		
	}

	@Override
	public MemberDto getNum(String num) {
		// TODO Auto-generated method stub
		return mapper.getNum(num);
	}

	
	

}
