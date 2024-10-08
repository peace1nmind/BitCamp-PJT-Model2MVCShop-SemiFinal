package com.model2.mvc.common.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.model2.mvc.service.domain.User;

import ch.qos.logback.core.net.SyslogOutputStream;

public class RoleCheckInterceptor implements HandlerInterceptor {

	public RoleCheckInterceptor() {
		System.out.println("\n▶ Interceptor :: "+getClass().getSimpleName()+" default constructor call");
	}
	
	public boolean preHandle(HttpServletRequest request,
							HttpServletResponse response, 
							Object handler) throws ServletException, IOException {
		
		System.out.println("\n[ RoleCheckInterceptor ]\n");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		// menu, fnc, user.role
		
		String uri = request.getRequestURI();
		String method = request.getMethod();
		System.out.println(uri+" "+method);
		
		// product interceptor
		if (uri.contains("product")) {
			
		} 
		
		// purchase interceptor
		else if (uri.contains("purchase")) {
			
			if (user == null) {
				System.out.println("Error : 비로그인 상태, purchase 진입");
				response.sendRedirect("/user/login");
				System.out.println("\n=========================\n");
				
				return false; 
			}
			
			if (uri.indexOf("listPurchase") != -1) {
				
				if (!user.getRole().equals("user")) {
					
					System.out.println("Error : 일반 회원만 구매이력을 볼 수 있습니다.");
					response.sendRedirect("/");
					System.out.println("\n=========================\n");
					
					return false; 
				}
			}
			
		}
		
		System.out.println("\n=========================\n");
		
		return true;
	}

}
