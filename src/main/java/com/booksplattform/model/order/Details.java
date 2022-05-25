package com.booksplattform.model.order;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;


@Entity
@Table(name="details")
@Component
public class Details implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DID")
	private int dId;
	
//	@Column(name = "OID")
	@Transient
	private String oId;
	
	@Column(name = "BOOKSID")
	private int booksId;
	
	@Column(name = "BOOKSNAME")
	private String booksName;
	
	@Column(name = "PRICE")
	private int price;
	
	@Column(name = "QUANTITY")
	private int quantity;
	
	@Column(name = "ITEMTOTAL")
	private int itemTotal;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "OID")
	private Order order;
	
	public Details() {
	}

	public Details(int booksId, String booksName, int price, int quantity, int itemTotal) {
		super();
		this.booksId = booksId;
		this.booksName = booksName;
		this.price = price;
		this.quantity = quantity;
		this.itemTotal = itemTotal;
	}
	
	public int getdId() {
		return dId;
	}
	
	public void setdId(int dId) {
		this.dId = dId;
	}

	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public int getBooksId() {
		return booksId;
	}

	public void setBooksId(int booksId) {
		this.booksId = booksId;
	}

	public String getBooksName() {
		return booksName;
	}

	public void setBooksName(String booksName) {
		this.booksName = booksName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getItemTotal() {
		return itemTotal;
	}

	public void setItemTotal(int itemTotal) {
		this.itemTotal = itemTotal;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "Details [dId=" + dId + ", oId=" + oId + ", booksId=" + booksId + ", booksName=" + booksName + ", price="
				+ price + ", quantity=" + quantity + ", itemTotal=" + itemTotal + "]";
	}
	
}
	
