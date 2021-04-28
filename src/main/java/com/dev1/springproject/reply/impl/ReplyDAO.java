package com.dev1.springproject.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.reply.ReplyVO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// writeReply.do
	public void writeReply(ReplyVO vo) {
		mybatis.update("ReplyDAO.reply_cnt_seq", vo);
		mybatis.insert("ReplyDAO.writeReply", vo);
	}
	
	// replyList.do
	public List<ReplyVO> replyList(ReplyVO vo) {
		System.out.println("DAO: "+vo.getArticle_no());
		return mybatis.selectList("ReplyDAO.replyList", vo);
	}

}
