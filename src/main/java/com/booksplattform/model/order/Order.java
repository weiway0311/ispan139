package com.booksplattform.model.order;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="orders")
@Component
public class Order implements Serializable{

	@Id
	@Column(name = "OID")
	private String oId;
	
	@Column(name = "ODATE")
	private Date oDate;
	
	@Column(name = "CUSTID")
	private int custId;
	
	@Column(name = "TOTAL")
	private int total;
	
	@Column(name = "STATUS")
	private String status;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "OID")
	private Set<Details> details = new HashSet<>();
	
	public String getoId() {
		return oId;
	}

	public void setoId(String oId) {
		this.oId = oId;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<Details> getDetails() {
		return details;
	}

	public void setDetails(Set<Details> details) {
		this.details = details;
	}

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", oDate=" + oDate + ", custId=" + custId + ", total=" + total + ", status="
				+ status + ", details=" + details + "]";
	}

}