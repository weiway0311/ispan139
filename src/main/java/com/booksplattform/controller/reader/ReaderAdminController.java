package com.booksplattform.controller.reader;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.tomcat.util.buf.UDecoder;
import org.hibernate.engine.jdbc.connections.spi.AbstractDataSourceBasedMultiTenantConnectionProviderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping("/admin")
@SessionAttributes(names = {"userDetail", "totalPages", "totalElements", "genderCount", "ageCount"})
public class ReaderAdminController {
	
	@Autowired
	private ReaderService rService;
	
	@Autowired
	private ObjectMapper mapper; //??????JSON
	
	// ??????????????????(email + password)
	@PostMapping(path = "/createnewaccount", consumes = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String createNewAccount(@RequestBody Reader reader, HttpServletRequest request) throws JsonProcessingException {
		
		Reader rBean = rService.findReaderByEmail(reader.getEmail());
		
		String jsonString = ""; //??????JSON??????
//		String jsonString = mapper.writeValueAsString(reader); //??????JSON??????
		
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
		
		//??????????????????-------------------------------
//		String defaultImg = "C:\\DataSource\\workspace\\booksplattform\\src\\main\\webapp\\WEB-INF\\img\\default.png";
		String defaultImg = "C:\\DataSource\\workspace\\booksplattform\\src\\main\\webapp\\WEB-INF\\img\\default.png";
		String contextPath = request.getContextPath();
		System.out.println(contextPath + "==============================================");
		FileInputStream fis;
		try {
			fis = new FileInputStream(defaultImg);
//			BufferedInputStream bis = new BufferedInputStream(fis);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			byte[] buff = new byte[1024];
			int len = 0;
			while ((len = fis.read(buff)) != -1) {
			  bos.write(buff, 0, len);
			}
			// ??????????????????????????????
			byte[] result = bos.toByteArray();
			reader.setPhoto(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//-------------------------------
		
		rService.addReader(reader);
		jsonString = mapper.writeValueAsString("success");
		return jsonString;
//		return "redirect:allreaderpage";
	}	
	
	// ????????????????????? ==========================================================================================
	@GetMapping("/verifybyemail")
	@ResponseBody
	public String verifyByEmail(@RequestParam("email") String email) throws JsonProcessingException {
		Reader reader = rService.findReaderByEmail(email);
		String jsonString = mapper.writeValueAsString(reader); //??????JSON??????
		return jsonString;
	}
	
	// ???????????????email??????????????? ==========================================================================================
	@GetMapping("/verifyemail/{email}")
	@ResponseBody
	public String verifyEmail(@PathVariable("email") String email) throws JsonProcessingException {
		Reader reader = rService.findReaderByEmail(email);
		String jsonString = mapper.writeValueAsString(reader); //??????JSON??????
		return jsonString;
	}
	
	// ?????????????????? ==========================================================================================
	@GetMapping("/gotoregisterpage")
	public String gotoRegisterPage() {
		return "reader/registerPage";
	}
	
	
	// ?????????????????? ==========================================================================================
	@PostMapping("/findallreader")
	@ResponseBody
	public String findAllReader() throws JsonProcessingException {
		List<Reader> list = rService.findAllReader();
		String jsonList = mapper.writeValueAsString(list);
		return jsonList;
	}
	
	// ???????????????????????? ==========================================================================================
	@GetMapping("/allreaderpage")
	public String gotoAllReaderPage(Model m) {
		findALLReaderByPageAction(1, m);
		return "reader/readerMainPage";
	}
	
	// ??????????????????????????? ==========================================================================================
	@PostMapping("/findallreaderbypage/{pageNo}")
	@ResponseBody
	public List<Reader> findALLReaderByPageAction(@PathVariable("pageNo") int pageNo, Model m){
				
		// ??????????????????
		int age20under = rService.findByBirthBetween("2003-01-01", "2022-12-31").size();
		int age20up = rService.findByBirthBetween("1993-01-01", "2002-12-31").size();
		int age30up = rService.findByBirthBetween("1983-01-01", "1992-12-31").size();
		int age40up = rService.findByBirthBetween("1973-01-01", "1982-12-31").size();
		int age50up = rService.findByBirthBetween("1900-01-01", "1972-12-31").size();
		int[] ageCount = {age20under, age20up, age30up, age40up, age50up};
		m.addAttribute("ageCount", ageCount);
		
		// ??????????????????(chart)
		List<Reader> allReader = rService.findAllReader();
		List<Reader> maleReader = rService.findByGender("???");
		int maleCount = maleReader.size();
		int femaleCount = allReader.size() - maleCount;
		int[] genderCount = {maleCount, femaleCount};
		m.addAttribute("genderCount", genderCount);
		
		// ????????????
		System.out.println("pageNo:" + pageNo);
		int dataCount = 10; // ????????????
		Pageable pageable = PageRequest.of(pageNo-1, dataCount);
		Page<Reader> page = rService.findAllReaderByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}
	
	// ???????????????????????? ==========================================================================================
	@GetMapping("/createreaderpage")
	public String gotoCreateReaderPage() {
		return "reader/readerAddPage";
	}
	
	// ????????????????????????????????????????????? ==========================================================================================
	@PostMapping("/findreaderbykeyword")
	@ResponseBody
	public String findByKeywordAction(@RequestParam("keyword") String keyword) throws JsonProcessingException{
		List<Reader> list = rService.findReaderByKeyword(keyword);
		String jsonString = mapper.writeValueAsString(list);
		return jsonString;
	}
	
	// ???????????????????????? ==========================================================================================
	@GetMapping("/gotoupdatepage/{id}")
	public String gotoUpdatePageById(@PathVariable("id") int id, Model m) {
		Reader reader = rService.findReaderById(id);
		m.addAttribute("reader", reader);
		return "reader/readerUpdatePage";
	}
	
	// ?????? ==========================================================================================
	@PutMapping("/updatereader")
	@ResponseBody
	public Reader updateReader(@RequestBody Reader reader){
		Reader result = rService.findReaderById(reader.getReaderId());
		reader.setPassword(result.getPassword());
		reader.setPhoto(result.getPhoto());
		return rService.updateReader(reader);
	}
	
	// ?????? for ???????????? ==========================================================================================
	@PutMapping("/updatebasicdata")
	@ResponseBody
	public Reader updateBasicData(@RequestBody Reader reader, Model m){
		Reader result = rService.findReaderById(reader.getReaderId());
		m.addAttribute("userDetail", reader);
		reader.setPassword(result.getPassword());
		return rService.updateReader(reader);
	}
	
	// ??????????????????????????? ==========================================================================================
	@GetMapping("/updatepasswordpage/{id}")
	public String gotoUpdatePwdPage(@PathVariable("id") int id, Model m) {
		Reader reader = rService.findReaderById(id);
		m.addAttribute("reader", reader);
		return "reader/updatePasswordPage";
	}
	
	// ???????????? ==========================================================================================
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
	
	// ?????? ==========================================================================================
	@DeleteMapping("/deletereader/{id}")
	@ResponseBody
	public String deleteReader(@PathVariable("id") int id) throws JsonProcessingException {
		System.out.println("id:" + id + "===============================");
		rService.deleteReader(id);
		String jsonString = mapper.writeValueAsString("success"); 
		return jsonString;
	}
	
	// ???????????????????????? ==========================================================================================
	@GetMapping("/forgotpwdpage")
	public String gotoForgotPwdPage() {
		return "reader/forgotPwdPage";
	}
	
	// ?????????????????????????????? ==========================================================================================
	// ?????????maven??????javax.mail
	
	// ????????????????????????(????????????????????????)
//	@Value("${mail.address}")
	private String emailWriter = "swapooks2022@gmail.com";	
//	@Value("${mail.password}")
	private String emailPwd = "hcqubumubltvlgjn"; //for test
				
	@PostMapping("/resetPassword.controller")
	public String resetPwdByEmail(@RequestParam("email") String email, Model m) {
		Reader reader = rService.findReaderByEmail(email);
		Map<String, String> msg = new HashMap<>();
		if(reader==null) {
			msg.put("errorEmail", "????????????????????????????????????");
			m.addAttribute("msg", msg);
			return "reader/forgotPwdPage";
		}
			
		// ????????????(host?????????host port???SSL?...)
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
			
		// ????????????????????????session
		Session session = Session.getDefaultInstance(prop, new Authenticator() {			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(emailWriter, emailPwd);
			}		
		});
			
		// ????????????8???????????????
		String str = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghijkmnpqrstuvwxyz";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int index;
		for(int i=0; i<8; i++) {
			index = random.nextInt(str.length());
			sb.append(str.charAt(index));
		}
		String newPwd = sb.toString();
			
		// ???????????????????????????????????????
		String encodePwd = new BCryptPasswordEncoder().encode(newPwd);
		reader.setPassword(encodePwd);
		rService.updateReader(reader);
					
		// ??????????????????????????????
		MimeMessage message = new MimeMessage(session);
//		String newPwd = "012345678";
		String subject = "????????????-????????????????????????";
		String text = "??????????????????????????????????????????????????????????????????<br/>????????????????????????????????????????????????????????????:<br/>"
				+ "(1)??????<a href='http://localhost:8080/readerlogin'>????????????????????????</a><br/>"
				+ "(2)????????????????????????????????????????????????????????????<br/>"
				+ "(3)?????????????????????????????????????????????????????????<br/><br/>"
				+ "??????????????????: <b>" + newPwd + "</b>";
		try {
			message.setSender(new InternetAddress(emailWriter));
			message.setRecipient(RecipientType.TO, new InternetAddress(email));
			message.setSubject(subject);
			message.setContent(text, "text/html;charset=UTF-8");
				
			// Transport??????message???????????????close
			Transport transport = session.getTransport();
			transport.send(message);
			transport.close();
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
			
		msg.put("success", "????????????????????????????????????????????????");
		m.addAttribute("msg", msg);
		return "reader/forgotPwdPage";
	}
	
	// ??????????????????????????? ==========================================================================================
	@GetMapping("/store/memberpage")
	public String gotoMemberPage() {
		return "reader/memberPage";
	}
	
	// ?????????????????????????????? ==========================================================================================
	@GetMapping("/updatephotopage")
	public String gotoUpdatePhotoPage() {
		return "reader/updatePhotoPage";
	}
	
	// ???????????????(?????????) ==========================================================================================
	@PostMapping("/uploadreaderphoto/{id}")
//	@ResponseBody
	public String uploadReaderPhoto(@RequestParam("photo") MultipartFile photo, @PathVariable("id") int id, Model m) {
		Reader reader = rService.findReaderById(id);
		try {
			reader.setPhoto(photo.getBytes());
			rService.addReader(reader);
			
//			m.addAttribute("userDetail", reader);
			m.addAttribute("reader", reader);
			
//			return "reader/memberPage";
			return "reader/readerUpdatePage";
		} catch (IOException e) {
			e.printStackTrace();
			return "reader/readerUpdatePage";
		}
	}
	
	// ??????????????? ==========================================================================================
	@GetMapping("/showreaderphoto/{id}")
	public ResponseEntity<byte[]> showReaderPhoto(@PathVariable("id") Integer id){
		Reader reader = rService.findReaderById(id);
		byte[] photo = reader.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
	
	// ?????????csv??? ==========================================================================================
	@PostMapping("/retrievereaderfile")
	@ResponseBody
	public String retrieveFile() throws JsonProcessingException {
		
		List<Reader> readers = rService.findAllReader();
		
		String folderPath = "C:/Swapooks";
		// ???????????????
		File folder = new File(folderPath);
		if(!folder.exists()) {
			folder.mkdirs();
		}		
		//??????????????????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date current = new Date();
		String time = sdf.format(current);
		String filePath = folderPath + "/Readers_Information_" + time + ".csv";
		//??????csv
		try(FileOutputStream fos = new FileOutputStream(filePath);
				OutputStreamWriter osw = new OutputStreamWriter(fos, "MS950");
				BufferedWriter bw = new BufferedWriter(osw);
				CSVPrinter printer = new CSVPrinter(bw, CSVFormat.EXCEL)){
			
			printer.printRecord("????????????","email","????????????","??????","??????","??????","??????","??????","????????????","?????????","??????");
			
			StringBuilder sb = new StringBuilder();
			for(Reader reader: readers) {
				sb.append(reader.getReaderId());
				sb.append(",");
				sb.append(reader.getEmail());
				sb.append(",");
				sb.append(reader.getRegisterDate());
				sb.append(",");
				sb.append(reader.getFullName());
				sb.append(",");
				sb.append(reader.getNickName());
				sb.append(",");
				sb.append(reader.getGender());
				sb.append(",");
				sb.append(reader.getPhone());
				sb.append(",");
				sb.append(reader.getBirth());
				sb.append(",");
				sb.append(reader.getReaderLevel());
				sb.append(",");
				sb.append(reader.getReaderCoin());
				sb.append(",");
				sb.append(reader.getAuthority());
				sb.append(",");
				sb.append("\r\n");
			}
			bw.write(sb.toString());
			
			String jsonString = mapper.writeValueAsString("success");
			return jsonString;
		}catch (IOException e) {
			e.printStackTrace();
			String jsonString = mapper.writeValueAsString("failed");
			return jsonString;
		}		
	}
	
	
	// ??????session
//	@GetMapping("/testfindbysession")
//	@ResponseBody
//	public String testReader(@RequestParam("keyword") String keyword, Model m) throws JsonProcessingException {
//		System.out.println(keyword);
//		Object attribute = m.getAttribute("userDetail");
//		System.out.println("the Object information: " + attribute);
////		if(attribute!=null) {
////			String email = attribute.
////			Reader result = rService.findReaderByEmail(email);
////			String jsonString = mapper.writeValueAsString(result);
////			return jsonString;			
////		}
//		return "No Result";
//	}
		
}
