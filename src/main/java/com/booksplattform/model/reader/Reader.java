package com.booksplattform.model.reader;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.springframework.stereotype.Component;

@Entity @Table(name = "reader")
@Component
public class Reader {
	
	@Id @Column(name = "READERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int readerId;
	
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "REGISTERDATE")
	private String registerDate;

	@Column(name = "FULLNAME")
	private String fullName;

	@Column(name = "NICKNAME")
	private String nickName;

	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "PHONE")
	private String phone;

	@Column(name = "BIRTH")
	private String birth;

	@Column(name = "READERLEVEL")
	@ColumnDefault(value = "1")
	private int readerLevel = 1;

	@Column(name = "READERCOIN")
	@ColumnDefault(value = "0")
	private int readerCoin = 0;

	@Column(name = "AUTHORITY")
	@ColumnDefault(value = "2")
	private int authority = 2;

	@Column(name = "PASSWORD")
	private String password;
	
	@Lob
	@Column(name = "PHOTO")
	private byte[] photo;

	public int getReaderId() {
		return readerId;
	}

	public void setReaderId(int readerId) {
		this.readerId = readerId;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getReaderLevel() {
		return readerLevel;
	}

	public void setReaderLevel(int readerLevel) {
		this.readerLevel = readerLevel;
	}

	public int getReaderCoin() {
		return readerCoin;
	}

	public void setReaderCoin(int readerCoin) {
		this.readerCoin = readerCoin;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	
	
	
}
