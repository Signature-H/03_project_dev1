package com.dev1.springproject.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.member.MemberVO;
@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insert(MemberVO vo) {
		System.out.println("==> Call insert() method to mybatis");
		mybatis.insert("MemberDAO.insertMember",vo);

	}
	public MemberVO select(MemberVO vo) {
		System.out.println("==> Call select() method to mybatis");
		return (MemberVO)mybatis.selectOne("MemberDAO.selectMember",vo);
	}
	public void changeMyInfo(MemberVO vo) {
		System.out.println("==> Call changeMyInfo() method to mybatis");
		mybatis.update("MemberDAO.changeMyInfo",vo);
	}
}
