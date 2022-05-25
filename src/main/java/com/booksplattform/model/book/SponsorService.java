package com.booksplattform.model.book;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booksplattform.repository.book.SponsorRepository;

@Service
@Transactional
public class SponsorService {

	
	@Autowired
	private SponsorRepository sri;
	
	public Sponsor addOrUpdateSponsor(Sponsor sponsor) {
		return sri.save(sponsor);
	}
	
	public Sponsor findSponsorByUuid(String uuid) {
		return sri.findById(uuid).get();
	}
	
	public Sponsor findSponsorByTransactionId(String transactionId) {
		return sri.findSponsorByTransactionId(transactionId);
	}
	
}
