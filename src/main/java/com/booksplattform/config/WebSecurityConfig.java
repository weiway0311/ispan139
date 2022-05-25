package com.booksplattform.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.booksplattform.repository.reader.AuthReaderService;


@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthReaderService authReaderService;
	
	// for 隨機驗證碼
	@Autowired
	private ValidateCodeFilter validateCodeFilter;
	
	// 處理登入失敗 for 隨機驗證碼
	@Autowired
	private AuthFailureHandler failureHandler;
	
	// 處理登入成功
	@Autowired
	private AuthSuccessHandler successHandler;
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(authReaderService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		//取得登入者session資訊
//		AuthenticationSuccessHandler successHandler = new AuthenticationSuccessHandler() {			
//			@Override
//			public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//					Authentication authentication) throws IOException, ServletException {
//				Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//				if(principal!=null && principal instanceof UserDetails) {
//					UserDetails user = (UserDetails) principal;
//					request.getSession().setAttribute("userDetail", user);
//					response.sendRedirect("/mainpage");
//				}
//			}
//		};
		
		http
			//增加驗證碼過濾器/admin/admin.books
			.addFilterBefore(validateCodeFilter, UsernamePasswordAuthenticationFilter.class) //for驗證碼
			.authorizeHttpRequests()
			.antMatchers(HttpMethod.GET, "/store/booksMain").permitAll()
//			.antMatchers(HttpMethod.GET, "/store/searchAll").permitAll()
			.antMatchers(HttpMethod.GET, "/admin/books").permitAll()
			.antMatchers(HttpMethod.GET, "/store/**").authenticated()
			.antMatchers(HttpMethod.GET, "/admin/**").authenticated()
			.antMatchers(HttpMethod.GET).permitAll()
			.antMatchers(HttpMethod.POST, "/store/booksMain").permitAll()
//			.antMatchers(HttpMethod.POST, "/store/searchAll").permitAll()
			.antMatchers(HttpMethod.POST, "/admin/books").permitAll()
			.antMatchers(HttpMethod.POST, "/store/**").authenticated()
			.antMatchers(HttpMethod.POST, "/admin/**").authenticated()
			.antMatchers(HttpMethod.POST).permitAll()
//			.antMatchers("/code/image").permitAll() //for驗證碼
			.anyRequest().authenticated()
			.and()
			.csrf().disable()
			.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
			.and()
			.formLogin()
			.loginPage("/readerlogin")
//			.defaultSuccessUrl("/mainpage")
			.successHandler(successHandler) //處理登入成功
			.failureHandler(failureHandler) //處理登入失敗 for驗證碼
			.and()
			.logout()
			.logoutUrl("/logout")
			.invalidateHttpSession(true) //登出刪除session
			.deleteCookies("rememberMe-key"); //清除cookies
	}

}
