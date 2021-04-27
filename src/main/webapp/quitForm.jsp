<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="quit.do" method="post">
<input type="hidden" name="id" value="${auth.id}">
	<table>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
		<td colspan="2"><button type="submit">회원탈퇴</button></td>
	</table>
</form>
</body>
</html>