package com.booksplattform.repository.club;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.club.Club;


public interface ClubRepository extends JpaRepository<Club, Integer> {
	
	@Query(value = "select * From Club ORDER BY clubDate DESC", nativeQuery = true)
	public Page<Club> searchAllClubs(Pageable pageable);
	
	
	
	
	@Query(value = "Select * from club where clubId like concat('%',?1,'%')"
							  + " or clubClass like concat('%',?1,'%')"
//							  + " or clubDate like concat('%',?1,'%')"
							  + " or articleHeader like concat('%',?1,'%')"
//							  + " or articleBody like concat('%',?1,'%')"
							  +" ORDER BY clubDate DESC", nativeQuery = true)
	public List<Club> searchClubByKeyword(String keyword);
	
	
	@Query(value = "Select * from club where clubClass like concat('%',?1,'%')", nativeQuery = true)
	public List<Club> findbyClubclass(String clubclass);
	
	@Query(value = "Select * from club where readerId like concat('%',?1,'%')", nativeQuery = true)
	public List<Club> findbyreaderId(Integer readerId);
	
}
