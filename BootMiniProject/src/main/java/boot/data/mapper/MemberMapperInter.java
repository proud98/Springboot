package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {
	
	//회원목록 조회
	public List<MemberDto> getAllMembers();
	
	//가입
	public void insertMember(MemberDto dto);
	
	//아이디 중복 체크
	public int getSearchId(String id);
	
	// id(string)에 따른 이름(string) 반환
	public String getName(String id);
	
	//id parameter(map or hashmap) 넘겨서 0(false)인지 1(true)인지 반환
	public int loginIdPassCheck(Map<String, String> map);
	
	//로그인 한 아이디에 대한 데이터조회
	public MemberDto getDataId(String id);
	
	//회원목록 삭제
	public void memberDelete(String num);
	
	//사진전용 수정
	public void updatePhoto(Map<String, String> map);
	
	//사진제외 수정
	public void updateMember(MemberDto dto);
	
	//num에 대한 데이터 조회
	public MemberDto getNum(String num);
	
	
}
