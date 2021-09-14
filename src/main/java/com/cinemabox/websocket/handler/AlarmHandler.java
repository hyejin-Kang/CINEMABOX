package com.cinemabox.websocket.handler;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class AlarmHandler extends TextWebSocketHandler {

	/*
	 * 클라이언트와 연결된 웹소켓 객체를 저장하는 콜렉션이다.
	 */
	private Set<WebSocketSession> sessions  = new HashSet<>();
	
	//텍스트를 전달받아서 연결된 모든 클라이언트에 메세지를 보낸다.
	// 좌석번호를 클릭하면 ajax로 서버한테 보내고
	// 컨트롤러에서 받아서 알람서비스 메소드 만들어서 호출해서
	/**
	 * 텍스트를 전달받아서 서버와 연결된 모든 클라이언트에게 메세지를 보낸다.
	 * @param text 텍스트 메세지, JSON 형식의 텍스트도 가능하다.
	 */
	public void sendMessage(String text) {
		// TextMessage 객체 생성
		TextMessage message = new TextMessage(text);
		// 반복자 객체 획득
		Iterator<WebSocketSession> iterator = sessions.iterator();
		// 반복자를 사용해서 콜렉션에 저장된 모든 WebSocketSession객체의 sendMessage()를 실행해서
		// 해당 WebSocketSession객체와 연결된 클라이언트에게 메세지를 보낸다.
		while (iterator.hasNext()) {
			WebSocketSession session = iterator.next();
			try {
				// 메세지 발송
				session.sendMessage(message);
			} catch (IOException e) {
				// 메세지 발송중 오류가 발생하면 해당 WebSocketSession객체를 콜렉션에서 삭제한다.
				iterator.remove();
			}
		}
	}
	
	// 클라이언트와 서버가 webSocket을 이용해서 연결이 완료되면 실행된다.
	// 클라이언트와 서버가 연결이 완료되면 해당 클라이언트와 통신하는 WebSocketSession객체를 전달 받을 수 있다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 위에서 정의한 콜렉션에 WebSocketSession객체를 저장한다.
		sessions.add(session);
	}
	
	// 클라이언트와 서버의 연결이 종료되면 실행된다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 위에서 정의한 콜렉션에 WebSocketSession객체를 삭제한다.
		sessions.remove(session);
	}
	
	// 클라이언트와 서버가 통신중 오류가 발생하면 실행된다.
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// 위에서 정의한 콜렉션에 WebSocketSession객체를 삭제한다.
		sessions.remove(session);
	}
}
