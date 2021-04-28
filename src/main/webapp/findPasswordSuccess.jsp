<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String memPassword = (String)request.getSession().getAttribute("PASSWORD");
	String resultStr = memPassword == "" || memPassword == null ? "해당 결과가 존재하지 않습니다." : memPassword;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
		<div>
		<br />
			<h4>검색된 회원정보</h4>
			<!-- 아이디 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="text" class="form-control" name="password" value="<%= resultStr %>" readonly="readonly">
			</div>
		</div>
		<div class="d-grid gap-2">
			<button class="btn btn-primary" onclick="javascript:window.close();">확인</button>
		</div>
	</div>
</body>
</html>