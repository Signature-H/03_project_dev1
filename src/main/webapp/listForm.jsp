<%@page import="com.dev1.springproject.board.BoardService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css"/>">
</head>
<body>
	<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
		
		<u:isLogin>
		<span id="login_join">
				<a href="myInfoForm.jsp"><input	type="button" value="마이페이지"></a>
				<a href="logout.do"><input type="button" value="로그아웃"></a>
		</span>
		</u:isLogin>
		<u:notLogin>
		<span id="login_join"><a href="loginForm.jsp"><input type="button"
				value="로그인"></a> <a href="joinForm.jsp"><input
				type="button" value="회원가입"></a> 
				</span>
		</u:notLogin>		
		
	</header>

<!-- 실제 body -->
	<div id="b_contents">
	<u:isLogin>
	<a href="writeArticle.do"><input type="button" value="새 글 등록"></a><br/>
	</u:isLogin>
		<!-- 검색 -->
		<form action="list.do">
			<table border="1"
				style="border-spacing: 0; padding: 0; margin: auto; width: 700px;">
				<tr>
					<td align="right"><select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select> <input type="text" name="searchKeyword"> <input
						type="submit" value="검색">
				</tr>
			</table>
		</form>

		<!-- 게시글 목록 -->
		<table border="1"
			style="border-spacing: 0; padding: 0; margin: auto; width: 700px;">
			<tr>
				<th width="100">번호</th>
				<th width="200">제목</th>
				<th width="150">글쓴이</th>
				<th width="100">등록일</th>
				<th width="100">조회수</th>
			</tr>
			<c:forEach items="${ArticleList}" var="article" >
				<tr>
					<td>${article.article_No}</td>
					<td align="left"><a href="readArticle.do?number=${article.article_No}">${article.title}</a></td>
					<td>${article.writer_Name}</td>
					<td>${article.article_RegDate}</td>
					<td>${article.read_Cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>