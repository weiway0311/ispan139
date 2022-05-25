package com.booksplattform.model.club;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.repository.club.CommentRepository;

@Service
@Transactional
public class CommentService {
	
	@Autowired
	private CommentRepository commRepo;
	
	public Comment addComment(Comment comment) {
		return commRepo.save(comment);
	}
	
	public Comment updateComment(Comment comment) {
		return commRepo.save(comment);
	}
	
	public void deleteCommById(Integer commentid) {
		commRepo.deleteById(commentid);
	}
	
	public Comment searchById(Integer commentid) {
		Optional<Comment> optional = commRepo.findById(commentid);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public List<Comment> searchAllComms(int clubid){
		List<Comment> searchAllComms = commRepo.searchAllComms(clubid);
		return searchAllComms;
		
//		Optional<List<Comment>> optional = Optional.of(commRepo.searchAllComms(clubid));
//		if(optional.isPresent()) {
//			return optional.get();
//		}
//		return null;
	}
	
	
	
	
	
}
