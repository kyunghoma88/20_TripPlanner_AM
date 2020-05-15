package com.kh.spring.common.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
@Aspect
public class AnoLoggerAspect {

	@Autowired
	private Logger logger;
	
	@Pointcut("execution(* com.kh.spring.demo..*(..))")
	public void aoptest() {}
	
	//@Around("aoptest()")
	@Around("execution(* com.kh.spring.demo..*(..))")
	public Object testAround(ProceedingJoinPoint joinpoint) throws Throwable{
		logger.debug("[before] demo실행~!");
		Signature sig=joinpoint.getSignature();
		logger.debug(sig.getDeclaringTypeName()+" : "+sig.getName());
		return joinpoint.proceed();
				
	}
	

	
}











