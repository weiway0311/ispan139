package com.booksplattform.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class SponsorMail {
	
	//基本設定
	private String userName = "swapooks2022@gmail.com";
	private String passWord = "hcqubumubltvlgjn";
//	private String customer = "";
	private String subject = "";
	private String text = "";
	
	public void sendMail(String custmerEmail, int sponsorAmount) {
		Properties prop = new Properties();
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.debug", "true");		
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		
		
		// 使用匿名類別設定session
		Session session = Session.getDefaultInstance(prop, new Authenticator() {			
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, passWord);
				}		
		});
		
				// 寄件內容和收件者資訊
				MimeMessage message = new MimeMessage(session);

				
				
				String subject = "以書會友(書香閣樓基金會)-贊助通知";
				String text = "親愛的書友您好，已收到您贊助款項 "+ sponsorAmount +"元整。<br/>您的贊助是我們進步的動力<br/>"

						+ "未來您與我一起共創美好社會，<br/>" +"以書會友(書香閣樓基金會) 感謝您!!" ;
				try {
					message.setSender(new InternetAddress(userName));
					message.setRecipient(RecipientType.TO, new InternetAddress(custmerEmail));
					message.setSubject(subject);
					message.setContent(text, "text/html;charset=UTF-8");
						
					// Transport傳送message，傳送完後close
					Transport transport = session.getTransport();
					transport.send(message);
					transport.close();
					
				} catch (MessagingException e) {
					e.printStackTrace();
				}
					
	
	}

}
