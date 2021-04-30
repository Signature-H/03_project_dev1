<%@page import="com.dev1.springproject.article.ArticleService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css"/>">
<title>게시판</title>
</head>
<body>
	<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do"><img alt="메인으로"
				src="resources/img/dev1_logo.svg" id="dev1_mainLogo"></a></span>

		<u:isLogin>
			<span id="login_join"> <a href="myInfo.do"><button
						type="button" class="btn btn-primary">마이페이지</button></a> <a
				href="logout.do"><button class="btn btn-danger" type="button">로그아웃</button></a>
			</span>
		</u:isLogin>
		<u:notLogin>
			<span id="login_join"><a href="login.do"><button
						type="button" class="btn btn-primary">로그인</button></a> <a
				href="join.do"><button type="button" class="btn btn-success">회원가입</button></a>
			</span>
		</u:notLogin>

	</header>

	<!-- 실제 body -->
	<div id="b_contents">
		<!-- 게시글 목록 -->
		<div class="table-responsive">
			<table class="table table-hover table-sm"
				style="margin: auto; width: auto;">
				<thead>
					<tr>
						<th class="col-md-1">번호</th>
						<th class="col-md-5">제목</th>
						<th class="col-md-3">글쓴이</th>
						<th class="col-md-2">등록일</th>
						<th class="col-md-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="article">
						<tr>
							<td><b>공지</b></td>
							<td align="left"><a
								href="readArticle.do?article_no=${article.article_no}">${article.title}</a></td>
							<td>${article.writer_name}</td>
							<td>${article.article_regDate}</td>
							<td>${article.read_cnt}</td>
						</tr>
					</c:forEach>
					<c:forEach items="${articleList}" var="article">
						<tr>
							<td>${article.article_no}</td>
							<td align="left"><a
								href="readArticle.do?article_no=${article.article_no}">${article.title}</a></td>
							<td>${article.writer_name}</td>
							<td>${article.article_regDate}</td>
							<td>${article.read_cnt}</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5" style="border-bottom: none;"><u:isLogin>
								<div style="float: right;">
									<form action="writeArticle.do">
										<button type="submit" class="btn btn-outline-dark">글쓰기</button>
									</form>
								</div>
							</u:isLogin></td>
					</tr>
				</tfoot>
			</table>
		</div>
		<br />

		<!-- 게시글 페이징 -->
		<br />
		<div>
			<nav>
				<ul class="pagination justify-content-center">
					<!-- 이전으로 -->
					<c:if test="${page.startPage != 1}">
						<li class="page-item"><a class="page-link"
							href="list.do?currentPage=${page.startPage - 1 }&condition=${page.condition}&keyword=${page.keyword}">Prev</a>
						</li>
					</c:if>

					<!-- 페이징 -->
					<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
						<c:choose>
							<c:when test="${p == page.currentPage}">
								<li class="page-item active"><span class="page-link">${p}</span></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="list.do?currentPage=${p }&condition=${page.condition}&keyword=${page.keyword}">${p}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 다음으로 -->
					<c:if test="${page.endPage != page.totalPage}">
						<li class="page-item"><a class="page-link"
							href="list.do?currentPage=${page.endPage+1 }&condition=${page.condition}&keyword=${page.keyword}">Next</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
		<br />
		<!-- 검색 -->
		<form action="list.do">
			<div class="table-responsive">
			<table class="table table-sm"
				style="margin: auto; width: auto; background-color: #fdfdd7">
				<tr>
					<td align="right" class="col-md-6" style="vertical-align: middle; text-align: center; height: 100px;">
					<select name="condition" style="height: 30px;">
							<option value="TITLE">제목
							<option value="CONTENT">내용
							<option value="WRITER">작성자
							<option value="ARTICLE">제목+내용
					</select>
					<input type="text" name="keyword" style="height: 30px;">
					<button type="submit" style="height: 30px;">검색</button>
				</tr>
			</table>
			</div>
		</form>
	</div>

</body>

</html>