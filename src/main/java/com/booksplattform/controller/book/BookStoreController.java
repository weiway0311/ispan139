package com.booksplattform.controller.book;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.booksplattform.model.book.BDetail;
import com.booksplattform.model.book.BDetailService;
import com.booksplattform.model.book.BOrder;
import com.booksplattform.model.book.Book;
import com.booksplattform.model.book.BookService;
import com.booksplattform.model.book.BookStoreService;
import com.booksplattform.model.book.UserOrder;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.book.BookRepository;
import com.booksplattform.repository.reader.ReaderService;

//@CrossOrigin(origins="http://localhost：8081")
@Controller
@RequestMapping("/store/")
@SessionAttributes(names = { "userOrder", "bookTotalPages", "bookTotalElements" , "booksInfo" })
public class BookStoreController {

	@Autowired
	private BookStoreService bStoreService;

	@Autowired
	private BDetailService bDetailService;

	@Autowired
	private ReaderService readerService;

	// Entry 商城主頁
	@GetMapping("/booksMain")
	public String entryPoint() {
		return "store/storeMain";
	}

	// Entry Books show All
	@GetMapping("searchAll")
	public String searchAllBooks(Model m) {
		
		//加入所有商品(for取得img的url)
		List<Book> bookInfos = bStoreService.findAll();
		m.addAttribute("booksInfo",  bookInfos);
		
		return "store/showBooks";
	}
	
	// Entry 提供書籍主業
	@GetMapping("/booksProvider")
	public String entryBooksProvider() {
		return "store/showProvideBooks";
	}

	// Entry BooksDetails Store (if return , path is From Details To HomePage)
	// showDetailsFromDetailToBooks.jps is the same as showDetails2.jsp
	@GetMapping("store.booksDetails")
	public String searchAllBooksDetails(@RequestParam Integer id, Model m) {
		System.out.println(id);
		m.addAttribute("id", id); // 傳遞booksid參數
		Book book = bStoreService.findById(id); // 為取得ISBN碼
		String isbn = book.getIsbn();
		System.out.println("isbn-----is : " + isbn.subSequence(3, isbn.length())); // TEST OK
		m.addAttribute("isbn", isbn);
		return "store/showDetails2"; // 圖片url改為base64 (BooksDetailsAdmin2.jsp)
	}

	// Entry BooksDetails Store (if return , path is From Details To Books)
	@GetMapping("store.booksDetailsToBooks")
	public String searchAllBooksDetailsFromDetailsToBooks(@RequestParam Integer id, Model m) {
		System.out.println(id);
		m.addAttribute("id", id); // 傳遞booksid參數
		Book book = bStoreService.findById(id); // 為取得ISBN碼
		String isbn = book.getIsbn();
		System.out.println("isbn-----is : " + isbn.subSequence(3, isbn.length())); // TEST OK
		m.addAttribute("isbn", isbn);
		return "store/showDetailsFromDetailToBooks"; // 圖片url改為base64 (BooksDetailsAdmin2.jsp)
	}

	// Entry BooksUpdate Admin
	@GetMapping("admin.booksupdate")
	public String goToBooksUpdate(@RequestParam Integer id, Model m) {
		System.out.println(id);
		m.addAttribute("id", id); // 傳遞booksid參數
		return "book/BooksUpdateAdmin";
	}

	// Entry BooksAddUpdate Admin
	@GetMapping("admin.booksadd")
	public String goToBooksAdd() {
		return "book/BooksAddAdmin2"; // 圖片url改為base64 (BooksAddAdmin2.jsp)
	}

	@CrossOrigin(origins = "http://localhost:8081")
	@GetMapping("/books")
	@ResponseBody
	List<Book> findAll() {
		System.out.println("OKOK");

		return bStoreService.findAll();
	}

	@GetMapping("/books/{name}")
	@ResponseBody
	List<Book> findBooksByName(@PathVariable String name) {
		return bStoreService.findByName(name);
	}

	@GetMapping("/searchbooks/{id}")
	@ResponseBody
	Book findBooksById(@PathVariable("id") Integer booksid) {
		System.out.println(booksid); // Test
		System.out.println("Controller---searchbooks"); // Test
		System.out.println(bStoreService.findById(booksid) == null); // Test
		return bStoreService.findById(booksid);
	}

	@PutMapping("/books/{id}")
	@ResponseBody
	Book updateBooksById(@PathVariable("id") Integer booksid, @RequestBody Book book) {
		System.out.println(booksid); // Test
		System.out.println("Controller---updateBooksById"); // Test
//		System.out.println(bs.updateById(book)==null); //Test
		return bStoreService.updateById(book);
	}

	// 上傳圖片ajax 回傳檔名
	@PostMapping("/BookCoverAddController")
	@ResponseBody
	public Book processUploadFileAction(HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file)
			throws IllegalStateException, IOException, FileUploadException {
		System.out.println(file.getOriginalFilename()); // test

		String originalFilename = file.getOriginalFilename(); // 包含副檔名 xxx.jpg
		int index = originalFilename.lastIndexOf(".");

		String endWith = originalFilename.substring(index); // 抓副檔名
		String newFileName = System.currentTimeMillis() + endWith;

//		String saveTempFileDir = request.getSession().getServletContext().getRealPath("/") + "uploads\\";
		String saveTempFileDir = "C:\\MyPrioject\\workspace\\booksplattform\\src\\main\\resources\\static\\uploads\\";
		System.out.println(saveTempFileDir); // test

		newFileName = newFileName.toLowerCase(); // 全部轉小寫
		String saveFilePath = saveTempFileDir + newFileName;

		File saveFile = new File(saveFilePath);
		file.transferTo(saveFile);

		System.out.println(newFileName); // 印出檔案完整路徑
		// 取得 upload相對路徑
//		String relativeFilePath = "upload\\" + newFileName;
		String relativeFilePath = newFileName;

		Book book = new Book(newFileName);
		// JSON回傳 相對路徑
//		String jsonStr = JSON.toJSONString(book);
		return book;
	}

	@PostMapping("/books")
	@ResponseBody
	public Book findBooksByName(@RequestBody Book book) {
		System.out.println(book);
		return bStoreService.addBook(book);
	}

	@DeleteMapping("/books/{id}")
	@ResponseBody
	public Book deleteBook(@PathVariable("id") Integer booksid) {
		System.out.println(booksid);
		return bStoreService.deleteBook(booksid);
	}

	// 加入購物車
	@PostMapping("/addToOrder")
	@ResponseBody
	public BDetail addToShoppingCar(@RequestBody BDetail bDetail, Model m, HttpServletRequest req) {
		int sum = 0;
		boolean isRepeat = false;
		// 判斷是否已經存在Session裡面
		UserOrder userOrder = (UserOrder) req.getSession().getAttribute("userOrder");
		if (userOrder == null) {
			userOrder = new UserOrder();
			// 第一次加入商品
			Map<Integer, BDetail> map = new HashMap<>();
			map.put(bDetail.getBooksId(), bDetail);
			userOrder.setbDetails(map);
			userOrder.setSum(bDetail.getItemTotal());
			m.addAttribute("userOrder", userOrder);
			System.out.println("Session is empty~~~~"); // test
//			System.out.println(userOrder.getbDetails()); // test
		} else {
			System.out.println("Session is not empty");// test
//			System.out.println(userOrder.getbDetails());TEST
			// 如不為空, 開始判斷
			Map<Integer, BDetail> map = userOrder.getbDetails();
//			System.out.println(map);// test
			if (map.size() > 0) {
				BDetail tmpItem = map.get(bDetail.getBooksId());
				if (tmpItem != null) {
					// 有重複,更新數量及品項總額
					tmpItem.setQuantity(tmpItem.getQuantity() + bDetail.getQuantity());
					tmpItem.setItemTotal(tmpItem.getPrice() * tmpItem.getQuantity());
					map.put(bDetail.getBooksId(), tmpItem);
//					isRepeat = true;
				} else {
					// 如果沒有重複 直接加入
					map.put(bDetail.getBooksId(), bDetail);
					isRepeat = false;
				}

			} else {
				// 為空直接new Arraylist加入資料
				Map<Integer, BDetail> map2 = userOrder.getbDetails();
				map2.put(bDetail.getBooksId(), bDetail);
//				userOrder.setbDetails(list);
			}

			System.out.println("最後session資料為: ");
			for (Integer idx : userOrder.getbDetails().keySet()) {
				System.out.println(userOrder.getbDetails().get(idx));
				sum += userOrder.getbDetails().get(idx).getItemTotal();
			}
			userOrder.setSum(sum);
		}
		return bDetail;
	}

	// 從購物車移除東西
	@GetMapping("/removeFromOrder/{booksId}")
	@ResponseBody
	public BDetail removeFromOrder(@PathVariable int booksId, HttpServletRequest req,
			SessionStatus sessionStatus) {
		System.out.println("removeFromOrder");  //test
		// 從Session取出當前購物車map
		UserOrder userOrder = (UserOrder) req.getSession().getAttribute("userOrder");
		Map<Integer, BDetail> shoppingCar = userOrder.getbDetails();
		// 從購物車移除
		BDetail bDetail = shoppingCar.remove(booksId);
		//重算訂單總額
		int sum = 0;
		for (Integer idx : userOrder.getbDetails().keySet()) {
			System.out.println(userOrder.getbDetails().get(idx));
			sum += userOrder.getbDetails().get(idx).getItemTotal();
		}
		userOrder.setSum(sum);
		
		//購物車沒東西時 sum=0 => 清除userOrder Session
		if(sum == 0) {
			sessionStatus.setComplete();
		}
		
		return bDetail;

	}

	@PostMapping("/order")
	@ResponseBody
	public String addToOrder(@RequestBody BDetail bDetail, HttpServletRequest req, Model m,
			SessionStatus sessionStatus) {
		System.out.println(bDetail.getStatus());
		if ("approveadd".equals(bDetail.getStatus())) {
			System.out.println("approveadd");

			UserOrder userOrder = (UserOrder) req.getSession().getAttribute("userOrder");

			Set<BDetail> set = new HashSet<>();
			if (userOrder.getbDetails() != null) {
				// 新增訂單
				BOrder bOrder = new BOrder();
				// 設定custId
				Reader reader = (Reader) req.getSession().getAttribute("userDetail");
				Integer custId = reader.getReaderId();
				bOrder.setCustId(custId);
				// 設定訂單總額
				Integer sum = userOrder.getSum();
				bOrder.setTotal(sum);
				// 設定訂單日期
				bOrder.setoDate(new Date());
				for (Integer idx : userOrder.getbDetails().keySet()) {
					userOrder.getbDetails().get(idx).setbOrder(bOrder); // 存訂單 有錯誤
					userOrder.getbDetails().get(idx).setStatus("processing"); // 設定狀態
					set.add(userOrder.getbDetails().get(idx));

					// 透過booksI(idx)修改庫存資料
					Book tmpBook = bStoreService.findById(idx);
					int oldQty = tmpBook.getQuantity(); // 原庫存
					int newQty = oldQty - userOrder.getbDetails().get(idx).getQuantity(); // 更新庫存
					tmpBook.setQuantity(newQty);
				}
				// 修改 custId 對應之書香幣
				Reader tmpReader = readerService.findReaderById(custId);
				int oldCoin = tmpReader.getReaderCoin(); // 原有書香幣別
				int newCoin = oldCoin - sum; // 減去訂單總額得出新書香幣別
				// 修改庫存資料
				tmpReader.setReaderCoin(newCoin);
				// 同步更新Session之Reader之資料
				reader.setReaderCoin(newCoin);

				// 存入資料庫
				List<BDetail> list = bDetailService.addBDetails(set);
				System.out.println("list is : " + list.size());
				if (list.size() > 0) {
					// 清掉Session
					sessionStatus.setComplete();
				}

			}
			return "OKOK-->>>approveadd";
		}

		return "Rejected-->>>unapproveadd";
	}

	// 分頁session "bookTotalPages" , "bookTotalElements"
	@PostMapping("/findBooksByPage/{pageNo}")
	@ResponseBody
	public List<Book> findBooksByPage(@PathVariable(name = "pageNo") int pageNo, Model m) {
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Book> page = bStoreService.findAllByPage(pageable);
		m.addAttribute("bookTotalPages", page.getTotalPages());
		m.addAttribute("bookTotalElements", page.getTotalElements());
		return bStoreService.findAllByPage(pageable).getContent();
	}

	// Entry Books Admin Test分頁
	@GetMapping("admin.booksByPage")
	public String searchAllBooksByPage(Model m) {
		findBooksByPage(1, m);
		return "store/showBooks"; // 圖片url改為base64 (BooksMainAdmin2.jsp)
	}
	
	//分類查詢
	@GetMapping("/vbooks/{key}")
	@ResponseBody
	List<Book> findByBooksVarieties(@PathVariable String key){
		return bStoreService.findByBooksVarieties(key);
	}
	
	@PostMapping("/addbook")
	@ResponseBody
	public Book addBook(@RequestBody Book book , HttpSession session){
		System.out.println(book);
		//找出reader
		int providerId = book.getProviderId();
		System.out.println("=========================ProviderId is>"+ providerId);
		Reader reader = readerService.findReaderById(providerId);
		//添加reader的Coin
		int oldCoin = reader.getReaderCoin();
		int newCoin = oldCoin + 300;
		reader.setReaderCoin( newCoin);
		session.setAttribute("userDetail", reader);
		
		return bStoreService.addBook(book);
	}

}
