package com.booksplattform.model.book;

public class LinePayEntity implements java.io.Serializable{
	
	private Integer amount;
	private String productName;
	private String productImageUrl;
	private String confirmUrl;
	private String orderId;
	private String currency;
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductImageUrl() {
		return productImageUrl;
	}
	public void setProductImageUrl(String productImageUrl) {
		this.productImageUrl = productImageUrl;
	}
	public String getConfirmUrl() {
		return confirmUrl;
	}
	public void setConfirmUrl(String confirmUrl) {
		this.confirmUrl = confirmUrl;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	@Override
	public String toString() {
		return "LinePayEntity [amount=" + amount + ", productName=" + productName + ", productImageUrl="
				+ productImageUrl + ", confirmUrl=" + confirmUrl + ", orderId=" + orderId + ", currency=" + currency
				+ "]";
	}
	
	
}
