package com.booksplattform.model.club;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "club")
@Component
public class Club {
	
	@Id @Column(name = "CLUBID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int clubId;
	
	@Column(name = "CLUBCLASS")
	private String clubclass;
	
	@Column(name = "CLUBDATE")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "GMT+8")
	private Date clubDate;
	
	@Column(name = "ARTICLEHEADER")
	private String articleHeader;
	
	@Column(name = "ARTICLEBODY")
	private String articleBody;
	
	@Column(name = "CLUBIMG")
	private String clubImg;
	
	@Column(name = "READERID")
	private int readerId;

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public String getClubclass() {
		return clubclass;
	}

	public void setClubclass(String clubclass) {
		this.clubclass = clubclass;
	}

	public Date getClubDate() {
		return clubDate;
	}

	public void setClubDate(Date clubDate) {
		this.clubDate = clubDate;
	}

	public String getArticleHeader() {
		return articleHeader;
	}

	public void setArticleHeader(String articleHeader) {
		this.articleHeader = articleHeader;
	}

	public String getArticleBody() {
		return articleBody;
	}

	public void setArticleBody(String articleBody) {
		this.articleBody = articleBody;
	}

	public String getClubImg() {
		return clubImg;
	}

	public void setClubImg(String clubImg) {
		this.clubImg = clubImg;
	}

	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}

	

	
	
	
	
	
}
