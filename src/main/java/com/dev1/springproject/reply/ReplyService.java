package com.dev1.springproject.reply;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	public void writeReply(ReplyVO vo);
	public List<ReplyVO> replyList(ReplyVO vo);
	public List<Reply_likeVO> reply_likeList(Reply_likeVO vo);
	public void replyLike(Map<String, Object> data);
	public void replyLikeCancle(Map<String, Object> data);
	public void replyHate(Map<String, Object> data);
	public void replyHateCancle(Map<String, Object> data);
}
