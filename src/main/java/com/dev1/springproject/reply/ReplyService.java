package com.dev1.springproject.reply;

import java.util.List;

public interface ReplyService {
	public void writeReply(ReplyVO vo);
	public List<ReplyVO> replyList(ReplyVO vo);
}
