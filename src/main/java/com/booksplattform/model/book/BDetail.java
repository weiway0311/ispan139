package com.booksplattform.model.book;

import javax.persistence.*;

import org.springframework.stereotype.Component;

@Entity
@Table(name="bdetail")
@Component
public class BDetail implements java.io.Serializable{
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="bdid")
	private Integer bdId;
	
//	@Column(name="boid")
//	private Integer boId;
	
	@Column(name="custid")
	private Integer custId;
	
	@Column(name="booksid")
	private Integer booksId;
	
	@Column(name="booksname")
	private String booksName;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="quantity")
	private Integer quantity;
	
	@Column(name="itemtotal")
	private Integer itemTotal;
	

	@Column(name="status")
	private String status;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "boid") 
	private BOrder bOrder;
	
	public BDetail() {}

	public BDetail(Integer custId, Integer booksId, String booksName, Integer price, Integer quantity,
			Integer itemTotal) {
		this.custId = custId;
		this.booksId = booksId;
		this.booksName = booksName;
		this.quantity = quantity;
		this.price = price;
		this.itemTotal = itemTotal;
	}

	public Integer getBdId() {
		return bdId;
	}

	public void setBdId(Integer bdId) {
		this.bdId = bdId;
	}

//	public Integer getBoId() {
//		return boId;
//	}
//
//	public void setBoId(Integer boId) {
//		this.boId = boId;
//	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public Integer getBooksId() {
		return booksId;
	}

	public void setBooksId(Integer booksId) {
		this.booksId = booksId;
	}

	public String getBooksName() {
		return booksName;
	}

	public void setBooksName(String booksName) {
		this.booksName = booksName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(Integer itemTotal) {
		this.itemTotal = itemTotal;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BOrder getbOrder() {
		return bOrder;
	}

	public void setbOrder(BOrder bOrder) {
		this.bOrder = bOrder;
	}

	@Override
	public String toString() {
		return "BDetail [bdId=" + bdId +  ", custId=" + custId + ", booksId=" + booksId
				+ ", booksName=" + booksName + ", price=" + price + ", quantity=" + quantity + ", itemTotal="
				+ itemTotal + ", status=" + status + "]";
	}
	
	
	
	
	
	
}
