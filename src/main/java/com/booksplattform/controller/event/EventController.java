package com.booksplattform.controller.event;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.booksplattform.model.event.Event;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.event.EventService;


@Controller
@SessionAttributes(names= {"events","eventType","frontEvents"})
public class EventController {

	@Autowired
	private EventService eventService;
	
	
	//主要進入點 , 查詢所有畫面
//	@RequestMapping(path="EventMain", method=RequestMethod.GET)
//	public String entryPoint(Model m) {
//		List<Event> result = eventService.searchAll();
//		m.addAttribute("events", result);
//		return "event/searchevent";
//	}
	
	@GetMapping("/gotoAddPage")
	public String gotoAddPage() {
		return "event/addEvent";
	}
	
	//前往修改頁面
	@GetMapping("/eventupdatepage/{id}")
	public String gotoUpdatePage(@PathVariable("id") int id, Model m) {
		Event result = eventService.searchById(id);
		m.addAttribute("event", result);
		return "event/updateEvent";
	}
	
	//修改
//	@PutMapping("/updateevent")
//	public String gotoUpdatePage(@RequestParam("id") String id,Model m) {
//		if(id == null ) {
//			return entryPoint(m);
//		}else {
//			Event event = eventService.searchById(Integer.parseInt(id));
//			m.addAttribute("event", event);
//			return "/event/updateEvent";
//		}
//	}
	
	//搜尋全部ok
	@GetMapping("/searchallevent")
	public String searchAllEvent(Model m){
		List<Event> events = eventService.searchAll();
		m.addAttribute("events", events);
		return "event/searchevent";
	}
	
	//刪除活動ok
	@PostMapping("/eventdelete/{id}")
	@ResponseBody
	public String deleteEventById(@PathVariable("id") int id) {
		eventService.deleteEventById(id);
		return "success";
	}
	
	// 新增活動ok
	@PostMapping("/eventadd")
	public String addEvent(@RequestParam("eventName") String eventName,
			@RequestParam("eventType") String eventType,
			@RequestParam("eventDate") String eventDate,
			@RequestParam("eventPlace") String eventPlace,
			@RequestParam("eventNumber") String eventNumber,
			@RequestParam("eventBio") String eventBio,
			Model m) {
		
		Event eventBean = new Event();
		
		
		
		if(eventName.isEmpty() || eventType.isEmpty() || eventDate.isEmpty() || eventPlace.isEmpty() || eventNumber.isEmpty() || eventBio.isEmpty()) {
//			應該要alert
			return "redirect:gotoAddPage";
		}else {
			//存入預設圖片-------------------------------
			String defaultImg = "C:\\DataSource\\workspace\\booksplattform\\src\\main\\webapp\\WEB-INF\\img\\defaultEvent.jpg";
			FileInputStream fis;
			try {
				fis = new FileInputStream(defaultImg);
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buff = new byte[1024];
				int len = 0;
				while ((len = fis.read(buff)) != -1) {
				  bos.write(buff, 0, len);
				}
				// 得到圖片的位元組陣列
				byte[] result = bos.toByteArray();
				eventBean.setPhoto(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
			//-------------------------------
			
			eventBean.setEventName(eventName);
			eventBean.setEventType(eventType);
			eventBean.setEventDate(eventDate);
			eventBean.setEventPlace(eventPlace);
			eventBean.setEventNumber(Integer.parseInt(eventNumber));
			eventBean.setEventBio(eventBio);
			eventService.addEvent(eventBean);
			return "redirect:searchallevent";
		}
	}
	
	@PostMapping("/updateevent")
	public String updateEvent(@RequestParam("eventId") int id,
							  @RequestParam("eventName") String eventName,
							  @RequestParam("eventType") String eventType,
							  @RequestParam("eventDate") String eventDate,
							  @RequestParam("eventPlace") String eventPlace,
							  @RequestParam("eventNumber") String eventNumber,
							  @RequestParam("eventBio") String eventBio,
							  Model m) {
		
		Event eventBean = eventService.searchById(id);

		eventBean.setEventName(eventName);
		eventBean.setEventType(eventType);
		eventBean.setEventDate(eventDate);
		eventBean.setEventPlace(eventPlace);
		eventBean.setEventNumber(Integer.parseInt(eventNumber));
		eventBean.setEventBio(eventBio);
		System.out.println("物件完成進行修改");
		eventService.updateEvent(eventBean);
		return "redirect:searchallevent";
	}
	
	// 上傳活動圖片(管理員) ==========================================================================================
	@PostMapping("/uploadeventphoto/{id}")
	public String uploadReaderPhoto(@RequestParam("photo") MultipartFile photo, @PathVariable("id") int id, Model m) {
		Event event = eventService.searchById(id);
		try {
			event.setPhoto(photo.getBytes());
			eventService.addEvent(event);
			
			m.addAttribute("event", event);
			
			return "event/updateEvent";
		} catch (IOException e) {
			e.printStackTrace();
			return "event/updateEvent";
		}
	}
	
	// 取得圖片 ==========================================================================================
	@GetMapping("/showeventphoto/{id}")
	public ResponseEntity<byte[]> showEventPhoto(@PathVariable("id") Integer id){
		Event event = eventService.searchById(id);
		byte[] photo = event.getPhoto();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(photo, headers, HttpStatus.OK);
	}
	
	// 前往詳情頁面
	@GetMapping("/eventDetail/{id}")
	public String eventDetail(@PathVariable("id") int id, Model m) {
		Event event = eventService.searchById(id);
		m.addAttribute("event", event);
		return "event/eventDetail";
	}
	
	//搜尋全部ok(前台)
	@GetMapping("/eventfrontpage")
	public String gotoEventFrontPage(Model m){
		List<Event> events = eventService.searchAll();
		m.addAttribute("events", events);
		return "event/eventFrontPage";
	}
		
	//活動詳情頁面(前台)
	@GetMapping("/eventfrontpagedetail/{id}")
	public String gotoEventFrontPageDetail(@PathVariable("id") int id, Model m){
		Event event = eventService.searchById(id);
		m.addAttribute("event", event);
		return "event/eventFrontPageDetail";
	}
	
	
	//AJAX ======================================
	
	//搜尋全部(前台)(沒有重新抓全部資料)
	@GetMapping("/eventfrontpage0")
	public String gotoEventFrontPage0(){
		return "event/eventFrontPage";
	}
	
	//依照類別搜尋
	@GetMapping("/eventbytype/{eventType}")
	@ResponseBody
	public void searchByType(@PathVariable("eventType") String eventType,Model m){
		List<Event> elist;
		if(eventType.equals("全部")) {
			elist = eventService.searchAll();
		}else {
			elist = eventService.searchByType(eventType);			
		}
		m.addAttribute("events", elist);			
		m.addAttribute("eventType",eventType);
	}
	
	//搜尋全部ok(首頁用) update by Sean 05.09
	@GetMapping("/eventforfrontpage")
	public void eventForFrontpage(Model m){
		List<Event> events = eventService.searchAll();
		m.addAttribute("frontEvents", events);
	}
}






