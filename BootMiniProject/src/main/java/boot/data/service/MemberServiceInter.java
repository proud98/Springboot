package boot.data.service;

import java.util.List;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	//MemberMapperInter를 그대로 복붙해와서 serviceInter를 생성
	
	//회원목록 조회
	public List<MemberDto> getAllMembers();
		
	//가입
	public void insertMember(MemberDto dto);
		
	//아이디 중복 체크
	public int getSearchId(String id);
	
	

}
