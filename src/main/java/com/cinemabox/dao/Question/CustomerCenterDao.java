package com.cinemabox.dao.Question;

import java.util.HashMap;
import java.util.List;

import com.cinemabox.dto.Question.AnswerDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.vo.Question;

public interface CustomerCenterDao {
		
	/**
	 * 이름과 메일을 받아서 문의내역 정보를 반환함 	
	 * @param name
	 * @param email
	 * @return
	 */
	List<Question> getQuestionByName(HashMap<String, Object> userInfo);
	
	
	/**
	 * 번호로 문의, 답변 상세페이지 조회함 
	 * @param no
	 * @return
	 */
	Question getQuestionByNo(int no);
	
	
	/**
	 * 새 문의 등록함 
	 * @param question
	 */
	void insertQuestion(QuestionDto question);
	
	
	/**
	 * 지정된 번호로 문의 삭제함 
	 */
	void deleteQuestion(int questionNo);
	
	
	/**
	 * 지정된 번호로 만족도, 상태를 변경함 
	 * @param questionNo
	 */
	void updateSatisfaction(Question question);
	
	/**
	 * 새 답변 등록함 (update)
	 * @param answer
	 */
	void insertAnswer(AnswerDto answer);


	/**
	 * 이름과 이메일을 이용하여 등록된 답변의 개수를 조회함
	 * @param answer
	 */
	int getQuestionCountByName(QuestionDto param);
	
	
	}

	

	


