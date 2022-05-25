package com.booksplattform.repository.club;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.club.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
//	@Query(value = "select * From Comment where clubId = ?1 ORDER BY clubDate DESC", nativeQuery = true)
	@Query(value = "From Comment where clubId = ?1")
	public List<Comment> searchAllComms(int clubid);
	
}
