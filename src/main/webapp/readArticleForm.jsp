<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/normalbody.css" />">
</head>
<body>
<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
		<u:isLogin>
		<span id="login_join">
				<a href="myInfo.do"><input	type="button" value="마이페이지"></a>
				<a href="logout.do"><input type="button" value="로그아웃"></a>
		</span>
		</u:isLogin>
		<u:notLogin>
		<span
			id="login_join"><a href="login.do"><input type="button"
				value="로그인"></a> <a href="join.do"><input
				type="button" value="회원가입"></a> 
				</span>
		</u:notLogin>
	</header>
	
<!-- 실제 body -->
	<div id="b_contents">
	<u:isLogin>
		<a href="writeArticle.do"><input type="button" value="새 글 등록"></a><br>
	</u:isLogin>
		<form action="updateArticle.do">
			<table border="1"
				style="border-spacing: 0; padding: 0; margin: auto; width: 700px;">
				<tr>
					<td>글 번호</td>
					<td align="left">${article.article_no}</td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td align="left">${article.title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td align="left">${article.writer_name}</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td align="left">${article.article_regDate}</td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td align="left">${article.content}</td>
				</tr>
				<c:if test="${article.writer_id eq auth.id}">
				<tr>
					<td colspan="2"><input type="submit" value="글 수정하기">
					<a href="deleteArticle.do?article_no=${article.article_no}"><input type="button" value="글 삭제하기"></a></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>