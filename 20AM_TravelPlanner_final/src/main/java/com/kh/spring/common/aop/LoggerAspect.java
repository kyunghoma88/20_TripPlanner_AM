package com.kh.spring.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

public class LoggerAspect {
	
	@Autowired
	private Logger logger;
	
	//공통으로 적용될 기능을 수행하는 매소드 작성
	//advice : before 매소드 구현
	public void before(JoinPoint joinpoint) {
		logger.debug("====== 전처리 메세지 ======");
		Signature sig = joinpoint.getSignature();
		String type = sig.getDeclaringTypeName();
		String methodName= sig.getName();
		logger.debug("수행해보자!!!");
		logger.debug(type+methodName);
		//joinpoint객체에는 매소드 실행시 넘어오는 매개변수 확인가능
		Object[] objs=joinpoint.getArgs();
		for(Object o : objs) {
			logger.debug("매개변수 : "+o);
		}
	}
	
	//advice around 매소드 구현하기 -> 실행 전 , 후에 발생하는것
	public Object loggerAdvice(ProceedingJoinPoint joinpoint) throws Throwable{
		Signature sig = joinpoint.getSignature();
		String type = sig.getDeclaringTypeName(); //패키지, 클래스명
		String method = sig.getName(); //매소드명
		logger.debug("[before] "+type+" : "+method);
		//매개변수 확인하기
		Object[] params = joinpoint.getArgs();
		for(Object o : params)
			logger.debug("매개변수 : "+o);
		Object obj=joinpoint.proceed();//해당 객체를 반환
		
		logger.debug("[after] "+type+" : "+method);
		return obj; 
	}
	
}
