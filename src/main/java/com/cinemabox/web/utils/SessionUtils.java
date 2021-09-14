package com.cinemabox.web.utils;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * HttpSession객체 획득/폐기, 속성값 추가/조회/삭제 기능을 제공하는 유틸리티 클래스다.
 */
public class SessionUtils {

	
	/**
	 * 지금 서버로 요청을 보낸 사용자의 세션객체를 반환한다.
	 * @return
	 */
	private static HttpSession getSession(boolean create) {
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		return attributes.getRequest().getSession(create);
	}
	
	/**
	 * HttpSession객체에 속성을 추가한다.
	 * @param name 속성명
	 * @param value 속성값 혹은 객체
	 */
	public static void addAttribute(String name, Object value) {
		getSession(true).setAttribute(name, value);
	}
	
	/**
	 * HttpSession객체에서 지정된 속성이름으로 추가된 속성값을 반환한다.
	 * @param name 속성명
	 * @return 속성값 혹은 객체
	 */
	public static Object getAttribute(String name) {
		return getSession(true).getAttribute(name);
	}
	
	/**
	 * HttpSession객체에서 지정된 이름의 속성을 삭제한다.
	 * @param name 속성명
	 */
	public static void removeAttribute(String name) {
		getSession(true).removeAttribute(name);
	}
	
	/**
	 * HttpSession 객체를 폐기한다.
	 */
	public static void destroySession() {
		HttpSession session = getSession(false);
		if(session != null) {
			session.invalidate();
		}
	}
}
