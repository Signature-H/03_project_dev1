package com.dev1.springproject.member;

public interface MemberService {
	public void insert(MemberVO vo);
	public MemberVO select(MemberVO vo);
	public void changeMyInfo(MemberVO vo);
}
