package com.booksplattform.repository.book;

import org.springframework.data.jpa.repository.JpaRepository;

import com.booksplattform.model.book.BDetail;

public interface BDetailRepository extends JpaRepository<BDetail, Integer> {

}
