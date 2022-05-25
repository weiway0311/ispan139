package com.booksplattform.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //等同於mvc組態設定檔
public class WebAppConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/readerlogin").setViewName("reader/login");
		registry.addViewController("/mainpage").setViewName("reader/adminPage");
		registry.addViewController("/logout").setViewName("/login");
//		registry.addViewController("/logout/page").setViewName("logout");
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/simditor/**").addResourceLocations("/WEB-INF/simditor/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/css/");
		registry.addResourceHandler("/simditor/**").addResourceLocations("/WEB-INF/simditor/");
		registry.addResourceHandler("/storestyle/**").addResourceLocations("/WEB-INF/storestyle/");
		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/img/");
		registry.addResourceHandler("/vendor/**").addResourceLocations("/WEB-INF/vendor/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/js/");
	}
}
