package com.booksplattform.repository.club;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.club.Creport;

public interface CreportRepository extends JpaRepository<Creport, Integer> {

	
	@Query(value = "select * From Clubreport ORDER BY reportDate DESC", nativeQuery = true)
	public List<Creport> searchAllCreports();
}
