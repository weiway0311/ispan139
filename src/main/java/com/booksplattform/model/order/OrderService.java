package com.booksplattform.model.order;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.booksplattform.model.book.Book;
import com.booksplattform.model.reader.Reader;
import com.booksplattform.repository.order.OrderRepository;

@Service
@Transactional
public class OrderService {
	
	@Autowired
	private OrderRepository oResp;
	
	//查全部，訂單主頁
	public List<Order> findAll(){
		return oResp.findAll();
	}
	
	//Id查詢
	public Order findById(String id) {
		Optional<Order> op1 = oResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	// 會員查詢訂單
	public List<Order> findOrderByCustId(int custId) {
//		System.out.println("-------------"+oResp.findOrderByCustId(custId));
		 return oResp.findOrderByCustId(custId);
	}
	
	//模糊查詢
	public List<Order> findOrderByKeyword(String keyword) {
		return oResp.findOrderByKeyword(keyword);
	}
		
	//根據狀態查詢
	public List<Order> findByStatus(String status) {
			return oResp.findByStatus(status);	
	}
	
	//查詢(for Chart)
	public List<Order> findByStatusList(String status) {
		List<Order> oStatus = oResp.findByStatusList(status);
		return oStatus;
	}
	
	//訂單新增
	public Order insert(Order oBean) {
		return oResp.save(oBean);
	}
	
	//訂單狀態修改
	public Order update(Order oBean) {
		return oResp.save(oBean);
	}
	
	// 分頁
	public Page<Order> findAllByPage(Pageable pageable) {
		return oResp.findAll(pageable);
	}
		
//	//訂單刪除
//	public void deleteById(Integer id) {
//		oResp.deleteById(id);
//	}
		
}
