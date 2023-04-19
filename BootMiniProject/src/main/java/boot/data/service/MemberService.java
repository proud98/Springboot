package boot.data.service;

import java.util.List;

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
	

}
