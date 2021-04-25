package com.dev1.springproject.article.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev1.springproject.article.ArticleVO;

@Repository
public class ArticleDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// writeArticle.do
	public void writeArticle(ArticleVO vo) {
		mybatis.insert("ArticleDAO.writeArticle", vo);
		mybatis.commit();
	}

	// updateArticle.do
	public void updateBoard(ArticleVO vo) {
		mybatis.update("ArticleDAO.updateArticle", vo);
		mybatis.commit();
	}

	// readArticle.do
	public ArticleVO readArticle(ArticleVO vo) {
		mybatis.update("ArticleDao.read_cnt_seq", vo);
		mybatis.commit();
		return mybatis.selectOne("ArticleDAO.readArticle", vo);
	}
	
	// list.do
	public List<ArticleVO> articleList(ArticleVO vo) {
		return mybatis.selectList("ArticleDAO.articleList", vo);
	}

	// deleteArticle.do
	public void deleteArticle(ArticleVO vo) {
		mybatis.delete("ArticleDAO.deleteArticle", vo);
	}
	
}
