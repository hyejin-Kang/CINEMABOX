package com.cinemabox.service.theater.Question;

import java.util.List;

import com.cinemabox.dto.Question.AnswerDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.vo.Question;

public interface QuestionService {

	

	List<Question> getQuestionByName(String name, String email);



	Question detailQuestion(int no);


	void addQuestion(QuestionDto question);


	void deleteQuestion(int questionNo);


	void addAnswer(AnswerDto answer);


	void updateSatisfaction(Question question);


	int getQuestionCountByName(QuestionDto param);
	

}
