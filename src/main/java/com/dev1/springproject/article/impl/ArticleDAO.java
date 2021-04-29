package com.dev1.springproject.article.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.article.ArticlePageVO;
import com.dev1.springproject.article.ArticleVO;

@Repository
public class ArticleDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// writeArticle.do
	public void writeArticle(ArticleVO vo) {
		mybatis.insert("ArticleDAO.writeArticle", vo);
	}

	// updateArticle.do
	public void updateBoard(ArticleVO vo) {
		mybatis.update("ArticleDAO.updateArticle", vo);
	}

	// readArticle.do
	public ArticleVO readArticle(ArticleVO vo) {
		mybatis.update("ArticleDAO.read_cnt_seq", vo);
		return mybatis.selectOne("ArticleDAO.readArticle", vo);
	}

	// list.do
	public int articleCount(ArticlePageVO vo) {
		return mybatis.selectOne("ArticleDAO.articleCount", vo);
	}

	public List<ArticleVO> articleList(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.articleList", vo);
	}

	public List<ArticleVO> noticeList(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.noticeList", vo);
	}

	public int searchCount_title(ArticlePageVO vo) {
		return mybatis.selectOne("ArticleDAO.searchCount_title", vo);
	}

	public List<ArticleVO> searchList_title(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchList_title", vo);
	}

	public List<ArticleVO> searchNoticeList_title(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchNoticeList_title", vo);
	}

	public int searchCount_content(ArticlePageVO vo) {
		return mybatis.selectOne("ArticleDAO.searchCount_content", vo);
	}

	public List<ArticleVO> searchList_content(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchList_content", vo);
	}

	public List<ArticleVO> searchNoticeList_content(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchNoticeList_content", vo);
	}

	public int searchCount_writer_name(ArticlePageVO vo) {
		return mybatis.selectOne("ArticleDAO.searchCount_writer_name", vo);
	}

	public List<ArticleVO> searchList_writer_name(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchList_writer_name", vo);
	}

	public List<ArticleVO> searchNoticeList_writer_name(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchNoticeList_writer_name", vo);
	}

	public int searchCount_article(ArticlePageVO vo) {
		return mybatis.selectOne("ArticleDAO.searchCount_article", vo);
	}

	public List<ArticleVO> searchList_article(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchList_title_and_content", vo);
	}

	public List<ArticleVO> searchNoticeList_article(ArticlePageVO vo) {
		return mybatis.selectList("ArticleDAO.searchNoticeList_article", vo);
	}

	// deleteArticle.do
	public void deleteArticle(ArticleVO vo) {
		mybatis.delete("ArticleDAO.beforeDeleteArticle", vo);
		mybatis.delete("ArticleDAO.deleteArticle", vo);
	}

	// regNotice.do
	public void regNotice(ArticleVO vo) {
		mybatis.update("ArticleDAO.regNotice", vo);
	}

	// unregNotice.do
	public void unregNotice(ArticleVO vo) {
		mybatis.update("ArticleDAO.unregNotice", vo);
	}

}
