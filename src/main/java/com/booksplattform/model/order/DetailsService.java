package com.booksplattform.model.order;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.repository.order.DetailsRepository;

@Service
@Transactional
public class DetailsService {

	@Autowired
	private DetailsRepository dResp;

	// Id查詢
	public Details findByOid(String id) {
		return dResp.findByOid(id);	
	}

	// 詳情新增
	public Details insert(Details dBean) {
		return dResp.save(dBean);
	}
	
//	// 詳情刪除
//	public void deleteById(Integer id) {
//		dResp.deleteById(id);
//	}

}
