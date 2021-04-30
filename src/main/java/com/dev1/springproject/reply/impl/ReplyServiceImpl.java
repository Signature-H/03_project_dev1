package com.dev1.springproject.reply.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev1.springproject.reply.ReplyService;
import com.dev1.springproject.reply.ReplyVO;
import com.dev1.springproject.reply.Reply_likeVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public void writeReply(ReplyVO vo) {
		replyDAO.writeReply(vo);
	}

	@Override
	public List<ReplyVO> replyList(ReplyVO vo) {
		return replyDAO.replyList(vo);
	}
	
	@Override
	public List<Reply_likeVO> reply_likeList(Reply_likeVO vo) {
		return replyDAO.reply_likeList(vo);
	}

	@Override
	public void replyLike(Reply_likeVO vo) {
		replyDAO.replyLike(vo);
	}

	@Override
	public void replyLikeCancle(Reply_likeVO vo) {
		replyDAO.replyLikeCancle(vo);
	}

	@Override
	public void replyHate(Reply_likeVO vo) {
		replyDAO.replyHate(vo);
	}

	@Override
	public void replyHateCancle(Reply_likeVO vo) {
		replyDAO.replyHateCancle(vo);
	}
	
	
}
