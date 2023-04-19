package boot.data.mapper;

import java.util.List;

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
	
	

}
