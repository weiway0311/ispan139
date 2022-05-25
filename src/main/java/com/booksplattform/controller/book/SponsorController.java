package com.booksplattform.controller.book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.booksplattform.model.book.LinePayConfirmation;
import com.booksplattform.model.book.LinePayEntity;
import com.booksplattform.model.book.Sponsor;
import com.booksplattform.model.book.SponsorService;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.utils.HttpUtil;
import com.booksplattform.utils.SponsorMail;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/sponsor")
//@SessionAttributes(names= {"amount"})
public class SponsorController {
	
	@Autowired
	private SponsorService ss;

	// 沒ID就進入填寫欄位 , 有ID就跳轉付款確認confirmUrl
	@GetMapping("goToConfirm")
	public String goToSponsor(@RequestParam(name = "transactionId", required = false) String id, Model m,
			HttpServletRequest req, HttpSession session) {
		if (id == null) {
			return "sponsor/spomsorMain";
		} else {
			System.out.println(id);
			m.addAttribute("id", id);
			
			//透過transactionId 取出amount
			Sponsor sponsor = ss.findSponsorByTransactionId(id);
			m.addAttribute("amount", sponsor.getAmount());
			
			//清除session  uuid
			session.removeAttribute("uuid");

			//此時更新付款狀態為 checked (已confirm)
			sponsor.setStatus("checked");
			//更新狀態
			ss.addOrUpdateSponsor(sponsor);
			
			return "sponsor/confirmationjsp";
		}
	}
	
	
	@PostMapping("checking")
	@ResponseBody
	public Sponsor goChecking(@RequestBody Sponsor sponsor,
							 HttpSession session) {
		//從Session 取得 uuid
		String uuid = (String) session.getAttribute("uuid");
		//取出對應之sponsor
		Sponsor currSponsor = ss.findSponsorByUuid(uuid);
		//存入金額amount
		currSponsor.setAmount(sponsor.getAmount());
		//初步設定狀態為 checking (此時尚未confirm)
		currSponsor.setStatus("checking");
		//設定custId
		Reader reader = (Reader) session.getAttribute("userDetail");
		int readerId = reader.getReaderId();
		currSponsor.setCustId(readerId);
		return ss.addOrUpdateSponsor(currSponsor);
	}
	

	@PostMapping("reserve")
	@ResponseBody
	public String goReserve(@RequestBody LinePayEntity lpe, HttpServletRequest req, 
						Model m, HttpSession session)
			throws JSONException, IOException {
		
//		System.out.println(lpe.getAmount());  //TEST

		// 設定訂單orderId號碼 uuid
		String uuid = UUID.randomUUID().toString();
		//將uuid 設為session 以便 checking時可以取用
		session.setAttribute("uuid", uuid);
		
		lpe.setOrderId(uuid);
		System.out.println("uuid is :");
		System.out.println(uuid);

		HttpUtil h = new HttpUtil();

		System.out.print("OKOK!");
//		return h.sendRequest(amount , productName, productImageUrl, confirmUrl, orderId, currency);
		String sendRequest = h.sendRequest(lpe);
		System.out.println("controller reserve :");
		//切出trasnationId
		int idx = sendRequest.indexOf("transactionId");
		String transactionId = sendRequest.substring(idx+15 ,idx+ 34);
		System.out.println(transactionId); //test
		//新增一個sponsor (uuid , transactionId)
		Sponsor sponsor = new Sponsor(uuid , transactionId);
		ss.addOrUpdateSponsor(sponsor);
		
		System.out.println(sendRequest); //test
		return sendRequest;
	}

	@GetMapping("/confirm/{transactionId}")
	@ResponseBody
	public String goConfirm(@PathVariable("transactionId") String id, 
							  @RequestParam("amount") Integer amount,
							  @RequestParam("currency") String currency
//			@RequestBody LinePayConfirmation lpc,
	) throws JSONException, IOException {
		HttpUtil h = new HttpUtil();

		System.out.println("======== after confirm :");  //TEST
		System.out.print(id);  //TEST

		//建立 confirm所需之物件作為confirm之body所用
		LinePayConfirmation lpc = new LinePayConfirmation();
		lpc.setAmount(amount);
		lpc.setCurrency(currency);
		
		//最後寄送感謝函    (mail 測試)
		SponsorMail sponsorMail = new SponsorMail();
		//sponsorMail.sendMail("XXX" , amount);
		
		return h.sendConfirm(id, lpc);
	}

}
