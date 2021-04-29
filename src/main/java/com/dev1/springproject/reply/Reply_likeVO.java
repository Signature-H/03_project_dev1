package com.dev1.springproject.reply;

public class Reply_likeVO {
	private int reply_no;
	private int article_no;
	private String id;
	private String reply_like;

	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReply_like() {
		return reply_like;
	}
	public void setReply_like(String reply_like) {
		this.reply_like = reply_like;
	}
}
