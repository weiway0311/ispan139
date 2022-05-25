package com.booksplattform.exception;

import org.springframework.security.core.AuthenticationException;

public class ValidateCodeException extends AuthenticationException {

	private static final long serialVersionUID = -1340173397571563462L;

	public ValidateCodeException(String msg) {
		super(msg);
	}

}
