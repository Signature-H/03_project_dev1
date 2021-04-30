package com.dev1.springproject.reply;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	public void writeReply(ReplyVO vo);
	public List<ReplyVO> replyList(ReplyVO vo);
	public List<Reply_likeVO> reply_likeList(Reply_likeVO vo);
	public void replyLike(Reply_likeVO vo);
	public void replyLikeCancle(Reply_likeVO vo);
	public void replyHate(Reply_likeVO vo);
	public void replyHateCancle(Reply_likeVO vo);
}
