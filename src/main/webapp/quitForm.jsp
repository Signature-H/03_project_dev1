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
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css" />">
<title>회원 탈퇴</title>
<style type="text/css">
#alignCenter {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
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
	
	<div id="b_contents">
		<h1>회원 탈퇴</h1>
		<form action="quit.do" method="post" id="quit">
			<table style="width: 700px; margin: auto;">
				<tr>
					<td>
						<!-- 아이디 입력 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">아이디</span>
							</div>
							<input type="text" class="form-control" placeholder="ID"
								name="id" id="id" value="${auth.id }" readonly="readonly">
						</div> <!-- 비밀번호 입력 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">비밀번호</span>
							</div>
							<input type="password" class="form-control"
								placeholder="PASSWORD" name="password" id="password">
						</div>
						<div>
							<button type="button" class="btn btn-danger" onclick="validate();">회원탈퇴</button>
							&emsp; <a href="myInfo.do"><button type="button"
									class="btn btn-primary">취소</button></a>
						</div>
					</td>
			</table>
		</form>
	</div>
<script type="text/javascript">
function validate(){
	
	var password = document.getElementById("password");
	
	if(password.value == ""){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	
	document.getElementById("quit").submit();
}
</script>
</body>
</html>