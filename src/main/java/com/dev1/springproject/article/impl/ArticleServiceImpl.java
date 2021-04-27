package com.dev1.springproject.article.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev1.springproject.article.ArticlePageVO;
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
	public int countArticle(ArticlePageVO vo) {
		int totalArticle;
		switch (vo.getCondition()) {
		case "TITLE":
			totalArticle = articleDAO.searchCount_title(vo);
			break;
		case "CONTENT":
			totalArticle = articleDAO.searchCount_content(vo);
			break;
		case "WRITER":
			totalArticle = articleDAO.searchCount_writer_name(vo);
			break;
		case "ARTICLE":
			totalArticle = articleDAO.searchCount_article(vo);
			break;
		default:
			totalArticle = articleDAO.articleCount(vo);
			break;
		}
		return totalArticle;
	}

	@Override
	public List<ArticleVO> articleList(ArticlePageVO vo) {
		List<ArticleVO> list;
		switch (vo.getCondition()) {
		case "TITLE":
			list = articleDAO.searchList_title(vo);
			break;
		case "CONTENT":
			list = articleDAO.searchList_content(vo);
			break;
		case "WRITER":
			list = articleDAO.searchList_writer_name(vo);
			break;
		case "ARTICLE":
			list = articleDAO.searchList_article(vo);
			break;
		default:
			list = articleDAO.articleList(vo);
			break;
		}
		return list;
	}

	@Override
	public void deleteArticle(ArticleVO vo) {
		articleDAO.deleteArticle(vo);
	}
}
