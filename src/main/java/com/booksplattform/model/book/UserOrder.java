package com.booksplattform.model.book;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

//購物車用

@Component
public class UserOrder implements java.io.Serializable{
	
	private Map<Integer,BDetail> bDetails;
	
	private int custId;
	
	private int sum;  //訂單總額



	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}



	public Map<Integer, BDetail> getbDetails() {
		return bDetails;
	}

	public void setbDetails(Map<Integer, BDetail> bDetails) {
		this.bDetails = bDetails;
	}

	@Override
	public String toString() {
		return "UserOrder [custId=" + custId + ", sum=" + sum + "]";
	}


	
	
}
