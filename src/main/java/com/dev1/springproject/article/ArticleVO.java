package com.dev1.springproject.article;

import java.sql.Date;

public class ArticleVO {

	// ARTICLE_NO
	private int article_no; 
	// TITLE
	private String title;
	// WRITER_ID
	private String writer_id;
	// WRITER_NAME
	private String writer_name; 
	// CONTENT
	private String content;
	// ARTICLE_REGDATE
	private Date article_regDate;
	// ARTICLE_MODDATE
	private Date article_modDate;
	// READ_CNT
	private int read_cnt;
	// REPLY_CNT
	private int reply_cnt;
	// LIKE_CNT
	private int like_cnt;
	// UNLIKE_CNT
	private int unlike_cnt;
	// NOTICE
	private String notice;
	
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getArticle_regDate() {
		return article_regDate;
	}
	public void setArticle_regDate(Date article_regDate) {
		this.article_regDate = article_regDate;
	}
	public Date getArticle_modDate() {
		return article_modDate;
	}
	public void setArticle_modDate(Date article_modDate) {
		this.article_modDate = article_modDate;
	}
	public int getRead_cnt() {
		return read_cnt;
	}
	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getUnlike_cnt() {
		return unlike_cnt;
	}
	public void setUnlike_cnt(int unlike_cnt) {
		this.unlike_cnt = unlike_cnt;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	
	@Override
	public String toString() {
		return "ArticleVO [article_no=" + article_no + ", title=" + title + ", writer_id=" + writer_id
				+ ", writer_name=" + writer_name + ", content=" + content + ", article_regDate=" + article_regDate
				+ ", article_modDate=" + article_modDate + ", read_cnt=" + read_cnt + ", reply_cnt=" + reply_cnt
				+ ", like_cnt=" + like_cnt + ", unlike_cnt=" + unlike_cnt + ", notice=" + notice + "]";
	}
}
