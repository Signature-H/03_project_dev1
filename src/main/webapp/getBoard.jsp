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
				<a href="myPage.jsp"><input	type="button" value="마이페이지"></a>
				<a href="logout.do"><input type="button" value="로그아웃"></a>
		</span>
		</u:isLogin>
		<u:notLogin>
		<span
			id="login_join"><a href="login.jsp"><input type="button"
				value="로그인"></a> <a href="joinMember.jsp"><input
				type="button" value="회원가입"></a> 
				</span>
		</u:notLogin>
	</header>
	
<!-- 실제 body -->
	<div id="b_contents">
	<u:isLogin>
		<a href="writeBoard.jsp"><input type="button" value="새 글 등록"></a><br>
	</u:isLogin>
		<form action="updateBoard.jsp" method="post">
			<table border="1"
				style="border-spacing: 0; padding: 0; margin: auto; width: 700px;">
				<tr>
					<td>글 번호</td>
					<td align="left">${board.number}</td>
				</tr>
				<tr>
					<td>글 제목</td>
					<td align="left">${board.title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td align="left">${board.name}</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td align="left">${board.regDate}</td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td align="left">${board.content}</td>
				</tr>
				<c:if test="${board.name eq member.name}">
				<tr>
					<td colspan="2"><input type="submit" value="글 수정하기">
					<a href="deleteArticle.do?number=${board.number}"><input type="button" value="글 삭제하기"></a></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</body>
</html>