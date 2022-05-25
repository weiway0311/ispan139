package com.booksplattform.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private ReaderService rService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal!=null && principal instanceof UserDetails) {
			UserDetails user = (UserDetails) principal;
			
			String email = user.getUsername();
			Reader reader = rService.findReaderByEmail(email);
			
			request.getSession().setAttribute("userDetail", reader);
			
			if(reader.getAuthority()==1) {
				response.sendRedirect("/mainpage");				
			}else if(reader.getAuthority()==2) {
				response.sendRedirect("/store/booksMain");
			}else {
				response.sendRedirect("/logout");
			}
		}
	}

}
