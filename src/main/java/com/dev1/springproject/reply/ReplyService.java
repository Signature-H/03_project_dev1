package com.dev1.springproject.reply;

import java.util.List;

public interface ReplyService {
	public void writeReply(ReplyVO vo);
	public List<ReplyVO> replyList(ReplyVO vo);
	public List<Reply_likeVO> reply_likeList(Reply_likeVO vo);
	public void replyLike(ReplyVO vo);
	public void replyLikeCancle(ReplyVO vo);
	public void replyHate(ReplyVO vo);
	public void replyHateCancle(ReplyVO vo);
}
