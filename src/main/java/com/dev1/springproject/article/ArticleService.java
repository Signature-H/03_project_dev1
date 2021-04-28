package com.dev1.springproject.article;

import java.util.List;

public interface ArticleService {
	public void writeArticle(ArticleVO vo);
	public void updateArticle(ArticleVO vo);
	public ArticleVO readArticle(ArticleVO vo);
	public int countArticle(ArticlePageVO vo);
	public List<ArticleVO> articleList(ArticlePageVO vo);
	public void deleteArticle(ArticleVO vo);
}
