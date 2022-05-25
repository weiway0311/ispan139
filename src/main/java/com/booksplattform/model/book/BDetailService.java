package com.booksplattform.model.book;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booksplattform.repository.book.BDetailRepository;


@Service
@Transactional
public class BDetailService {

	
	@Autowired
	private BDetailRepository bDetailRepository;
	
	public List<BDetail> findAll(){
		return bDetailRepository.findAll();
	}
	
//	public List<BDetail> findByName(String name){
//		return bDetailRepository.findByName(name);
//	}
	
//	public Book findById(Integer booksid){
//		Optional<Book> book = bDetailRepository.findById(booksid);
//		return book.get();
//	}
	
	public BDetail updateById(BDetail bDetail){
		return bDetailRepository.save(bDetail);
	}
	
	public List<BDetail> addBDetails(Set<BDetail> bDetails){
		return bDetailRepository.saveAll(bDetails);
	}
}
