package com.booksplattform.model.book;

public class LinePayConfirmation implements java.io.Serializable{
	private Integer amount;
	private String currency;
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	
	public LinePayConfirmation() {};
	
	public LinePayConfirmation(Integer amount, String currency) {
		this.amount = amount;
		this.currency = currency;
	}
	
	
}
