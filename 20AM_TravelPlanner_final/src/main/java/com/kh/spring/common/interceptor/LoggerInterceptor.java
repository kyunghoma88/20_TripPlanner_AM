package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private Logger logger;
<<<<<<< HEAD
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.debug("======== start ======");
		logger.debug(request.getRequestURI());
		logger.debug("=====================");		
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("======== mapping 매소드실행 ======");
		logger.debug("======== --------------- ======");
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	

=======
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		logger.debug("========== start ==========");
		logger.debug(request.getRequestURI());
		logger.debug("===========================");
		return super.preHandle(request, response, handler);
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		logger.debug("========== mapping 메소드실행==========");
		logger.debug("===================================");
		super.postHandle(request, response, handler, modelAndView);
	}

	
>>>>>>> branch 'developer' of https://github.com/kyunghoma88/20_TripPlanner_AM.git
	
	
}
