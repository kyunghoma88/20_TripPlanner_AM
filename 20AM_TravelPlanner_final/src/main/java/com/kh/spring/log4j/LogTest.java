package com.kh.spring.log4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogTest {
	
	private static Logger logger = LoggerFactory.getLogger(LogTest.class);
	
	public static void main(String[] args) {
		test();
	}
	
	public static void test() {
		//log를 출력하는 명령
		//Logger객체의 메소드를 이용해서 처리
		logger.debug("난 debug야!");
		logger.info("난 info야!");
		logger.warn("난 warn야!");
		logger.error("난 error야!");
	}
}
