package com.dev1.springproject.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	// ID
	private String id;
	// NAME
	private String name;
	// PASSWORD
	private String password;
	// REGDATE
	private Date regDate;
	// EMAIL
	private String email;
	// BIRTHDAY
	private String birthday;
	// PHONENUMBER
	private String phoneNumber;
	// ADRESS1
	private String address1;
	// ADRESS2
	private String address2;
	// ZIPCODE
	private String zipcode;
	// MANAGER
	private char manager;
	// PATH
	private String path;
	//UPLOADFILE
	private MultipartFile uploadFile; 
 

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public char getManager() {
		return manager;
	}

	public void setManager(char manager) {
		this.manager = manager;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


	@Override
	public String toString() {
		return "MemberVO[id : " + id + " | password : " + password + " | name : " + name + " | regDate : " + regDate +
				" | phoneNumber : " + phoneNumber + " | birthday : " + birthday + " | address1 : " + address1 + " | address2 : " + address2 +
				" | zipcode : " + zipcode + " | manager : " + manager + " | path : " + path + " | email : " + email + "]";
	}
	
	
}
