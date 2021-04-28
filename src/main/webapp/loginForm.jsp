<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="<c:url value="/resources/css/normalbody.css" />">
<title>로그인</title>
<style type="text/css">
#dev1_logo {
	width: 250px;
	height: auto;
	display: block;
	margin-left: auto;
	margin-right: auto;
}
#alignCenter {
	display: block;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
<!-- 실제 body -->
	<div id="b_contents">
		<div class="container col-md-6">
			<form action="login.do" method="post">
				<a href="list.do"><img alt="dev1_logo"
					src="resources/img/dev1_logo.svg" id="dev1_logo"></a>

				<!-- 아이디 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">아이디</span>
					</div>
					<input type="text" class="form-control" placeholder="ID" name="id">
				</div>

				<!-- 비밀번호 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">비밀번호</span>
					</div>
					<input type="password" class="form-control" placeholder="PASSWORD"
						name="password">
				</div>

				<!-- 로그인 버튼 -->
				<div class="input-group mb-3">
					<input type="submit" class="form-control btn-primary" id="alignCenter" value="로그인">
				</div>
			</form>
			<hr>
			
			<!-- 아이디 찾기, 비밀번호 찾기, 회원가입 -->
			<a href="javascript:goPopup()">아이디/비밀번호 찾기</a>&nbsp;|&nbsp;
			<a href="join.do">회원가입</a>
		</div>		
	</div>
<script type="text/javascript">
function goPopup(){
	var pop = window.open("findId.do","findid_pwPop","width=540px, height=340px,scrollbars=yes, resizable=yes");
}
</script>

</body>
</html>