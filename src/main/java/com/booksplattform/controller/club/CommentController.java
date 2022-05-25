package com.booksplattform.controller.club;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booksplattform.model.club.Club;
import com.booksplattform.model.club.ClubService;
import com.booksplattform.model.club.Comment;
import com.booksplattform.model.club.CommentService;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.reader.ReaderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
@RequestMapping("/club")
public class CommentController {
	
	@Autowired
	private ClubService clubService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ReaderService readerService;
	@Autowired
	private ObjectMapper mapper; //處理JSON
	
//	轉跳並尋找
	@GetMapping("/CommentSearchById")
	public String commentSearchById(@RequestParam("id")Integer clubId,
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
		return "club/searchcomments";
	}
	
//	導引到AddComment
	@GetMapping("/CommentAddById")
	public String commentAddById(@RequestParam("clubId")String clubId,
							 Model m) {
		m.addAttribute("clubId", clubId);
		return "club/addComment";
	}
	
//	實作AddComment
	@PostMapping("/CommAddController")
	public String commAddController(@RequestParam("clubId") String clubId,
									@RequestParam("articleBody") String articleBody,
									@RequestParam("readerId") String readerId,
									Model m) {
		Comment comment = new Comment();
		
		if(clubId.isEmpty() || readerId.isEmpty() || articleBody.isEmpty()) {
//			應該要alert
			return "redirect:/club/CommentSearchById?id="+clubId;
		}else {
			comment.setClubId(Integer.parseInt(clubId));
			comment.setArticleBody(articleBody);
			comment.setReaderId(Integer.parseInt(readerId));
			
			Date date = new Date();
			comment.setClubDate(date);
			
			commentService.addComment(comment);
		}
		
		return "redirect:/club/CommentSearchById?id="+clubId;
	}
	
//  以id尋找comment導引到update
	@GetMapping("CommentInsertById")
	public String commentInsertById(@RequestParam("id")String commentId,
								 Model m) {
		if(commentId == null ) {
			return "redirect:/club/clubmain.controller";
		}else {
			Comment comment = commentService.searchById(Integer.parseInt(commentId));
			m.addAttribute("comm", comment);
			return "club/updateComment";
		}
	}
	
//	實作UpdateComment
	@PostMapping("CommentUpdateById")
	public String commentUpdateById(@RequestParam("clubId") String clubId,
								    @RequestParam("commentId") String commentId,
								    @RequestParam("articleBody") String articleBody,
								    @RequestParam("readerId") String readerId,
								    Model m) {
		Comment comment = new Comment();
		
		if(clubId.isEmpty() || commentId.isEmpty() || articleBody.isEmpty() || readerId.isEmpty() ) {
//			應該要alert
			return "redirect:/club/CommentSearchById?id="+clubId;
		}else {
			comment.setClubId(Integer.parseInt(clubId));
			comment.setCommentId(Integer.parseInt(commentId));
			comment.setArticleBody(articleBody);
			comment.setReaderId(Integer.parseInt(readerId));
			
			Date date = new Date();
			comment.setClubDate(date);
			
			commentService.updateComment(comment);
		}
		
		return "redirect:/club/CommentSearchById?id="+clubId;
	}
	
//	刪除Comment
	@GetMapping("/CommDeleteById")
	public String commDeleteById(@RequestParam("id")String commentId, 
								 Model m) {
		Comment comment = commentService.searchById(Integer.parseInt(commentId));
		String clubId = String.valueOf(comment.getClubId());
		commentService.deleteCommById(Integer.parseInt(commentId));
		return "redirect:/club/CommentSearchById?id="+clubId;
	}
	
//	刪除Comment
	@DeleteMapping("/CommDeleteById2/{commid}")
	@ResponseBody
	public String commDeleteById2(@PathVariable("commid")int commid) throws JsonProcessingException {
		commentService.deleteCommById(commid);
		String jsonString = mapper.writeValueAsString("success"); 
		return jsonString;
	}

	
	
	
	
	
}






