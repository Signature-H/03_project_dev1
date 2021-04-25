package com.dev1.springproject.article.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev1.springproject.article.ArticleService;
import com.dev1.springproject.article.ArticleVO;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleDAO articleDAO;

	@Override
	public void writeArticle(ArticleVO vo) {
		articleDAO.writeArticle(vo);
	}

	@Override
	public void updateArticle(ArticleVO vo) {
		articleDAO.updateBoard(vo);
	}

	@Override
	public ArticleVO readArticle(ArticleVO vo) {
		return articleDAO.readArticle(vo);
	}

	@Override
	public List<ArticleVO> articleList(ArticleVO vo) {
		return articleDAO.articleList(vo);
	}

	@Override
	public void deleteArticle(ArticleVO vo) {
		articleDAO.deleteArticle(vo);
	}
}
