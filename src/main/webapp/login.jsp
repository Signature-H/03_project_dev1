<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="<c:url value="/resources/css/normalbody.css" />">
</head>
<body>

<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
	</header>

<!-- 실제 body -->
	<div id="b_contents">
		<h1>로그인</h1>
		<hr>
		<form action="login.do" method="post">
		<!-- <form action="getBoardList.jsp" method="post"> -->
			<table border="1"
				style="border-spacing: 0; padding: 0; margin: auto;">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인">&emsp;
						<a href="joinMember.jsp"><input type="button" value="회원가입"></a>
					</td>
				</tr>
			</table>
		</form>
		<hr>
	</div>


</body>
</html>