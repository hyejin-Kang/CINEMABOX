package com.cinemabox.web.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/*
 * @Retention
 * 		- 어노테이션이 사용되는 싯점을 지정한다.
 * 		- 사용자정의 어노테이션은 거의 대부분 프로그램이 실행될 때 해당 어노테이션이 사용되기 된다.
 * 		- 종류
 * 				RetentionPolicy.SOURCE	- 소스 상태에서 어노테이션이 사용됨
 * 				RetentionPolicy.CLASS	- 컴파일 싯점에 어노테이션이 사용됨
 * 				RetentionPolicy.RUNTIME	- 프로그램 실행싯점에 어노테이션이 사용됨
 * @Target
 * 		- 어노테이션이 적용되는 곳을 지정한다.
 * 		- 한 어노테이션은 여러 군데 적용될 수도 있다.
 * 		- 종류
 * 				ElementType.TYPE				- 클래스, 인터페이스		@Controller, @Service, @Repository, @Component
 * 				ElementType.FIELD				- 클래스의 변수			@Autowired, @Resource, @Value
 * 				ElementType.METHOD				- 메소드				@RequestMapping, @GetMapping, @Autowired
 * 				ElementType.PARAMETER			- 매개변수				@RequestParam, @Valid
 * 				ElementType.CONSTRUCTOR			- 생성자				@Autowired
 * 				ElementTYPE.ANNOTATION_TYPE		- 다른 어노테이션		@Retention, @Target
 */	

/**
 * 요청핸들러 메소드의 매개변수에 사용되는 어노테이션이다.<br/>
 * HttpSession에 저장된 로그인된 사용자정보를 요청핸들러 메소드의 매개변수로 전달받기 위해서 사용한다.<br />
 * 이 어노테이션이 지정된 매개변수로 로그인된 사용자정보가 전달되도록 사용자정의 HandlerMethodArgumentResolver가 이용된다.
 * @author lee_e
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.PARAMETER)
public @interface LoginUser {

}
