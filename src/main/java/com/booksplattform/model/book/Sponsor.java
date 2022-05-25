package com.booksplattform.model.book;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="sponsor")
@Component
public class Sponsor {

	@Id 
	@Column(name="uuid")
	private String uuId;
	
	@Column(name="transactionid")
	private String transactionId;
	
	@Column(name="amount")
	private Integer amount;
	
	@Column(name="status")
	private String status;
	
	@Column(name="custid")
	private Integer custId;
	
	
	public Sponsor() {}

	public Sponsor(String uuId, String transactionId) {
		super();
		this.uuId = uuId;
		this.transactionId = transactionId;
	}

	public String getUuId() {
		return uuId;
	}

	public void setUuId(String uuId) {
		this.uuId = uuId;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	@Override
	public String toString() {
		return "Sponsor [uuId=" + uuId + ", transactionId=" + transactionId + ", amount=" + amount + ", status="
				+ status + ", custId=" + custId + "]";
	}
	
	
	
}
