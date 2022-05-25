package com.booksplattform.repository.book;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.book.Sponsor;


public interface SponsorRepository extends JpaRepository<Sponsor, String>{

	@Query(value = "select * from sponsor where transactionid = ?1 ", nativeQuery=true)
	public Sponsor findSponsorByTransactionId(String transactionId);
	
}
