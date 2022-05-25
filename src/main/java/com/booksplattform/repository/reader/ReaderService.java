package com.booksplattform.repository.reader;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.booksplattform.exception.UserNotFoundException;
import com.booksplattform.model.reader.Reader;

@Service
@Transactional
public class ReaderService {
	
	@Autowired
	private ReaderRepository rRepo;
	
	public Reader findReaderByEmail(String email) {
		Reader result = rRepo.findByEmail(email);
		if(result == null) {
//			throw new UserNotFoundException("Reader Not Found.");
			return null;
		}
		return result;
	}
	
	public List<Reader> findAllReader(){
		return rRepo.findAll();
	}
	
	public Reader findReaderById(Integer id) {
		Optional<Reader> optional = rRepo.findById(id);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}
	
	public List<Reader> findReaderByKeyword(String keyword) {
		return rRepo.findReaderByKeyword(keyword);
	}
	
	// 分頁(全部)
	public Page<Reader>	findAllReaderByPage(Pageable pageable){
		return rRepo.findAll(pageable);
	}
	
	public Reader addReader(Reader reader) {
		return rRepo.save(reader);
	}
	
	// 修改資料 & 修改密碼整合在一起?
	public Reader updateReader(Reader reader) {
		return rRepo.save(reader);
	}
	
	public void deleteReader(Integer id) {
		rRepo.deleteById(id);
	}
	
	// chart 性別
	public List<Reader> findByGender(String gender) {
		return rRepo.findByGender(gender);
	}
	
	// chart 年齡
	public List<Reader> findByBirthBetween(String birthStart, String birthEnd){
		return rRepo.findByBirthBetween(birthStart, birthEnd);
	}

}
