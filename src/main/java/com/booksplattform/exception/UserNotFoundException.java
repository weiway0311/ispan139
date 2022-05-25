package com.booksplattform.exception;

public class UserNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1102951410762155123L;
	
	public UserNotFoundException() {

	}

	public UserNotFoundException(String msg) {
		super(msg);
	}

}
