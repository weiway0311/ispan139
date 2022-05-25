package com.booksplattform.model.club;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.repository.club.CreportRepository;

@Service
@Transactional
public class CreportService {
	
	@Autowired
	private CreportRepository creportRepo;
	
	public Creport addCreport(Creport creport) {
		return creportRepo.save(creport);
	}
	
	public Creport updateCreport(Creport creport) {
		return creportRepo.save(creport);
	}
	
	public void deleteCrepoById(Integer creportId) {
		creportRepo.deleteById(creportId);
	}
	
	public List<Creport> searchAllCrepo(){
		return creportRepo.searchAllCreports();
	}
	
	
	
	
	
	
	
	
	
}
