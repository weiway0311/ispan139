package com.booksplattform.model.book;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
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

import org.hibernate.engine.internal.Cascade;
import org.springframework.stereotype.Component;

@Entity
@Table(name="border")
@Component
public class BOrder implements java.io.Serializable{
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "boid")
	private int boId;
	
	@Column(name = "ODATE")
	private Date oDate;
	
	@Column(name = "CUSTID")
	private int custId;
	
	@Column(name = "TOTAL")
	private int total;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "boid")
	private Set<BDetail> bDetails = new HashSet<>();


	public int getBoId() {
		return boId;
	}


	public void setBoId(int boId) {
		this.boId = boId;
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


	public Set<BDetail> getbDetails() {
		return bDetails;
	}


	public void setbDetails(Set<BDetail> bDetails) {
		this.bDetails = bDetails;
	}


	@Override
	public String toString() {
		return "BOrder [boId=" + boId + ", oDate=" + oDate + ", custId=" + custId + ", total=" + total + "]";
	}
	
	

}
