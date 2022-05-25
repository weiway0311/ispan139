package com.booksplattform.controller.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.booksplattform.model.book.Book;
import com.booksplattform.model.order.Details;
import com.booksplattform.model.order.DetailsService;
import com.booksplattform.model.order.Order;
import com.booksplattform.model.order.OrderService;
import com.booksplattform.model.reader.Reader;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/order")
@SessionAttributes(names = {"userDetail", "sCount", "orders"})

public class OrderController {

	@Autowired
	private OrderService oService;
	@Autowired
	private DetailsService dService;

	// go to 訂單主頁
	@GetMapping("/gotosearchall")
	public String gotoSearchAll(Model m) {
		//圖表code
		int sProcessing = oService.findByStatusList("處理中").size();
		int sConfirm = oService.findByStatusList("已確認").size();
		int sShipped = oService.findByStatusList("已出貨").size();
		int sFinish = oService.findByStatusList("已完成").size();
		int sCancel = oService.findByStatusList("已取消").size();
		int[] sCount = {sProcessing, sConfirm, sShipped, sFinish, sCancel};
		m.addAttribute("sCount", sCount);
	
		//找全部
		List<Order> orders = oService.findAll();
		m.addAttribute("orders", orders);
		return "order/orderMain";
	}
	
//	// 透過id查詢
//	@GetMapping("/searchorderbyid.controller")
//	public String searchOrderById(@RequestParam("id") String oid, Model m) {
//		System.out.println(oid);
//		Order order = oService.findById(oid);
//		m.addAttribute("order", order);
//		return "order/searchOrder";
//	}
	
	// 查詢關鍵字
	@PostMapping("/findorderbykeyword")
	public String findByKeyword(@RequestParam("keyword") String keyword, Model m) throws JsonProcessingException{
		List<Order> list = oService.findOrderByKeyword(keyword);
		m.addAttribute("orders", list);
		return "order/orderMain";
	}
	
	// 查詢“處理中”頁面
	@GetMapping("/findbyprocessing")
	public String findByProcessing(Model m) {
		List<Order> sProcessing = oService.findByStatusList("處理中");
		m.addAttribute("orders",sProcessing);
		m.addAttribute("status", "processing");
		return "order/orderMain";
	}

	// 查詢“已確認”頁面
	@GetMapping("/findbyconfirm")
	public String findByConfirm(Model m) {
		List<Order> sConfirm = oService.findByStatusList("已確認");
		m.addAttribute("orders", sConfirm);
		m.addAttribute("status", "confirm");
		return "order/orderMain";
	}
	
	// 查詢“已出貨”頁面
	@GetMapping("/findbyshipped")
	public String findByShipped(Model m) {
		List<Order> sShipped = oService.findByStatusList("已出貨");
		m.addAttribute("orders", sShipped);
		m.addAttribute("status", "shipped");
		return "order/orderMain";
	}

	// 查詢“已完成”頁面
	@GetMapping("/findbyfinish")
	public String findByFinish(Model m) {
		List<Order> sFinish = oService.findByStatusList("已完成");
		m.addAttribute("orders", sFinish);
		m.addAttribute("status", "finish");
		return "order/orderMain";
	}

	// 查詢“已取消”頁面
	@GetMapping("/findbycancel")
	public String findByCancel(Model m) {
		List<Order> sCancel = oService.findByStatusList("已取消");
		m.addAttribute("orders", sCancel);
		m.addAttribute("status", "cancel");
		return "order/orderMain";
	}
	
	// go to 新增訂單頁面
	@GetMapping("/gotoaddorders")
	public String gotoAddOrders() {
		return "order/addOrder";
	}
	
	// 新增訂單
	@PostMapping("/orderinsert")
	@ResponseBody
	public String orderInsert(@RequestParam int custId, @RequestParam int total,
					@RequestParam int booksId, @RequestParam String booksName,
					@RequestParam int price, @RequestParam int quantity, 
					@RequestParam int itemTotal) {
		
		HashSet<Object> set = new HashSet<>();
		Order o = new Order();
		Details d = new Details(booksId, booksName, price, quantity, itemTotal);	
		o.setoId(createOrderNumber());
		o.setoDate(new Date());
		o.setCustId(custId);
		o.setTotal(total);
		o.setStatus("處理中");
		d.setOrder(o);
		set.add(d);

		dService.insert(d);
		System.out.println("訂單編號:【"+createOrderNumber()+"】");
		System.out.println("新增書籍名稱:【" + booksName + "】");
//		return "redirect:gotosearchall";
		return "success";
	}
	
	// 訂單編號自動生成
	public static String createOrderNumber() {
		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		StringBuffer b = new StringBuffer();
		b.append(format.format(date));
		b.append((date.getTime() + "").substring(9));
		b.append(getRandNum(4));
		return b.toString();
	}
	// 隨機4碼
	public static String getRandNum(int leng) {
		Random random = new Random();
		StringBuffer result = new StringBuffer();
		for (int i = 0; i < leng; i++) {
			result.append(random.nextInt(10));
		}
		if (result.length() > 0) {
			return result.toString();
		}
		return null;
	}
	
	// 修改訂單
	@PutMapping("/updateorder.controller/{id}")
	@ResponseBody
	public String updateOrder(@PathVariable("id") String id, @RequestBody Map<String,String> map) {
		String status = map.get("status");
//		System.out.println("選擇的狀態："+status);
		Order result = oService.findById(id);
		result.setStatus(status);
		oService.update(result);
		return "success";
	}

	// go to 訂單明細主頁
	@GetMapping("/gotodetails.controller")
	public String gotoDetails(@RequestParam("id") String oid, Model m) {
		System.out.println("詳情訂單編號 :【" + oid + "】");
		Details details = dService.findByOid(oid);
		
		String oidStr = details.getOrder().getoId();
		details.setoId(oidStr);

		m.addAttribute("details", details);
		return "order/searchDetails";
	}
	
	// 分頁session "orderTotalPages" , "orderTotalPages"
	@PostMapping("/findorderbypage/{pageNo}")
	@ResponseBody
	public List<Order> findOrderByPage(@PathVariable(name = "pageNo") int pageNo, Model m) {
		
		int pageSize = 5;//顯示筆數
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Order> page = oService.findAllByPage(pageable);
		m.addAttribute("orderTotalPages", page.getTotalPages()); //抓取資料庫判別總頁數
		m.addAttribute("orderTotalElements", page.getTotalElements());
		return oService.findAllByPage(pageable).getContent();
	}

	// Entry Books Admin Test分頁
	@GetMapping("/orderbypage")
	public String searchAllOrderByPage(Model m) {
		findOrderByPage(1, m);
		return "order/orderMain"; // 圖片url改為base64 (BooksMainAdmin2.jsp)
	}

//	// 刪除訂單
//	@GetMapping("/deleteorderbyid.controller")
//	private String deleteOrderById(@RequestParam("id") int id) {
//		System.out.println("delete-- " + id);
//		oService.deleteById(id);
//		dService.deleteById(id);
//		return "redirect:gotosearchall";
//	}
	
	// 使用者端-----------------------------------------
	
	// 會員查詢訂單
	@GetMapping("/findorderbycustid/{custId}")
	public String findOrderByCustId(@PathVariable("custId") int custId, Model m) {
//			System.out.println(custId+"------------------");
		List<Order> list = oService.findOrderByCustId(custId);
		m.addAttribute("orders", list);
		return "order/custOrderPage";
	}

	// go to 書友訂單明細主頁
	@GetMapping("/findorderbycustid/gotocustdetails/{oid}")
	public String gotoCustDetails(@PathVariable("oid") String oid, Model m) {
		System.out.println("詳情訂單編號 :【" + oid + "】");
		Details details = dService.findByOid(oid);

		String oidStr = details.getOrder().getoId();
		details.setoId(oidStr);

		m.addAttribute("details", details);
		return "order/custDetailsPage";
	}

}