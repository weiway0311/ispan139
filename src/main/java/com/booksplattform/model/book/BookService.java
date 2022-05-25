package com.booksplattform.model.book;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.booksplattform.repository.book.BookRepository;

@Service
@Transactional
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	public List<Book> findAll(){
		return bookRepository.findAll();
	}
	
	public List<Book> findByName(String name){
		return bookRepository.findByName(name);
	}
	
	public Book findById(Integer booksid){
		Optional<Book> book = bookRepository.findById(booksid);
		return book.get();
	}
	
	public Book updateById(Book book){
		return bookRepository.save(book);
	}
	
	public Book addBook(Book book){
		return bookRepository.save(book);
	}
	
	public Book deleteBook(Integer id){
		Optional<Book> book = bookRepository.findById(id);
		if(book.isPresent()) {
			Book currBook = book.get();
			bookRepository.delete(currBook);
			return currBook;
		}
		return null;
	}
	
	//分頁面
	public Page<Book> findAllByPage(Pageable pageable){
		return bookRepository.findAll(pageable);
	}
	
	public List<Book> findByPublishDateBetween(Date publishDateStart, Date publishDateEnd){
		return bookRepository.findByPublishDateBetween(publishDateStart, publishDateEnd);
	}

}
