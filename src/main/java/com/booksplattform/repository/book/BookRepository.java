package com.booksplattform.repository.book;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.booksplattform.model.book.Book;

@Transactional
public interface BookRepository extends JpaRepository<Book, Integer> {
	
	@Query(value = "select * from bookfinal where booksname like %"+"?1"+"%", nativeQuery=true)
	List<Book> findByName(String name);
	
	List<Book> findByPublishDateBetween(Date publishDateStart, Date publishDateEnd);

}
