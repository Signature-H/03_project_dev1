package com.dev1.springproject.reply.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev1.springproject.reply.ReplyService;
import com.dev1.springproject.reply.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public void writeReply(ReplyVO vo) {
		replyDAO.writeReply(vo);
	}
}
