package com.booksplattform.repository.reader;

import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.booksplattform.model.reader.Reader;

@Service
public class AuthReaderService implements UserDetailsService {

	@Autowired
	private ReaderService rService;
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Reader reader = rService.findReaderByEmail(email);
		return new User(reader.getEmail(), reader.getPassword(), Collections.emptyList());		 		
	}

}
