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

@Entity @Table(name = "clubreport")
@Component
public class Creport {
	
	@Id @Column(name = "REPORTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int reportId;
	
	@Column(name = "CLUBID")
	private int clubId;
	
	@Column(name = "COMMENTID")
	private int commentId;
	
	@Column(name = "REPORTDATE")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "GMT+8")
	private Date reportDate;
	
	@Column(name = "REPORTWHO")
	private String reportWho;
	
	@Column(name = "REPORTARTCLE")
	private String reportartcle;
	
	@Column(name = "ARTICLEBODY")
	private String articleBody;

	public int getReportId() {
		return reportId;
	}

	public void setReportId(int reportId) {
		this.reportId = reportId;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportWho() {
		return reportWho;
	}

	public void setReportWho(String reportWho) {
		this.reportWho = reportWho;
	}

	public String getReportartcle() {
		return reportartcle;
	}

	public void setReportartcle(String reportartcle) {
		this.reportartcle = reportartcle;
	}

	public String getArticleBody() {
		return articleBody;
	}

	public void setArticleBody(String articleBody) {
		this.articleBody = articleBody;
	}
	
	
	
}
