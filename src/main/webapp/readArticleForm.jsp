<%@page import="com.dev1.springproject.auth.AuthMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css" />">
</head>
<body>
	<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
		<u:isLogin>
			<span id="login_join"> <a href="myInfo.do"><input
					type="button" value="마이페이지"></a> <a href="logout.do"><input
					type="button" value="로그아웃"></a>
			</span>
		</u:isLogin>
		<u:notLogin>
			<span id="login_join"><a href="login.do"><input
					type="button" value="로그인"></a> <a href="join.do"><input
					type="button" value="회원가입"></a> </span>
		</u:notLogin>
	</header>

	<!-- 실제 body -->
	<div id="b_contents">
		<u:isLogin>
			<a href="writeArticle.do"><input type="button" value="새 글 등록"></a>
			<br>
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
							<a href="deleteArticle.do?article_no=${article.article_no}"><input
								type="button" value="글 삭제하기"></a></td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>

	<!-- 공지사항 등록/해제 버튼 -->
	<div>
			<c:if test="${article.notice==0 }">
				<a href="regNotice.do"><input type="button" value="공지 등록"></a>
			</c:if>
			<c:if test="${article.notice == 1}">
				<a href="unregNotice.do"><input type="button" value="공지 해제"></a>
			</c:if>
	</div>

	<!-- 댓글 작성 -->
	<div>
		<u:isLogin>
			<form action="writeReply.do" method="post">
				<input type="hidden" name="article_no" value="${article.article_no}">
				<input type="hidden" name="reply_id" value="${auth.id}"> <input
					type="hidden" name="reply_name" value="${auth.name}">
				<textarea cols="30" rows="5" name="reply_content"></textarea>
				<input type="submit" value="댓글 등록">
			</form>
		</u:isLogin>
	</div>

	<!-- 댓글 목록 -->
	<div class="table-responsive">
		<table class="table table-hover table-sm"
			style="margin: auto; width: auto;">
			<tbody>
				<c:forEach items="${replyList}" var="reply">
					<tr>
						<td>${reply.reply_name}</td>
						<td>${reply.reply_content}</td>
						<td>${reply.reply_regDate}</td>
						<td>${reply.reply_like_cnt}</td>
						<td>${reply.reply_unlike_cnt}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>