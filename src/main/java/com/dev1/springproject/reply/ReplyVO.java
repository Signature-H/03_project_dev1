package com.dev1.springproject.reply;

import java.sql.Date;

public class ReplyVO {
	private int reply_no;
	private int article_no;
	private String reply_id;
	private String reply_name;
	private String reply_content;
	private Date reply_regDate;
	private int reply_like_cnt;
	private int reply_unlike_cnt;
	
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
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getReply_name() {
		return reply_name;
	}
	public void setReply_name(String reply_name) {
		this.reply_name = reply_name;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_regDate() {
		return reply_regDate;
	}
	public void setReply_regDate(Date reply_regDate) {
		this.reply_regDate = reply_regDate;
	}
	public int getReply_like_cnt() {
		return reply_like_cnt;
	}
	public void setReply_like_cnt(int reply_like_cnt) {
		this.reply_like_cnt = reply_like_cnt;
	}
	public int getReply_unlike_cnt() {
		return reply_unlike_cnt;
	}
	public void setReply_unlike_cnt(int reply_unlike_cnt) {
		this.reply_unlike_cnt = reply_unlike_cnt;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", article_no=" + article_no + ", reply_id=" + reply_id
				+ ", reply_name=" + reply_name + ", reply_content=" + reply_content + ", reply_regDate=" + reply_regDate
				+ ", reply_like_cnt=" + reply_like_cnt + ", reply_unlike_cnt=" + reply_unlike_cnt + "]";
	}
}
