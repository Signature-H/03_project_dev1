<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css"/>">
</head>
<body>
	<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
	</header>

	<div id="b_contents">
		<h1>회원가입</h1>
		<hr>
		<form action="joinMember.do" method="post">
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
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phoneNumber1" style="width: 40px">-<input
						type="text" name="phoneNumber2" style="width: 50px">-<input
						type="text" name="phoneNumber3" style="width: 50px"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="eMail"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
</body>
</html>