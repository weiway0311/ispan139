package com.booksplattform.controller.club;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booksplattform.model.club.ClubService;
import com.booksplattform.model.club.CommentService;
import com.booksplattform.model.club.Creport;
import com.booksplattform.model.club.CreportService;

@Controller
@RequestMapping("/club")
public class CreportController {
	
	@Autowired
	private CreportService crepoService;
	@Autowired
	private ClubService clubService;
	@Autowired
	private CommentService commentService;
	
	@GetMapping("/creport.controller")
	public String creportMain() {
		return "club/searchcreports";
	}
	
	@PostMapping("/searchcreports.controller")
	@ResponseBody
	public List<Creport> searchallcrepo(Model m){
		List<Creport> creports = crepoService.searchAllCrepo();
		m.addAttribute("creports", creports);
		System.out.println(creports);
		return creports;
	}
	
	@PostMapping("/crepoAddController")
	public String crepoAddController(@RequestParam("clubId")String clubId,
									 @RequestParam("commentId")String commentId,
									 @RequestParam("articleBody")String articleBody,
									 @RequestParam("reportWho")String reportWho,
									 @RequestParam("reportartcle")String reportartcle
									 ) {
		Creport creport = new Creport();
		
		
		creport.setClubId(Integer.parseInt(clubId));
		creport.setCommentId(Integer.parseInt(commentId));
		creport.setArticleBody(articleBody);
		creport.setReportWho(reportWho);
		creport.setReportartcle(reportartcle);
		Date date = new Date();
		creport.setReportDate(date);
		
		crepoService.addCreport(creport);
		
		
		
		
		return "redirect:/club/CommentSearchById?id="+clubId;
		
	}
	
//	前台檢舉
	@PostMapping("/crepofrontAddController")
	public String crepofrontAddController(@RequestParam("clubId")String clubId,
									 @RequestParam("commentId")String commentId,
									 @RequestParam("articleBody")String articleBody,
									 @RequestParam("reportWho")String reportWho,
									 @RequestParam("reportartcle")String reportartcle
									 ) {
		Creport creport = new Creport();
		
		
		creport.setClubId(Integer.parseInt(clubId));
		creport.setCommentId(Integer.parseInt(commentId));
		creport.setArticleBody(articleBody);
		creport.setReportWho(reportWho);
		creport.setReportartcle(reportartcle);
		Date date = new Date();
		creport.setReportDate(date);
		
		crepoService.addCreport(creport);
		
		
		
		
		return "redirect:/club/CommentfrontSearchById?id="+clubId;
		
	}
	
	@GetMapping("/creportDeleteById")
	public String creportDeleteById(@RequestParam("id")String creportId, 
			 					Model m) {
		crepoService.deleteCrepoById(Integer.parseInt(creportId));
		return "redirect:/club/creport.controller";
	}
	
	@GetMapping("/creportclubDeleteById")
	public String clubDeleteById(@RequestParam("clubid")String clubId,
								 @RequestParam("commid")String commId,
								 @RequestParam("rid")String creportId,
			 					 Model m) {
//		System.out.println(clubId+":"+commId);
		if(Integer.parseInt(commId) == 0) {
//			System.out.println(clubId+":"+commId);
			clubService.deleteClubById(Integer.parseInt(clubId));
			crepoService.deleteCrepoById(Integer.parseInt(creportId));
		}else {
			commentService.deleteCommById(Integer.parseInt(commId));
			crepoService.deleteCrepoById(Integer.parseInt(creportId));
		}
		return "redirect:/club/creport.controller";
	}
	
	
	
	
	
}












