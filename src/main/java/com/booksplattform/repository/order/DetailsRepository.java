package com.booksplattform.repository.order;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.order.Details;


public interface DetailsRepository extends JpaRepository<Details, Integer> {
	
	@Query(value = "select * from Details where oid = ?1", nativeQuery=true)
	Details findByOid(String oid);

}
