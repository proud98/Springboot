package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {
	
	//MemberMapperInter를 그대로 복붙해와서 serviceInter를 생성
	
	//회원목록 조회
	public List<MemberDto> getAllMembers();
		
	//가입
	public void insertMember(MemberDto dto);
		
	//아이디 중복 체크
	public int getSearchId(String id);
	
	// id(string)에 따른 이름(string) 반환
	public String getName(String id);
	
	//id parameter(map or hashmap) 넘겨서 0(false)인지 1(true)인지 반환
	public int loginIdPassCheck(String id, String pass); //map을 한 번 풀어서 써주기
	
	//로그인 한 아이디에 대한 데이터조회
	public MemberDto getDataId(String id);
	
	//회원목록 삭제
	public void memberDelete(String num);
	
	//사진전용 수정
	public void updatePhoto(String num, String photo); //map을 풀어서 씀
		
	//사진제외 수정
	public void updateMember(MemberDto dto);
	
	//num에 대한 데이터 조회
	public MemberDto getNum(String num);


}
