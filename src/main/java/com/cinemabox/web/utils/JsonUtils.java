package com.cinemabox.web.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtils {

	private static ObjectMapper objectMapper = new ObjectMapper();
	
	/**
	 * 객체를 전달받아서 JSON형식의 텍스트로 변환한다.
	 * @param object 객체 한 개
	 * @return JSON 형식의 텍스트
	 */
	public static String toJsonText(Object  object) {
		try {
			return objectMapper.writeValueAsString(object);
		} catch (JsonProcessingException ex) {
			return "{}";
		}
	}
}
