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
	public MemberVO login(MemberVO vo) {
		return memberDAO.login(vo);
	}

	@Override
	public MemberVO myInfo(MemberVO vo) {
		return memberDAO.myInfo(vo);
	}

	@Override
	public void changeMyInfo(MemberVO vo) {
		memberDAO.changeMyInfo(vo);
	}

	@Override
	public void join(MemberVO vo) {
		memberDAO.join(vo);
	}

	@Override
	public void quit(MemberVO vo) {
		memberDAO.quit(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}
	
	@Override
	public MemberVO findPassword(MemberVO vo) {
		return memberDAO.findPassword(vo);
	}

}
