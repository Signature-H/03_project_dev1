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
<script >
function setThumnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		document.getElementById("userImage").setAttribute("src", event.target.result);
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css"/>">
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
	
	<input type="hidden" id="h_password" value="<%= vo.getPassword() %>" >
	<!-- 실제 body -->
	<div id="b_contents">
		<form action="changeMyInfo.do" method="post" enctype="multipart/form-data" id="changeInfo">
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
						name="password" value="" id="password">
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
						value="<%=vo.getEmail()%>" id="email">
				</div>

				<!-- 생년월일 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">생년월일</span>
					</div>
					<input type="date" class="form-control" name="birthday"
						value="<%=sBirthday%>" id="birthday">
				</div>

				<!-- 전화번호 입력 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">전화번호</span>
					</div>
					<input type="text" class="form-control" name="phoneNumber"
						value="<%=vo.getPhoneNumber()%>" id="phoneNumber">
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
					<button type="button" class="btn btn-primary" id="alignCenter" onclick="validate();">정보
						변경하기</button>
				</div>
		</form>
	</div>

<script type="text/javascript">
function validate(){
	// 정규식
	var re_pw = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^+=]).*$/; //비번 검사(특수문자/문자/숫자 포함 6~15자리)
	var re_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,4}$/i; //이메일 검사
	var re_phone = /^01(?:0|1|6-9)(?:\d{3}|\d{4})\d{4}$/;//폰번호 검사
	
	//검사할 값
	var h_password = document.getElementById("h_password");
	var password = document.getElementById("password");
	var email = document.getElementById("email");
	var birthday = document.getElementById("birthday");
	var phoneNumber = document.getElementById("phoneNumber");
	var zipcode = document.getElementById("zipcode");
	
	//비밀번호 검사
	if(password.value == ""){
		password.value = h_password.value;
	}
	
	if(!check(re_pw, password, "비밀번호는 특수문자/대소문자/숫자를 포함하여 6~15자여야 합니다.")){
		return false;
	}
	
	//이메일 검사
	if(email.value == ""){
		alert("이메일을 입력해주세요.");
		email.focus();
		return false;
	}
	
	if(!check(re_email, email, "이메일 양식에 맞지 않습니다.")){
		return false;
	}
	
	//생년월일 검사
	if(birthday.value == ""){
		alert("생년월일을 입력해주세요.");
		birthday.focus();
		return false;
	}
	
	//전화번호 검사
	if(phoneNumber.value == ""){
		alert("전화번호를 입력해주세요.");
		phoneNumber.focus();
		return false;
	}
	
	if(!check(re_phone, phoneNumber, "전화번호 양식에 맞지 않습니다.")){
		return false;
	}
	
	//집주소
	if(zipcode.value == ""){
		alert("주소를 입력해 주세요.");
		zipcode.focus();
		return false;
	}
	
	alert("회원정보 변경완료");
	document.getElementById("changeInfo").submit();
}

function check(re, checkValue, message){
	if(re.test(checkValue.value)){
		return true;
	}
	alert(message);
	checkValue.value = "";
	checkValue.focus();
}
</script>

</body>
</html>