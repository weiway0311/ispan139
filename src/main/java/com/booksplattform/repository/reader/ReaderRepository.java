package com.booksplattform.repository.reader;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.reader.Reader;

public interface ReaderRepository extends JpaRepository<Reader, Integer> {
	
	public Reader findByEmail(String email);
	
	@Query(value = "from Reader where fullName like concat('%',?1,'%') or email like concat('%',?1,'%') or readerId like concat('%',?1,'%')")
	public List<Reader> findReaderByKeyword(String keyword);
	
	public List<Reader> findByGender(String gender);
	
	public List<Reader> findByBirthBetween(String birthStart, String birthEnd);
	
}
