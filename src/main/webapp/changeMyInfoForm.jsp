<%@page import="com.dev1.springproject.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%
	MemberVO vo = (MemberVO) request.getSession().getAttribute("member");
String sBirthday = vo.getBirthday().substring(0, 10);
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
<title>정보 변경하기</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css"/>">
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
		<form action="changeMyInfo.do" method="post">
			<div class="container col-md-6">
				<!-- 아이디 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">아이디</span>
					</div>
					<input type="text" class="form-control" placeholder="ID" name="id"
						value="<%=vo.getId()%>" readonly="readonly">
				</div>

				<!-- 비밀번호 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">비밀번호</span>
					</div>
					<input type="password" class="form-control" placeholder="PASSWORD"
						name="password" value="">
				</div>

				<!-- 이름 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">이름</span>
					</div>
					<input type="text" class="form-control" placeholder="NAME"
						name="name" value="<%=vo.getName()%>" readonly="readonly">
				</div>

				<!-- 이메일 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">이메일</span>
					</div>
					<input type="text" class="form-control"
						placeholder="example@gmail.com" name="email"
						value="<%=vo.getEmail()%>">
				</div>

				<!-- 생년월일 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">생년월일</span>
					</div>
					<input type="date" class="form-control" name="birthday"
						value="<%=sBirthday%>">
				</div>

				<!-- 전화번호 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">전화번호</span>
					</div>
					<input type="text" class="form-control" name="phoneNumber"
						value="<%=vo.getPhoneNumber()%>">
				</div>

				<!-- 우편번호 입력 -->
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="ZIPCODE"
						name="zipcode" id="zipcode" value="<%=vo.getZipcode()%>"
						readonly="readonly">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button"
							onclick="goPopup();">검색</button>
					</div>
				</div>

				<!-- 주소 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">기본 주소</span>
					</div>
					<input type="text" class="form-control" name="address1"
						id="address1" value="<%=vo.getAddress1()%>" readonly="readonly">
				</div>

				<!-- 상세 주소 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">상세 주소</span>
					</div>
					<input type="text" class="form-control" name="address2"
						id="address2" value="<%=vo.getAddress2()%>">
				</div>

				<!-- 프로필 사진 -->
				<div class="input-group mb-3">
					<div id="alignCenter">
						<img id="userImage" class="rg_i Q4LuWd"
							src="<%=vo.getPath()%>" data-atf="true" width="193"
							height="192" onerror="this.src='resources/img/default.png'">
					</div>
					<div class="input-group mb-3" style="margin-top: 20px;">
						<input type="file" class="form-control" name="uploadFile"
							id="customFile" onchange="setThumnail(event);" />
					</div>
					<br />
					<button type="submit" class="btn btn-primary" id="alignCenter">정보
						변경하기</button>
				</div>
		</form>
	</div>

</body>
</html>