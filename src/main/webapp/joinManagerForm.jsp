<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>회원가입</title>
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
<script type="text/javascript">
function goPopup(){
	var pop = window.open("jusoPopup.jsp","pop","width=400px, height=650px,scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadAddrPart1, addrDetail, zipNo){
	document.getElementById("zipcode").value = zipNo;
	document.getElementById("address1").value = roadAddrPart1;
	document.getElementById("address2").value = addrDetail;
	}
	
function setThumnail(event){
	var reader = new FileReader();
	
	reader.onload = function(event){
		document.getElementById("userImage").setAttribute("src", event.target.result);
	};
	reader.readAsDataURL(event.target.files[0]);
}
</script>
</head>
<body>
	<div class="container col-md-6">
		<a href="list.do"><img alt="dev1_logo"
			src="resources/img/dev1_logo.svg" id="dev1_logo"></a>
			
		<form action="joinManager.do" method="post" enctype="multipart/form-data" id="joinManager">
		<!-- 관리자 식별 코드  -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">관리자 식별 코드</span>
				</div>
				<input type="password" class="form-control" placeholder="MANAGERCODE" name="managerCode" id="managerCode">
			</div>
		<!-- 아이디 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">아이디</span>
				</div>
				<input type="text" class="form-control" placeholder="ID" name="id" id="id">
			</div>
			
			<!-- 비밀번호 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="password" class="form-control" placeholder="PASSWORD" name="password" id="password">
			</div>
			
			<!-- 이름 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">이름</span>
				</div>
				<input type="text" class="form-control" placeholder="NAME" name="name" id="name">
			</div>
			
			<!-- 이메일 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">이메일</span>
				</div>
				<input type="text" class="form-control" placeholder="example@gmail.com" name="email" id="email">
			</div>
			
			<!-- 생년월일 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">생년월일</span>
				</div>
				<input type="date" class="form-control" name="birthday" id="birthday">
			</div>
			
			<!-- 전화번호 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">전화번호</span>
				</div>
				<input type="text" class="form-control" name="phoneNumber" id="phoneNumber">
			</div>
			<div class="mb-3">
					<div id="inputInfo" class="form-text"
						style="text-align: left;">-를
						제외하고 숫자만 입력해주세요.</div>
				</div>
			
			<!-- 우편번호 입력 -->
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="ZIPCODE" name="zipcode" id="zipcode" readonly="readonly">
				<div class="input-group-append">
					<button class="btn btn-secondary" type="button" onclick="goPopup();">검색</button>
				</div>
			</div>
			
			<!-- 주소 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">기본 주소</span>
				</div>
				<input type="text" class="form-control" name="address1" id="address1" readonly="readonly">
			</div>
			
			<!-- 상세 주소 입력 -->
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">상세 주소</span>
				</div>
				<input type="text" class="form-control" name="address2" id="address2">
			</div>
			
			<!-- 프로필 사진 -->
			<div class="input-group mb-3" >
				<div id="alignCenter"><img id="userImage" class="rg_i Q4LuWd" src="resources/img/default.png" data-atf="true" width="193" height="192" onerror="this.src='resources/img/default.png'"></div>
				<div class="input-group mb-3" style="margin-top: 20px;">
				<input type="file" class="form-control"  name="uploadFile" id="customFile" onchange="setThumnail(event);"/>
				</div>
				
			</div>
			
			<br /> <br />
			<button type="button" class="btn btn-success" id="alignCenter" onclick="validate();">회원가입</button>
		</form>
	</div>
	<script type="text/javascript">
function validate(){
	// 정규식
	var re_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,4}$/i; //이메일 검사
	var re_phone = /^01(?:0|1|6-9)(?:\d{3}|\d{4})\d{4}$/;//폰번호 검사
	
	//검사할 값
	var managerCode = document.getElementById("managerCode");
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var name = document.getElementById("name");
	var email = document.getElementById("email");
	var birthday = document.getElementById("birthday");
	var phoneNumber = document.getElementById("phoneNumber");
	var zipcode = document.getElementById("zipcode");
	
	//매니저 코드 검사
	
	
	//아이디 검사
	if(id.value == ""){
		alert("아이디를 입력해주세요.")
		id.focus();
		return false;
	}
	
	//비밀번호 검사
	if(password.value == ""){
		alert("비밀번호를 입력해주세요.");
		password.focus();
		return false;
	}
	
	//이름 검사
	if(name.value == ""){
		alert("이름을 입력해주세요.");
		name.focus();
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
	
	alert("회원가입 완료");
	document.getElementById("joinManager").submit();
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