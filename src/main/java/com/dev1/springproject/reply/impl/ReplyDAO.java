package com.dev1.springproject.reply.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.reply.ReplyVO;
import com.dev1.springproject.reply.Reply_likeVO;

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
		return mybatis.selectList("ReplyDAO.replyList", vo);
	}
	public List<Reply_likeVO> reply_likeList(Reply_likeVO vo) {
		return mybatis.selectList("ReplyDAO.reply_likeList", vo);
	}
	
	// replyLike.do
	public void replyLike(Reply_likeVO vo) {
		mybatis.update("ReplyDAO.replyLike_seq", vo);
		mybatis.insert("ReplyDAO.replyLike", vo);
	}
	
	// replyLikeCancle.do
	public void replyLikeCancle(Reply_likeVO vo) {
		mybatis.update("ReplyDAO.replyLikeCancle_seq", vo);
		mybatis.insert("ReplyDAO.replyLikeCancle", vo);
	}
	
	// replyHate.do
	public void replyHate(Reply_likeVO vo) {
		mybatis.update("ReplyDAO.replyHate_seq", vo);
		mybatis.insert("ReplyDAO.replyHate", vo);
	}
	
	// replyLikeCancle.do
	public void replyHateCancle(Reply_likeVO vo) {
		mybatis.update("ReplyDAO.replyHateCancle_seq", vo);
		mybatis.insert("ReplyDAO.replyHateCancle", vo);
	}

}
