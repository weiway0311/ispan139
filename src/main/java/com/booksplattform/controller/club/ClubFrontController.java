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
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/club")
@SessionAttributes(names = {"clubPages","clubElements","frontClubs"})
public class ClubFrontController {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReaderService readerService;
	
//	導引到主畫面
	@GetMapping("/frontclub.controller")
	public String clubMain(Model m) {
		clubPage(1, m);
		return "club/front/frontclub";
	}
	
	@PostMapping("/clubfrontPage/{pageNo}")
	@ResponseBody
	public List<Object[]> clubPage(@PathVariable("pageNo") int pageNo, Model m){
		
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
	
//	導引到AddClub
	@GetMapping("/addfrontClub.controller")
	public String addfrontClub() {
		return "club/front/addfrontClub";
	}
	
//	實作AddClub
	@PostMapping("/clubfrontAddController")
	public String clubfrontAddController(@RequestParam("clubClass") String clubClass,
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
		
		return "redirect:/club/frontclub.controller";
	}
	
//	以id尋找club導引到update
	@GetMapping("/clubfrontSearchById")
	public String clubfrontSearchById(@RequestParam("id")String clubId,
								 Model m) {
		if(clubId == null ) {
			return "redirect:/club/frontclub.controller";
		}else {
			Club club = clubService.searchById(Integer.parseInt(clubId));
			m.addAttribute("club", club);
			return "club/front/updatefrontClub";
		}
	}
	
//	實作UpdateClub
	@PostMapping("/clubfrontUpdateById")
	public String clubfrontUpdateById(@RequestParam("clubId") Integer clubId,
								 @RequestParam("clubClass") String clubClass,
								 @RequestParam("articleHeader") String articleHeader,
								 @RequestParam("articleBody") String articleBody,
								 @RequestParam("readerId") String readerId,
								 Model m) {
		Club club = new Club();
		
		if(clubClass.isEmpty() || articleHeader.isEmpty() || articleBody.isEmpty() || readerId.isEmpty()) {
//			應該要alert
			return "redirect:/club/frontclub.controller";
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
			System.out.println("****************");
			
			clubService.updateClub(club);
		}
		
		return "redirect:/club/frontclub.controller";
	}
	
//	刪除Club
	@GetMapping("/clubfrontDeleteById")
	public String clubfrontDeleteById(@RequestParam("id")String clubId, 
								 Model m) {
		clubService.deleteClubById(Integer.parseInt(clubId));
		return "redirect:/club/frontclub.controller";
	}
	
//	轉跳並尋找
	@GetMapping("/CommentfrontSearchById")
	public String commentfrontSearchById(@RequestParam("id")Integer clubId,
									Model m) {
		Club club = clubService.searchById(clubId);
		Reader clubreader =  readerService.findReaderById(club.getReaderId());
		
		List<Comment> comms = commentService.searchAllComms(clubId);
		List<Object[]> listcomm = new ArrayList<Object[]>();
		
		for(int i=0; i<comms.size(); i++) {
			Comment com = comms.get(i);
			Reader commreader = readerService.findReaderById(com.getReaderId());
			Object[] commobj = {com, commreader};
			listcomm.add(commobj);
		}
		
		m.addAttribute("club",club);
		m.addAttribute("reader",clubreader);
		m.addAttribute("comms",listcomm);
		return "club/front/frontcommont";
	}
	
//	導引到AddComment
	@GetMapping("/CommentfrontAddById")
	public String commentfrontAddById(@RequestParam("clubId")String clubId,
							 Model m) {
		m.addAttribute("clubId", clubId);
		return "club/front/addfrontComment";
	}
	
//	實作AddComment
	@PostMapping("/CommfrontAddController")
	public String commfrontAddController(@RequestParam("clubId") String clubId,
									@RequestParam("articleBody") String articleBody,
									@RequestParam("readerId") String readerId,
									Model m) {
		Comment comment = new Comment();
		
		if(clubId.isEmpty() || readerId.isEmpty() || articleBody.isEmpty()) {
//			應該要alert
			return "redirect:/club/CommentfrontSearchById?id="+clubId;
		}else {
			comment.setClubId(Integer.parseInt(clubId));
			comment.setArticleBody(articleBody);
			comment.setReaderId(Integer.parseInt(readerId));
			
			Date date = new Date();
			comment.setClubDate(date);
			
			commentService.addComment(comment);
		}
		
		return "redirect:/club/CommentfrontSearchById?id="+clubId;
	}
	
//  以id尋找comment導引到update
	@GetMapping("CommentfrontInsertById")
	public String commentfrontInsertById(@RequestParam("id")String commentId,
								 Model m) {
		if(commentId == null ) {
			return "redirect:/club/frontclub.controller";
		}else {
			Comment comment = commentService.searchById(Integer.parseInt(commentId));
			m.addAttribute("comm", comment);
			return "club/front/updatefrontComment";
		}
	}
	
//	實作UpdateComment
	@PostMapping("CommentfrontUpdateById")
	public String commentfrontUpdateById(@RequestParam("clubId") String clubId,
								    @RequestParam("commentId") String commentId,
								    @RequestParam("articleBody") String articleBody,
								    @RequestParam("readerId") String readerId,
								    Model m) {
		Comment comment = new Comment();
		
		if(clubId.isEmpty() || commentId.isEmpty() || articleBody.isEmpty() || readerId.isEmpty() ) {
//			應該要alert
			return "redirect:/club/CommentfrontSearchById?id="+clubId;
		}else {
			comment.setClubId(Integer.parseInt(clubId));
			comment.setCommentId(Integer.parseInt(commentId));
			comment.setArticleBody(articleBody);
			comment.setReaderId(Integer.parseInt(readerId));
			
			Date date = new Date();
			comment.setClubDate(date);
			
			commentService.updateComment(comment);
		}
		
		return "redirect:/club/CommentfrontSearchById?id="+clubId;
	}
	
//	刪除Comment
	@GetMapping("/CommfrontDeleteById")
	public String commfrontDeleteById(@RequestParam("id")String commentId, 
								 Model m) {
		Comment comment = commentService.searchById(Integer.parseInt(commentId));
		String clubId = String.valueOf(comment.getClubId());
		commentService.deleteCommById(Integer.parseInt(commentId));
		return "redirect:/club/CommentfrontSearchById?id="+clubId;
	}
	
//	會員中心
	@GetMapping("/memberclub")
	public String clubMember() {
		return "club/front/memberclub";
	}
	
//	關鍵字
	@PostMapping("/clubSearchByMember")
	@ResponseBody
	public List<Object[]> clubSearchByMember(@RequestParam("member")String member, Model m) throws JsonProcessingException {
		List<Club> clubs = clubService.findByReaderId(Integer.parseInt(member));
		
		
		List<Object[]> list =  new ArrayList<Object[]>();
		for(int i=0; i<clubs.size(); i++) {
			
			Club club = clubs.get(i);
			List<Comment> comms = commentService.searchAllComms(club.getClubId());
			int a = comms.size()+1;
			System.out.println(a);
			Object[] test = {club, a};
			list.add(test);
		}
		
		
		return list;
	}
	
	// 搜尋全部貼文(首頁用) update by Sean 05.09
	@GetMapping("/findallclubsfront")
	public void findAllClub(Model m){
		List<Club> clubs = clubService.findallClubs();
		m.addAttribute("frontClubs", clubs);
	}
	
}













