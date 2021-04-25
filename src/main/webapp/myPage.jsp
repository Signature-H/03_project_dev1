<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="<c:url value="/resources/css/normalbody.css"/>">
</head>
<body>
<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do">메인으로</a></span>
		<u:isLogin>
		<span id="login_join">
				<a href="logout.do"><input type="button" value="로그아웃"></a>
		</span>
		</u:isLogin>
	</header>
	
<!-- 실제 body -->
<div id="b_contents">
<form action="changeMyInfo.do">
<table border="1" style="border-spacing: 0; padding: 0; margin: auto; width: 600px;">
	<tr>
	<td>아이디</td><td align="left">${member.id}</td>
	<tr>
	<tr>
	<td>이름</td><td align="left">${member.name}</td>
	<tr>
	<tr>
	<td>전화번호</td><td align="left">${member.phoneNumber1}-${member.phoneNumber2}-${member.phoneNumber3}</td>
	<tr>
	<tr>
	<td>이메일</td><td align="left">${member.eMail}</td>
	<tr>
</table>
<br>
<input type="submit" value="정보 변경하기">
</form>
</div>

</body>
</html>