package com.mycompany.webapp.aspect;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mycompany.webapp.dto.HeaderInfo;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UserService;

import lombok.extern.log4j.Log4j2;

@Component
@Aspect
@Log4j2
public class HeaderCheckAfter {

	@Resource
	private UserService userService;
	
	/*	@Around("@annotation(com.mycompany.webapp.aspect.HeaderCheck)")*/
	@Around("execution(public * com.mycompany.webapp.controller.*Controller.*(..))")
	public Object method(ProceedingJoinPoint joinpoint) throws Throwable {
		
		Object result = joinpoint.proceed();
		
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();

		String userid = (String) session.getAttribute("sessionUserid");
		HeaderInfo headerInfo = new HeaderInfo();
		if (userid != null) {
			User user = userService.getUser(userid);
			String name = user.getUsername();
			String email = user.getUseremail();
			int point = user.getUserpoint();
			
			String backgroundColor = "#cd7f32";
			if(point > 20000) {
				backgroundColor = "gold";
			} else if(point > 10000) {
				backgroundColor = "silver";
			}
			headerInfo.setUserid(userid);
			headerInfo.setName(name);
			headerInfo.setEmail(email);
			headerInfo.setPoint(point);
			headerInfo.setBackgroundColor(backgroundColor);
		}
		session.setAttribute("headerInfo", headerInfo);
		
		return result;
	}
}