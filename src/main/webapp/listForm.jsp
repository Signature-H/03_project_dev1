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
			<span id="login_join"> <a href="myInfoForm.jsp"><button
						type="button" class="btn btn-primary">마이페이지</button></a> <a
				href="logout.do"><input type="button" value="로그아웃"></a>
			</span>
		</u:isLogin>
		<u:notLogin>
			<span id="login_join"><a href="loginForm.jsp"><button
						type="button" class="btn btn-primary">로그인</button></a> <a
				href="joinForm.jsp"><button type="button"
						class="btn btn-success">회원가입</button></a> </span>
		</u:notLogin>

	</header>

	<!-- 실제 body -->
	<div id="b_contents">
		<u:isLogin>
			<a href="writeArticle.do"><input type="button" value="새 글 등록"></a>
			<br />
		</u:isLogin>


		<!-- 게시글 목록 -->
		<div class="table-responsive">
			<table class="table table-hover table-sm"
				style="margin: auto; width: auto;">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
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
			</table>
		</div>
		<br />
		<div>
			<c:if test="${page.startPage != 1 }">
				<a href="/list.do?currentPage=${page.startPage - 1 }">&lt;</a>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
				<c:choose>
					<c:when test="${p == page.currentPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != page.currentPage }">
						<a href="/list.do?currentPage=${p }">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${page.endPage != page.totalPage}">
				<a href="/list.do?currentPage=${page.endPage+1 }">&gt;</a>
			</c:if>
		</div>
		<br />
		<!-- 검색 -->
		<form action="list.do">
			<table style="margin: auto;">
				<tr>
					<td align="right"><select name="condition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
							<option value="WRITER">작성자
							<option value="ARTICLE">제목+내용
					</select> <input type="text" name="keyword"> <input type="submit"
						value="검색">
				</tr>
			</table>
		</form>
	</div>

</body>

</html>