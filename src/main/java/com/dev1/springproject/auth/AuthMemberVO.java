package com.dev1.springproject.auth;

public class AuthMemberVO {

	private String id;
	private String name;
	private char manager;
	
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
	public char getManager() {
		return manager;
	}
	public void setManager(char manager) {
		this.manager = manager;
	}
	
}
