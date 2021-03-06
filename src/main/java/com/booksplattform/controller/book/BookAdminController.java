package com.booksplattform.controller.book;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.booksplattform.model.book.Book;
import com.booksplattform.model.book.BookService;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.book.BookRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin/")
@SessionAttributes(names= {"bookTotalPages" , "bookTotalElements", "bookVarieties" })
public class BookAdminController {
	
	@Autowired
	private BookService bs;
	
	@Autowired
	private ObjectMapper mapper; //??????JSON
	
	//??????map (Varieties)
	Map<String, Integer> vMap = new HashMap<>();
	
	//Test
	@GetMapping("/book")
	public String entryPoint() {
		return "book/bookStore";
	}
	
	//Entry Books Admin
	@GetMapping("admin.books")
	public String searchAllBooks(Model m) {
		vMap.put("10", 0); //????????????
		vMap.put("20", 1);   //????????????
		vMap.put("30", 2);   //????????????
		vMap.put("40", 3);   //????????????
		vMap.put("50", 4);   //????????????
		vMap.put("60", 5);   //????????????
		vMap.put("70", 6);   //????????????
		vMap.put("80", 7);   //????????????
		vMap.put("90", 8);   //????????????
		vMap.put("100", 9);   //????????????
		//????????????????????????????????????1???array<??????> ??????0
		int[] nums = {0,0,0,0,0,0,0,0,0,0};
		//?????????????????????????????????
		List<Book> books = bs.findAll();
		for(Book book : books) {
			String currVariety = book.getBooksVarieties();
			//??????array??????index
			Integer arrIndex = vMap.get(currVariety);
			System.out.println("========================== test : " + arrIndex);
			//?????????????????? ?????????
			nums[arrIndex]++;
		}
		m.addAttribute("bookVarieties",nums);
	
		//==================== ?????????????????? =================
		int year1under = bs.findByPublishDateBetween(new Date(122,0,1), new Date(122,11,31) ).size();
		int age4up = bs.findByPublishDateBetween(new Date(118,0,1), new Date(121,11,31) ).size();
		int age7up = bs.findByPublishDateBetween(new Date(114,0,1), new Date(117,11,31) ).size();
		int age10up = bs.findByPublishDateBetween(new Date(110,0,1), new Date(113,11,31)).size();
		int after10up = bs.findByPublishDateBetween(new Date(90,0,1), new Date(109,11,31)).size();
		int[] publishYearCount = {year1under, age4up, age7up, age10up, after10up};
		System.out.println("========================== test : " + publishYearCount[0]);
		System.out.println("========================== test : " + publishYearCount[1]);
		System.out.println("========================== test : " + publishYearCount[2]);
		System.out.println("========================== test : " + publishYearCount[3]);
		System.out.println("========================== test : " + publishYearCount[4]);
		m.addAttribute("publishYearCount", publishYearCount);
					
		return "book/BooksMainAdmin3";  //??????url??????base64   (BooksMainAdmin2.jsp)
	}
	
	//Entry BooksDetails Admin
	@GetMapping("admin.booksDetails")
	public String searchAllBooksDetails(@RequestParam Integer id, Model m) {
		System.out.println(id);
		m.addAttribute("id",id);  //??????booksid??????
		Book book = bs.findById(id); //?????????ISBN???
		String isbn = book.getIsbn();
		System.out.println("isbn-----is : "+isbn.subSequence(3, isbn.length()));  //TEST OK
		m.addAttribute("isbn",isbn);  
		return "book/BooksDetailsAdmin3";  //??????url??????base64   (BooksDetailsAdmin2.jsp)
	}
	
	//Entry BooksUpdate Admin
	@GetMapping("admin.booksupdate")
	public String goToBooksUpdate(@RequestParam Integer id, Model m) {
		System.out.println(id);
		m.addAttribute("id",id);  //??????booksid??????
		return "book/BooksUpdateAdmin3";  //??????url??????base64   (BooksUpdateAdmin2.jsp)
	}
	
	//Entry BooksAddUpdate Admin
	@GetMapping("admin.booksadd")
	public String goToBooksAdd() {
		return "book/BooksAddAdmin3";  //??????url??????base64   (BooksAddAdmin2.jsp)
	}

//	@CrossOrigin(origins="http://localhost???8080")
	@GetMapping("books")
	@ResponseBody
	List<Book> findAll(Model m){
		System.out.println(bs == null);
		List<Book> books = bs.findAll();
		return books;
	}
	
	@GetMapping("/books/{name}")
	@ResponseBody
	List<Book> findBooksByName(@PathVariable String name){
		return bs.findByName(name);
	}
	
	@GetMapping("/searchbooks/{id}")
	@ResponseBody
	Book findBooksById(@PathVariable("id") Integer booksid){
		System.out.println(booksid); //Test
		System.out.println("Controller---searchbooks"); //Test
		System.out.println(bs.findById(booksid)==null); //Test
		return bs.findById(booksid);
	}
	
	@PutMapping("/books/{id}")
	@ResponseBody
	Book updateBooksById(@PathVariable("id") Integer booksid,
						@RequestBody Book book){
		System.out.println(booksid); //Test
		System.out.println("Controller---updateBooksById"); //Test
//		System.out.println(bs.updateById(book)==null); //Test
		return bs.updateById(book);
	}
	
	//????????????ajax ????????????
	@PostMapping("/BookCoverAddController")
	@ResponseBody
	public Book processUploadFileAction(HttpServletRequest request,  
			@RequestParam(value = "file", required = false) MultipartFile file) 
			throws IllegalStateException, IOException, FileUploadException 
	{
		System.out.println(file.getOriginalFilename()); //test
		
		String originalFilename = file.getOriginalFilename();  //??????????????? xxx.jpg
		int index = originalFilename.lastIndexOf(".");
		
		String endWith = originalFilename.substring(index);  //????????????
		String newFileName = System.currentTimeMillis() + endWith ;
		
//		String saveTempFileDir = request.getSession().getServletContext().getRealPath("/") + "uploads\\";
		String saveTempFileDir = "C:\\MyPrioject\\workspace\\booksplattform\\src\\main\\resources\\static\\uploads\\";
		System.out.println(saveTempFileDir); //test
		
		newFileName = newFileName.toLowerCase();  //???????????????
		String saveFilePath = saveTempFileDir + newFileName;
	
		File saveFile = new File(saveFilePath);
		//file.transferTo(saveFile);
		
		System.out.println(newFileName);  //????????????????????????
		//?????? upload????????????
//		String relativeFilePath = "upload\\" + newFileName;
		String relativeFilePath =  newFileName;
		
		Book book = new Book(newFileName);
		//JSON?????? ????????????
//		String jsonStr = JSON.toJSONString(book);
		return book;
	}
	
	@PostMapping("/books")
	@ResponseBody
	public Book findBooksByName(@RequestBody Book book){
		System.out.println(book);
		return bs.addBook(book);
	}
	
	@DeleteMapping("/books/{id}")
	@ResponseBody
	public Book deleteBook(@PathVariable("id") Integer booksid){
		System.out.println(booksid);
		return bs.deleteBook(booksid);
	}
	
	//??????session "bookTotalPages" , "bookTotalElements"
	@PostMapping("/findBooksByPage/{pageNo}")
	@ResponseBody
	public List<Book> findBooksByPage(@PathVariable(name="pageNo") int pageNo,
										Model m){
		int pageSize = 3;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Book> page = bs.findAllByPage(pageable);
		m.addAttribute("bookTotalPages",page.getTotalPages());
		m.addAttribute("bookTotalElements",page.getTotalElements());
		return bs.findAllByPage(pageable).getContent();
	}
	
	//Entry Books Admin  Test??????
	@GetMapping("admin.booksByPage")
	public String searchAllBooksByPage(Model m) {
		findBooksByPage(1,m);
		return "book/BooksMainAdmin3";  //??????url??????base64   (BooksMainAdmin2.jsp)
	}
	
	// ?????????csv??? ==========================================================================================
		@PostMapping("/retrieveBooksFile")
		@ResponseBody
		public String retrieveFile() throws JsonProcessingException {
			
			List<Book> books = bs.findAll();
			
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
			String filePath = folderPath + "/Books_Information_" + time + ".csv";
			//??????csv
			try(FileOutputStream fos = new FileOutputStream(filePath);
					OutputStreamWriter osw = new OutputStreamWriter(fos, "MS950");
					BufferedWriter bw = new BufferedWriter(osw);
					CSVPrinter printer = new CSVPrinter(bw, CSVFormat.EXCEL)){
				
//				printer.printRecord("????????????","??????","??????","?????????","????????????","??????????????????","????????????","??????","????????????","???????????????","?????????","??????");
				printer.printRecord("????????????","??????","??????","?????????","??????????????????","????????????","??????","????????????","?????????","??????");
				
				StringBuilder sb = new StringBuilder();
				for(Book book: books) {
					sb.append(book.getBooksId());
					sb.append(",");
					sb.append(book.getBooksName());
					sb.append(",");
					sb.append(book.getBooksVarieties());
					sb.append(",");
					sb.append(book.getPublisherName());
					sb.append(",");
//					sb.append(book.getBookDescribe());
//					sb.append(",");
					sb.append(book.getIsbn());
					sb.append(",");
					sb.append(book.getPublisherName());
					sb.append(",");
					sb.append(book.getAuthorName());
					sb.append(",");
//					sb.append(book.getAuthorInfo());
//					sb.append(",");
					sb.append(book.getProviderId());
					sb.append(",");
					sb.append(book.getPrice());
					sb.append(",");
					sb.append(book.getQuantity());
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
}
