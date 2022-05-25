package com.booksplattform.config;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.social.connect.web.HttpSessionSessionStrategy;
import org.springframework.social.connect.web.SessionStrategy;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.OncePerRequestFilter;

import com.booksplattform.controller.reader.ValidateController;
import com.booksplattform.exception.ValidateCodeException;
import com.booksplattform.model.reader.ImageCode;



@Component
public class ValidateCodeFilter extends OncePerRequestFilter {
	
	@Autowired
	private AuthenticationFailureHandler authFailHandler;
	
	private SessionStrategy sessionStrategy = new HttpSessionSessionStrategy();
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		
		if(StringUtils.equalsIgnoreCase("/readerlogin", request.getRequestURI()) && 
				StringUtils.equalsIgnoreCase(request.getMethod(), "post")) {
			
			try {
				validateCode(new ServletWebRequest(request));								
			}catch (ValidateCodeException e) {
				authFailHandler.onAuthenticationFailure(request, response, e);
				return;
			}

		}
		
		chain.doFilter(request, response);
		
	}

	private void validateCode(ServletWebRequest servletWebRequest) throws ServletRequestBindingException {
		ImageCode codeInSession = (ImageCode) sessionStrategy.getAttribute(servletWebRequest, ValidateController.SESSION_KEY_IMAGE_CODE);
		String codeInRequest = ServletRequestUtils.getRequiredStringParameter(servletWebRequest.getRequest(), "imageCode");
	
		if(StringUtils.isBlank(codeInRequest)) {
			throw new ValidateCodeException("驗證碼不能為空");
		}
		if(codeInSession == null) {
			throw new ValidateCodeException("驗證碼不存在");
		}
		if(codeInSession.isExpire()) {
			sessionStrategy.removeAttribute(servletWebRequest, ValidateController.SESSION_KEY_IMAGE_CODE);
			throw new ValidateCodeException("驗證碼已過期");
		}
		if(!StringUtils.equalsIgnoreCase(codeInSession.getCode(), codeInRequest)) {
			throw new ValidateCodeException("驗證碼不正確");
		}
		sessionStrategy.removeAttribute(servletWebRequest, ValidateController.SESSION_KEY_IMAGE_CODE);
		
	}

}
