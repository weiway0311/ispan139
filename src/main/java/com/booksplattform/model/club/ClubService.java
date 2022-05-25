package com.booksplattform.model.club;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.repository.club.ClubRepository;

@Service
@Transactional
public class ClubService {
	
	@Autowired
	private ClubRepository clubRepo;
	
	public Club addClub(Club club) {
		return clubRepo.save(club);
	}
	
	public Club updateClub(Club club) {
		return clubRepo.save(club);
	}
	
	public void deleteClubById(Integer clubid) {
		clubRepo.deleteById(clubid);
	}
	
	public Club searchById(Integer clubid) {
		Optional<Club> optional = clubRepo.findById(clubid);
		if(optional.isPresent()) {
			return optional.get();
		}
		return null;
	}

	public List<Club> searchClubByKeyword(String keyword){
		return clubRepo.searchClubByKeyword(keyword);
	}
	
	public Page<Club> searchAllClubs(Pageable pageable){
		return clubRepo.searchAllClubs(pageable);
	}
	
	public List<Club> findByClubclass(String clubclass){
		return clubRepo.findbyClubclass(clubclass);
	}
	
	public List<Club> findallClubs(){
		return clubRepo.findAll();
	}
	
	public List<Club> findByReaderId(Integer readerId){
		return clubRepo.findbyreaderId(readerId);
	}
	
	
	
	
	
}
