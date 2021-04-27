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
</script>
</head>
<body>
	<div class="container col-md-6">
		<a href="list.do"><img alt="dev1_logo"
			src="resources/img/dev1_logo.svg" id="dev1_logo"></a>
		<form action="join.do" method="post">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">아이디</span>
				</div>
				<input type="text" class="form-control" placeholder="ID" name="id">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">비밀번호</span>
				</div>
				<input type="password" class="form-control" placeholder="PASSWORD" name="password">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">이름</span>
				</div>
				<input type="text" class="form-control" placeholder="NAME" name="name">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">이메일</span>
				</div>
				<input type="text" class="form-control" placeholder="example@gmail.com" name="email">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">생년월일</span>
				</div>
				<input type="date" class="form-control" name="birthday">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">전화번호</span>
				</div>
				<input type="tel" class="form-control" name="phoneNumber">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="ZIPCODE" name="zipcode" id="zipcode" readonly="readonly">
				<div class="input-group-append">
					<button class="btn btn-secondary" type="button" onclick="goPopup();">검색</button>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">기본 주소</span>
				</div>
				<input type="text" class="form-control" name="address1" id="address1" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">상세 주소</span>
				</div>
				<input type="text" class="form-control" name="address2" id="address2">
			</div>
			
			<br /> <br />
			<button type="submit" class="btn btn-success" id="alignCenter">회원가입</button>
		</form>
	</div>
</body>
</html>