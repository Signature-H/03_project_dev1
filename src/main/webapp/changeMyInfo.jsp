<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 변경하기</title>
<link rel="stylesheet" href="<c:url value="/resources/css/normalbody.css"/>">
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
	</header>
	
	<!-- 실제 body -->
<div id="b_contents">
<form action="changeMyInfo.do" method="post">
<table border="1" style="border-spacing: 0; padding: 0; margin: auto; width: 600px;">
	<tr>
	<td>아이디</td><td align="left">${member.id}</td>
	<tr>
	<tr>
	<td>비밀번호</td><td align="left"><input type="password" name="password"></td>
	<tr>
	<tr>
	<td>이름</td><td align="left">${member.name}</td>
	<tr>
	<tr>
	<td>전화번호</td><td align="left"><input type="text" name="phoneNumber1" style="width: 40px" value="${member.phoneNumber1}">-<input
					type="text" name="phoneNumber2" style="width: 50px" value="${member.phoneNumber2}">-<input
					type="text" name="phoneNumber3" style="width: 50px" value="${member.phoneNumber3}"></td>
	<tr>
	<tr>
	<td>이메일</td><td align="left"><input type="email" name="eMail" value="${member.eMail}"></td>
	<tr>
</table>
<br>
<input type="submit" value="정보 변경하기">
</form>
</div>

</body>
</html>