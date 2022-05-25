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

@Entity @Table(name = "comment")
@Component
public class Comment {
	
	@Id @Column(name = "COMMENTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int commentId;
	
	@Column(name = "CLUBID")
	private int clubId;
	
	@Column(name = "CLUBDATE")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "GMT+8")
	private Date clubDate;
	
	@Column(name = "ARTICLEBODY")
	private String articleBody;
	
	@Column(name = "READERID")
	private int readerId;

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public Date getClubDate() {
		return clubDate;
	}

	public void setClubDate(Date clubDate) {
		this.clubDate = clubDate;
	}

	public String getArticleBody() {
		return articleBody;
	}

	public void setArticleBody(String articleBody) {
		this.articleBody = articleBody;
	}

	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}
	
	
	
	
	
}
