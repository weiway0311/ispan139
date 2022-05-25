package com.booksplattform.model.book;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.booksplattform.repository.book.BookSroreRepository;


@Service
@Transactional
public class BookStoreService {
	
	@Autowired
	private BookSroreRepository bookSroreRepository;
	
	public List<Book> findAll(){
		return bookSroreRepository.findAll();
	}
	
	public List<Book> findByName(String name){
		return bookSroreRepository.findByName(name);
	}
	
	public Book findById(Integer booksid){
		Optional<Book> book = bookSroreRepository.findById(booksid);
		return book.get();
	}
	
	public Book updateById(Book book){
		return bookSroreRepository.save(book);
	}
	
	public Book addBook(Book book){
		return bookSroreRepository.save(book);
	}
	
	public Book deleteBook(Integer id){
		Optional<Book> book = bookSroreRepository.findById(id);
		if(book.isPresent()) {
			Book currBook = book.get();
			bookSroreRepository.delete(currBook);
			return currBook;
		}
		return null;
	}
	
	//分頁面
	public Page<Book> findAllByPage(Pageable pageable){
		return bookSroreRepository.findAll(pageable);
	}
	
	public List<Book> findByBooksVarieties(String key){
		return bookSroreRepository.findByBooksVarieties(key);
	}

}
