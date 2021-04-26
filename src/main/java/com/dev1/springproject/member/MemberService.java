package com.dev1.springproject.member;

public interface MemberService {
	public MemberVO login(MemberVO vo);
	public MemberVO myInfo(MemberVO vo);
	public void changeMyInfo(MemberVO vo);
	public void join(MemberVO vo);
	public void quit(MemberVO vo);
}
