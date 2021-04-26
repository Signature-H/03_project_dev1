package com.dev1.springproject.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.member.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public MemberVO login(MemberVO vo) {
		System.out.println("==> Call login() method to mybatis");
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}
	
	public MemberVO myInfo(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.myInfo", vo);
	}

	public void changeMyInfo(MemberVO vo) {
		System.out.println("==> Call changeMyInfo() method to mybatis");
		mybatis.update("MemberDAO.changeMyInfo", vo);
	}

	public void join(MemberVO vo) {
		System.out.println("==> Call join() method to mybatis");
		mybatis.insert("MemberDAO.join", vo);

	}
}
