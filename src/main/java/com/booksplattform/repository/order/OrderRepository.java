package com.booksplattform.repository.order;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.booksplattform.model.order.Order;

public interface OrderRepository extends JpaRepository<Order, String> {
	
	//根據書友帳號查詢
	@Query(value = "from Order where custId = ?1")
	public List<Order> findOrderByCustId(int custId);
	
	//根據狀態查詢
	@Query(value = "from Order where status = ?1")
	public List<Order> findByStatus(String status);
	
	//圖表查詢
	@Query(value = "select * from Orders where status = ?1", nativeQuery=true)
	public List<Order> findByStatusList(String status);
	
	//訂單主頁根據時間排序
	@Query(value = "from Order Order By oDate DESC")
	public List<Order> findAll();

	//關鍵字查詢
	@Query(value = "from Order where oid like concat('%',?1,'%') or custId like concat('%',?1,'%')")
	public List<Order> findOrderByKeyword(String keyword);

}
