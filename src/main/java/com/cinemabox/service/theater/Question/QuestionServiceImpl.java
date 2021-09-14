package com.cinemabox.service.theater.Question;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.Question.CustomerCenterDao;
import com.cinemabox.dto.Question.AnswerDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.vo.Question;


@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired CustomerCenterDao customerDao;

	
	@Override
	public List<Question> getQuestionByName(String name, String email) {
		// 나의 문의 내역 조회한다.
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("name", name);
		userInfo.put("email", email);
		
		//위의 USERINFO 파라미터를 DAO에전달한다. 그리고 문의목록을 전달받아 변수에 저장한다.
		List<Question> questionList = customerDao.getQuestionByName(userInfo);
		
		// 문의리스트를 반환한다.
		return questionList;
	}
	
	@Override
	public void updateSatisfaction(Question question) {
		// 만족도 추가한다.
		
		customerDao.updateSatisfaction(question);
	}
	
	@Override
	public Question detailQuestion(int no) {
		// 문의, 답변 상세 조회한다. 
		return customerDao.getQuestionByNo(no);
	}
	
	@Override
	public void addQuestion(QuestionDto question) {
		// 새 문의 등록한다.
		customerDao.insertQuestion(question);
	}
	
	@Override
	public void deleteQuestion(int questionNo) {
		// 문의 삭제한다. 	
		customerDao.deleteQuestion(questionNo);
		
	}
	
	@Override
	public void addAnswer(AnswerDto answer) {
		// 답변 등록함 (update)
		customerDao.insertAnswer(answer);
		System.out.println("answer DATA ==>"+answer.toString());
		// 메일발송
		// 메일 전송을 위한 메일 정보 
		String userMail = answer.getEmail();
		String answerContent = answer.getAnswerContent();
		String name = answer.getName();

	
		// gmail로 보내는 권한 부여 
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "abpple0405@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable","true");
		props.put( "mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		// id, password를 담는다. 
		 Authenticator auth = new com.cinemabox.web.utils.MyAuthentication();
		 
		// 메일 제목, 내용 
		 String subject = "[CINEMA BOX]문의에 대한 답변입니다!";
		 String content = "<html><head></head><body><div style=\"margin:20px 10px; max-width:470px\"><div align=\"left\" style=\"text-align:left\"><img src=\"\" alt=\"\" style=\"-ms-interpolation-mode:bicubic; clear:both; display:block; max-width:100%; outline:none; text-decoration:none; width:107px\" width=\"107\" loading=\"lazy\"></div><div style=\"background-color:#FFF; border:3px solid #ffc107; font-size:0.875em; margin:20px 0; word-break:keep-all\" bgcolor=\"#FFFFFF\"><div style=\"padding:30px\"><h1 style=\"margin-bottom: 20px; color: #ffc107;\">"+name+"님의 문의에 대한 답변입니다.</h1><p align=\"left\" style=\"margin:0; color:#4d4d4d; font-family:Helvetica, Arial, sans-serif; font-weight:normal; line-height:1.3; padding:0; text-align:left; font-size:1.3em; margin-bottom:35px\">"+answerContent+"</p><p align=\"left\" style=\"margin:0; color:#4d4d4d; font-family:Helvetica, Arial, sans-serif; font-weight:normal; line-height:1.3; padding:0; text-align:left; font-size:1.1em; margin-bottom:0px\">감사합니다.</p></div></div></div></body></html>";
		 String fromName = "cinemabox";
		  
	    // 권한 부여과 id, password를 전달할 연결 통로 
	    Session session = Session.getInstance(props, auth);
	  
	    MimeMessage msg = new MimeMessage(session); 
	    String charSet = "UTF-8";
		  
		  // 전달할 msg에 데이터 넣어주는 것 
		  try {
			  
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress(new String(fromName.getBytes(charSet), "8859_1") + "<abpple0405@gmail.com>");
            msg.setFrom(from);
            
            InternetAddress to = new InternetAddress(userMail);
            msg.setRecipient(Message.RecipientType.TO, to);
            msg.setSubject(subject, "UTF-8");
            msg.setText(content, "UTF-8");  
             
            msg.setContent(content,"text/html; charset=UTF-8");
            Transport.send(msg);   
           
			
		} catch (AddressException addr_e) {  
			System.out.println("Mail Send FAIL!! 메일을 입력해주세요");
        }catch (MessagingException msg_e) {
        	System.out.println("msg_e : " + msg_e.toString());
        	System.out.println("Mail Send FAIL!! 메일을 제대로 입력해주세요.");
        } catch (UnsupportedEncodingException e) {
        	System.out.println("메일발송을 실패하였습니다. [SYSTEM]");
        }
	}

	@Override
	public int getQuestionCountByName(QuestionDto param) {
		System.out.println("count  : " + customerDao.getQuestionCountByName(param));
		return customerDao.getQuestionCountByName(param);
	}
	
	
	
}
	
