package com.booksplattform.controller.reader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes(names = {"userDetail", "totalPages", "totalElements", "genderCount", "ageCount"})
public class ReaderMemberController {
	
	@Autowired
	private ReaderService rService;
	
	@Autowired
	private ObjectMapper mapper; //處理JSON
	
	// 新增登入帳戶(email + password)
	@PostMapping(path = "/createnewaccount", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String createNewAccount(@RequestBody Reader reader) throws JsonProcessingException {
		
		Reader rBean = rService.findReaderByEmail(reader.getEmail());
		
		String jsonString = ""; //轉成JSON字串
//			String jsonString = mapper.writeValueAsString(reader); //轉成JSON字串
		
		if(rBean!=null) {
			jsonString = mapper.writeValueAsString("failed");
			return jsonString;
		}
		
		System.out.println(reader.getFullName());
		String encodePwd = new BCryptPasswordEncoder().encode(reader.getPassword());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String formatDate = sdf.format(nowDate);
		
		reader.setPassword(encodePwd);
		reader.setRegisterDate(formatDate);
		
		//存入預設圖片-------------------------------
//			String defaultImg = "C:\\DataSource\\workspace\\booksplattform\\src\\main\\webapp\\WEB-INF\\img\\default.png";
		String defaultImg = "C:\\DataSource\\workspace\\booksplattform\\src\\main\\webapp\\WEB-INF\\img\\default.png";
		FileInputStream fis;
		try {
			fis = new FileInputStream(defaultImg);
//				BufferedInputStream bis = new BufferedInputStream(fis);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			byte[] buff = new byte[1024];
			int len = 0;
			while ((len = fis.read(buff)) != -1) {
			  bos.write(buff, 0, len);
			}
			// 得到圖片的位元組陣列
			byte[] result = bos.toByteArray();
			reader.setPhoto(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//-------------------------------
		
		rService.addReader(reader);
		jsonString = mapper.writeValueAsString("success");
		return jsonString;
//			return "redirect:allreaderpage";
	}	
	
	// 實現登入前驗證 ==========================================================================================
	@GetMapping("/verifybyemail")
	@ResponseBody
	public String verifyByEmail(@RequestParam("email") String email) throws JsonProcessingException {
		Reader reader = rService.findReaderByEmail(email);
		String jsonString = mapper.writeValueAsString(reader); //轉成JSON字串
		return jsonString;
	}
	
	// 註冊時驗證email是否已存在 ==========================================================================================
	@GetMapping("/verifyemail/{email}")
	@ResponseBody
	public String verifyEmail(@PathVariable("email") String email) throws JsonProcessingException {
		Reader reader = rService.findReaderByEmail(email);
		String jsonString = mapper.writeValueAsString(reader); //轉成JSON字串
		return jsonString;
	}
	
	// 前往註冊頁面 ==========================================================================================
	@GetMapping("/gotoregisterpage")
	public String gotoRegisterPage() {
		return "reader/registerPage";
	}
	
	// 修改 for 一般會員 ==========================================================================================
	@PutMapping("/updatebasicdata")
	@ResponseBody
	public Reader updateBasicData(@RequestBody Reader reader, Model m){
		
		System.out.println(reader);
		
		Reader result = rService.findReaderById(reader.getReaderId());
		m.addAttribute("userDetail", reader);
		reader.setPassword(result.getPassword());
		reader.setPhoto(result.getPhoto());
		return rService.updateReader(reader);
	}
	
	// 修改密碼 ==========================================================================================
	@PutMapping("/updatepassword/{id}")
	@ResponseBody
	public String updatePassword(@PathVariable("id") int id, @RequestBody Map<String, String> pwd) throws JsonProcessingException {
				
		Reader reader = rService.findReaderById(id);
		String newPassword = pwd.get("newPassword");
		String encodePwd = new BCryptPasswordEncoder().encode(newPassword);
		
		reader.setPassword(encodePwd);
		rService.updateReader(reader);
		
		String jsonString = mapper.writeValueAsString("success");
		return jsonString;		
	}
	
	// 前往忘記密碼分頁 ==========================================================================================
	@GetMapping("/forgotpwdpage")
	public String gotoForgotPwdPage() {
		return "reader/forgotPwdPage";
	}
	
	// 忘記密碼，重發驗證信 ==========================================================================================
	// 需先至maven新增javax.mail
	
	// 寄件者帳號、密碼(應用程式專用密碼)
//		@Value("${mail.address}")
	private String emailWriter = "swapooks2022@gmail.com";	
//		@Value("${mail.password}")
	private String emailPwd = "hcqubumubltvlgjn"; //for test
				
	@PostMapping("/resetPassword.controller")
	public String resetPwdByEmail(@RequestParam("email") String email, Model m) {
		Reader reader = rService.findReaderByEmail(email);
		Map<String, String> msg = new HashMap<>();
		if(reader==null) {
			msg.put("errorEmail", "無此帳戶，請再次確認信箱");
			m.addAttribute("msg", msg);
			return "reader/forgotPwdPage";
		}
			
		// 設定連線(host主機、host port、SSL?...)
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
				return new PasswordAuthentication(emailWriter, emailPwd);
			}		
		});
			
		// 隨機產生8位數新密碼
		String str = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghijkmnpqrstuvwxyz";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int index;
		for(int i=0; i<8; i++) {
			index = random.nextInt(str.length());
			sb.append(str.charAt(index));
		}
		String newPwd = sb.toString();
			
		// 將新密碼加密後修改到資料庫
		String encodePwd = new BCryptPasswordEncoder().encode(newPwd);
		reader.setPassword(encodePwd);
		rService.updateReader(reader);
					
		// 寄件內容和收件者資訊
		MimeMessage message = new MimeMessage(session);
//			String newPwd = "012345678";
		String subject = "以書會友-書友重新驗證通知";
		String text = "親愛的書友您好，已收到您的忘記密碼處理請求。<br/>為確保能正確登入，請依照下列指示進行操作:<br/>"
				+ "(1)前往<a href='http://localhost:8080/readerlogin'>以書會友登入首頁</a><br/>"
				+ "(2)輸入您的信箱、新密碼以及驗證碼後進行登入<br/>"
				+ "(3)成功登入後，請盡速前往書友專區修改密碼<br/><br/>"
				+ "您的新密碼為: <b>" + newPwd + "</b>";
		try {
			message.setSender(new InternetAddress(emailWriter));
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
			message.setSubject(subject);
			message.setContent(text, "text/html;charset=UTF-8");
				
			// Transport傳送message，傳送完後close
			Transport transport = session.getTransport();
			transport.send(message);
			transport.close();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
			
		msg.put("success", "已發送郵件，請盡速確認並重新登入");
		m.addAttribute("msg", msg);
		return "reader/forgotPwdPage";
	}
	
	// 跳轉到一般會員頁面 ==========================================================================================
	@GetMapping("/store/memberpage")
	public String gotoMemberPage() {
		return "reader/memberPage";
	}
	
	// 上傳大頭照(一般書友) ==========================================================================================
		@PostMapping("/uploadreaderphoto/{id}")
		public String uploadReaderPhoto(@RequestParam("photo") MultipartFile photo, @PathVariable("id") int id, Model m) {
			Reader reader = rService.findReaderById(id);
			try {
				reader.setPhoto(photo.getBytes());
				rService.addReader(reader);
				
				m.addAttribute("reader", reader);
				
				return "reader/memberPage";
			} catch (IOException e) {
				e.printStackTrace();
				return "reader/memberPage";
			}
		}
	
	// 取得大頭貼 ==========================================================================================
	@GetMapping("/showreaderphoto/{id}")
	public ResponseEntity<byte[]> showReaderPhoto(@PathVariable("id") Integer id){
		Reader reader = rService.findReaderById(id);
		byte[] photo = reader.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
	

}
