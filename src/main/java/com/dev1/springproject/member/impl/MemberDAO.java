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
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}

	public MemberVO myInfo(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.myInfo", vo);
	}

	public void changeMyInfo(MemberVO vo) {
		mybatis.update("MemberDAO.changeMyInfo", vo);
	}

	public void join(MemberVO vo) {
		mybatis.insert("MemberDAO.join", vo);

	}

	public void quit(MemberVO vo) {
		mybatis.delete("MemberDAO.quit", vo);
	}
	public MemberVO findId(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findId", vo);
	}
	public MemberVO findPassword(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.findPassword", vo);
	}


}
