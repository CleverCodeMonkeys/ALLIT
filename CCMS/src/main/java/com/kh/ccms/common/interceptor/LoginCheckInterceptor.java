package com.kh.ccms.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = LoggerFactory.getLogger(LoginCheckInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
//		Member m = (Member)session.getAttribute("m");
		
//		if(m == null){
			logger.info(
			 "비로그인 상태에서 ["+request.getRequestURI()+"]로 접근!!");
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후에 이용하세요!");
			
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			
			return false;
//		}
		
		// 기본값은 return true;
//		return super.preHandle(request, response, handler);
	}
	
	
}
