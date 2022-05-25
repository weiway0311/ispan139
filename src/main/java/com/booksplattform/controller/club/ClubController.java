package com.booksplattform.controller.club;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.booksplattform.model.club.Club;
import com.booksplattform.model.club.ClubService;
import com.booksplattform.model.club.Comment;
import com.booksplattform.model.club.CommentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/club")
@SessionAttributes(names = {"clubPages","clubElements"})
public class ClubController {
	
	@Autowired
	private ClubService clubService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ObjectMapper mapper; //處理JSON
	
//	導引到主畫面
	@GetMapping("/clubmain.controller")
	public String clubMain(Model m) {
		clubPage(1, m);
		return "club/searchclubs";
	}
	
//	導引到AddClub
	@GetMapping("/addClub.controller")
	public String addClub() {
		return "club/addClub";
	}
	
//	進入主畫面後導入clublist
//	@PostMapping("/searchclubs.controller")
//	@ResponseBody
//	public Page<Club> processQueryAllAction(){
//		return clubService.searchAllClubs();
//	}
	
//	實作AddClub
	@PostMapping("/clubAddController")
	public String clubAddController(@RequestParam("clubClass") String clubClass,
									@RequestParam("articleHeader") String articleHeader,
									@RequestParam("articleBody") String articleBody,
									@RequestParam("readerId") String readerId,
									Model m) {
		Club club = new Club();
		
		if(clubClass.isEmpty() || articleHeader.isEmpty() || articleBody.isEmpty() || readerId.isEmpty()) {
//			應該要alert
			return "redirect:/club/clubmain.controller";
		}else {
			club.setClubclass(clubClass);
			club.setArticleHeader(articleHeader);
			club.setArticleBody(articleBody);
			club.setReaderId(Integer.parseInt(readerId));
			
//			截字串
			String str =articleBody;
			int index = str.indexOf("src=\"");
			System.out.println("獲得第一個點的位置:"+index);
			if(index!=-1) {
				int index2 = str.indexOf("width=", index + 1);
				System.out.println("根據第一個點的位置 獲得第二個點的位置:"+index2);
				String result = str.substring(index+5,index2-26);
				System.out.println("輸出結果:"+result);
				if (result != null) {
					club.setClubImg(result);
				}
			}else {
				club.setClubImg("/img/noimg.png");
			}
			
			Date date = new Date();
			club.setClubDate(date);
			
			clubService.addClub(club);
		}
		
		return "redirect:/club/clubmain.controller";
	}
	
//	以id尋找club導引到update
	@GetMapping("/clubSearchById")
	public String clubSearchById(@RequestParam("id")String clubId,
								 Model m) {
		if(clubId == null ) {
			return "redirect:/club/clubmain.controller";
		}else {
			Club club = clubService.searchById(Integer.parseInt(clubId));
			m.addAttribute("club", club);
			return "club/updateClub";
		}
	}
	
//	實作UpdateClub
	@PostMapping("/clubUpdateById")
	public String clubUpdateById(@RequestParam("clubId") Integer clubId,
								 @RequestParam("clubClass") String clubClass,
								 @RequestParam("articleHeader") String articleHeader,
								 @RequestParam("articleBody") String articleBody,
								 @RequestParam("readerId") String readerId,
								 Model m) {
		Club club = new Club();
		
		if(clubClass.isEmpty() || articleHeader.isEmpty() || articleBody.isEmpty() || readerId.isEmpty()) {
//			應該要alert
			return "redirect:/club/clubmain.controller";
		}else {
			club.setClubId(clubId);
			club.setClubclass(clubClass);
			club.setArticleHeader(articleHeader);
			club.setArticleBody(articleBody);
			club.setReaderId(Integer.parseInt(readerId));
			

			
//			截字串
			String str =articleBody;
			int index = str.indexOf("src=\"");
			System.out.println("獲得第一個點的位置:"+index);
			if(index!=-1) {
				int index2 = str.indexOf("width=", index + 1);
				System.out.println("根據第一個點的位置 獲得第二個點的位置:"+index2);
				String result = str.substring(index+5,index2-26);
				System.out.println("輸出結果:"+result);
				if (result != null) {
					club.setClubImg(result);
				}
			}else {
				club.setClubImg("/img/noimg.png");
			}

			
			
			Date date = new Date();
			club.setClubDate(date);
			
			clubService.updateClub(club);
		}
		
		return "redirect:/club/clubmain.controller";
	}
	
//	刪除Club
	@GetMapping("/clubDeleteById")
	public String clubDeleteById(@RequestParam("id")String clubId, 
								 Model m) {
		clubService.deleteClubById(Integer.parseInt(clubId));
		return "redirect:/club/clubmain.controller";
	}
//	刪除Club
	@DeleteMapping("/clubDeleteById2/{clubid}")
	@ResponseBody
	public String clubDeleteById2(@PathVariable("clubid")int clubid) throws JsonProcessingException {
		clubService.deleteClubById(clubid);
		String jsonString = mapper.writeValueAsString("success"); 
		return jsonString;
	}
	
//	進入主畫面後導入clubPage
	@PostMapping("/clubPage/{pageNo}")
	@ResponseBody
	public List<Object[]> clubPage(@PathVariable("pageNo") int pageNo, Model m){
		
//		確認區比數
		int allClubs = clubService.findallClubs().size();
		int classClubs1 = clubService.findByClubclass("討論區").size();
		int classClubs2 = clubService.findByClubclass("心得區").size();
		int classClubs3 = clubService.findByClubclass("分享區").size();
		int[] clubclassCount = {allClubs, classClubs1, classClubs2, classClubs3};
		m.addAttribute("clubclassCount", clubclassCount);
		
//		查詢全部
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Club> page = clubService.searchAllClubs(pageable);
		m.addAttribute("clubPages", page.getTotalPages());
		m.addAttribute("clubElements", page.getTotalElements());
		
		
		
		List<Club> clublist = page.getContent();
		List<Object[]> list =  new ArrayList<Object[]>();
		for(int i=0; i<clublist.size(); i++) {
			
			Club club = clublist.get(i);
			List<Comment> comms = commentService.searchAllComms(club.getClubId());
			int a = comms.size()+1;
			System.out.println(a);
			Object[] test = {club, a};
			list.add(test);
		}
		
		
		
		
		
		
		
		
		return list;
	}
	
//	@Autowired
//	private ObjectMapper mapper;
	
//	關鍵字
	@PostMapping("/clubSearchByKeyword")
	@ResponseBody
	public List<Object[]> clubSearchByKeyword(@RequestParam("keyword")String keyword, Model m) throws JsonProcessingException {
		List<Club> clubs = clubService.searchClubByKeyword(keyword);
		
		
		List<Object[]> list =  new ArrayList<Object[]>();
		for(int i=0; i<clubs.size(); i++) {
			
			Club club = clubs.get(i);
			List<Comment> comms = commentService.searchAllComms(club.getClubId());
			int a = comms.size()+1;
			System.out.println(a);
			Object[] test = {club, a};
			list.add(test);
		}
		
		
		
//		String jsonString = mapper.writeValueAsString(clubs);
//		System.out.println(jsonString);
//		m.addAttribute("clubs", clubs);
//		System.out.println(keyword);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
}
