package com.dev1.springproject.article;

public class ArticlePageVO {

	// 현재 페이지(사용자가 요청한 페이지)
	private int currentPage;
	// 화면에 표시되는 첫 페이지 번호
	private int startPage;
	// 화면에 표시되는 마지막 페이지 번호
	private int endPage;
	// 화면에 표시되는 페이지의 수
	private int pageCnt = 5;
	// 화면에 표시되는 게시글의 수
	private int articleCnt = 20;

	// 총 게시글의 수
	private int totalArticle;
	// 총 페이지의 수
	private int totalPage;
	// 시작 ROWNUM
	private int start;
	// 마지막 ROWNUM
	private int end;

	// 디폴트 생성자
	public ArticlePageVO() {
	}

	// 생성자
	public ArticlePageVO(int totalArticle, int currentPage) {
		this.totalArticle = totalArticle;
		this.currentPage = currentPage;
		setTotalPage(totalArticle);
		setEndtPage(currentPage);
		setStartPage(endPage);
		setEnd(currentPage);
		setStart(currentPage);
	}

	// 총 페이지 수 계산
	private void setTotalPage(int totalArticle) {
		totalPage = (int) Math.ceil((double) totalArticle / (double) articleCnt);
	}

	// 뷰단의 마지막 페이지 계산
	private void setEndtPage(int currentPage) {
		endPage = ((int)Math.ceil((double) currentPage / (double) pageCnt))*pageCnt;
		if (endPage > totalPage)
			endPage = totalPage;
	}

	// 뷰단의 첫 페이지 계산
	private void setStartPage(int endPage) {
		startPage = endPage - pageCnt + 1;
		if (startPage < 1)
			startPage = 1;
	}

	// ROWNUM 계산
	private void setEnd(int currentPage) {
		end = currentPage * articleCnt;
	}

	// ROWNUM 계산
	private void setStart(int currentPage) {
		start = end - articleCnt + 1;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getArticleCnt() {
		return articleCnt;
	}

	public void setArticleCnt(int articleCnt) {
		this.articleCnt = articleCnt;
	}

	public int getTotalArticle() {
		return totalArticle;
	}

	public void setTotalArticle(int totalArticle) {
		this.totalArticle = totalArticle;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

}
