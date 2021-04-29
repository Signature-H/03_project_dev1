<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
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
<title>글 쓰기</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css" />">
</head>
<body>
	<!-- 상단 고정바 -->
	<header>
		<span id="icon"><a href="list.do"><img alt="메인으로"
				src="resources/img/dev1_logo.svg" id="dev1_mainLogo"></a></span>

		<u:isLogin>
			<span id="login_join"> <a href="myInfo.do"><button
						type="button" class="btn btn-primary">마이페이지</button></a> <a
				href="logout.do"><button class="btn btn-danger" type="button">로그아웃</button></a>
			</span>
		</u:isLogin>
	</header>

	<!-- 실제 body -->
	<div id="b_contents">
		<form action="writeArticle.do" method="post">
		<input type="hidden" name="writer_id" value="${auth.id}">
			<table style="border: none; border-spacing: 0; padding: 0; margin: auto; width: 700px;">
				<tr>
					<td>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">제목</span>
						<input type="text" class="form-control" name="title">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">작성자</span>
						<input type="text" class="form-control" name="writer_name" value="${auth.name}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-text">내용</span>
						<textarea class="form-control" name="content" rows="10"></textarea>
					</div>
					<div class="btn_write" style="margin-top: 10px;">
						<button type="submit" class="btn btn-outline-dark">등록</button>
					</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>