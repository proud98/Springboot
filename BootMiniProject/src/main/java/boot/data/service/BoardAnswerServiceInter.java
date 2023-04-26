package boot.data.service;

import java.util.List;

import boot.data.dto.BoardAnswerDto;


public interface BoardAnswerServiceInter {
	
		//insert
		public void insertAnswer(BoardAnswerDto dto);
		
		//어떤 게시글의 댓글인지 게시글 num 조회
		public List<BoardAnswerDto> getAllAnswers(String num);
		
		//idx에 대한 데이터 얻기
		public BoardAnswerDto getAnswer(String idx); 
		
		//수정
		public void updateAnswer(BoardAnswerDto dto);
		
		//삭제
		public void deleteAnswer(String idx);

}
