package com.dev1.springproject.auth;

import com.dev1.springproject.member.MemberVO;

public class AuthMemberVO extends MemberVO{

	private String id;
	private String name;
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
	
}
