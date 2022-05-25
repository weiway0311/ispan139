package com.booksplattform.model.book;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Component;

@Entity
@Table(name="bookfinal")
@Component
public class Book implements java.io.Serializable{
	@Id @Column(name="booksid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer booksId;
	
	//對應資料庫col不能駝峰命名否則 Spring JPA轉意時候會出錯 找不到欄位
	@Column(name="booksname")
	private String booksName;
	
	@Column(name="booksvarieties")
	private String booksVarieties;
	
	@Column(name="publishername")
	private String publisherName;
	
	@Column(name="bookimgsurl")
	private String bookimgsurl;
	
	@Column(name="bookdescribe")
	private String bookDescribe;

	@Column(name="isbn")
	private String isbn;
	
	@Column(name="publishdate")
	private Date publishDate;
	
	@Column(name="authorname")
	private String authorName;
	
	@Column(name="authorinfo")
	private String authorInfo;
	
	@Column(name="providerid")
	private int providerId;  //FK
	
	@Column(name="price")
	private int price;
	
	@Column(name="quantity")
	private int quantity;
	
	@Transient
	private Timestamp uploadDate;
	
	public Book() {}
	
	public Book(String bookimgsurl) {
		this.bookimgsurl = bookimgsurl;
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

	public String getBooksVarieties() {
		return booksVarieties;
	}

	public void setBooksVarieties(String booksVarieties) {
		this.booksVarieties = booksVarieties;
	}

	public String getPublisherName() {
		return publisherName;
	}

	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	public String getBookimgsurl() {
		return bookimgsurl;
	}

	public void setBookimgsurl(String bookimgsurl) {
		this.bookimgsurl = bookimgsurl;
	}
	
	

	public String getBookDescribe() {
		return bookDescribe;
	}

	public void setBookDescribe(String bookDescribe) {
		this.bookDescribe = bookDescribe;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorInfo() {
		return authorInfo;
	}

	public void setAuthorInfo(String authorInf) {
		this.authorInfo = authorInf;
	}

	public int getProviderId() {
		return providerId; 
	}

	public void setProviderId(int providerId) {
		this.providerId = providerId;
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

	public Timestamp getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Timestamp uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "Book [booksId=" + booksId + ", booksName=" + booksName + ", booksVarieties=" + booksVarieties
				+ ", publisherName=" + publisherName + ", bookimgsurl=" + bookimgsurl + ", bookDescribe=" + bookDescribe
				+ ", isbn=" + isbn + ", publishDate=" + publishDate + ", authorName=" + authorName + ", authorInfo="
				+ authorInfo + ", providerId=" + providerId + ", price=" + price + ", quantity=" + quantity
				+ ", uploadDate=" + uploadDate + "]";
	}


	
	



}
