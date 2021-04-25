package com.dev1.springproject.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev1.springproject.member.MemberService;
import com.dev1.springproject.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Override
	public void insert(MemberVO vo) {
		memberDAO.insert(vo);
	}
	@Override
	public MemberVO select(MemberVO vo) {
		return memberDAO.select(vo);
	}
	
	public void changeMyInfo(MemberVO vo) {
		memberDAO.changeMyInfo(vo);
	}
}
