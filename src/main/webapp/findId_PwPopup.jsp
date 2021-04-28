<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="<c:url value="resources/css/find.css" />">
</head>
<body>
	<div class="container">
		<h3>아이디/비밀번호 찾기</h3>
		<nav>
			<div class="nav nav-tabs" id="nav-tab">
				<button class="nav-link active" id="nav-id-tab" data-bs-toggle="tab"
					data-bs-target="#nav-id" type="button" aria-controls="nav-id"
					aria-selected="true">아이디 찾기</button>
				<button class="nav-link" id="nav-password-tab" data-bs-toggle="tab"
					data-bs-target="#nav-password" type="button"
					aria-controls="nav-password" aria-selected="false">비밀번호 찾기</button>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
		
			<!-- 아이디 찾기 -->
			<div class="tab-pane fade show active" id="nav-id"
				aria-labelledby="nav-id-tab">
				<br />
				<h4>이메일로 찾기</h4>
				<!-- 이메일 입력 -->
				<form action="findId.do" method="post">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">이메일</span>
						</div>
						<input type="text" class="form-control"
							placeholder="example@gmail.com" name="email">
					</div>
					<div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary" >아이디
							찾기</button>
					</div>
				</form>
			</div>
			
			<!-- 비밀번호 찾기 -->
			<div class="tab-pane fade" id="nav-password"
				aria-labelledby="nav-password-tab">
				<br />
				<h4>회원정보로 찾기</h4>
				<form action="findPassword.do" method="post">
					<!-- 아이디 입력 -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">아이디</span>
						</div>
						<input type="text" class="form-control" placeholder="ID" name="id">
					</div>
					<!-- 이메일 입력 -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">이메일</span>
						</div>
						<input type="text" class="form-control"
							placeholder="example@gmail.com" name="email">
					</div>
					<div class="d-grid gap-2">
						<button type="submit" class="btn btn-primary" >비밀번호
							찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>