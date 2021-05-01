<%@page import="com.dev1.springproject.reply.Reply_likeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.dev1.springproject.article.ArticleVO"%>
<%@page import="com.dev1.springproject.auth.AuthMemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%
	ArticleVO avo = (ArticleVO) request.getSession().getAttribute("article");
boolean b_notice = avo.getNotice() == "1" ? true : false;
String btn_notice_name = b_notice ? "공지 해제" : "공지 등록";
String notice_url = b_notice ? "unregNotice.do" : "regNotice.do";

AuthMemberVO amvo = (AuthMemberVO) request.getSession().getAttribute("auth");
boolean isManager = false;
if (amvo != null)
	isManager = amvo.getManager() == '1' ? true : false;
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
	<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
<title>게시글 보기</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/normalbody.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/readArticle.css" />">
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
		<u:notLogin>
			<span id="login_join"><a href="login.do"><button
						type="button" class="btn btn-primary">로그인</button></a> <a
				href="join.do"><button type="button" class="btn btn-success">회원가입</button></a>
			</span>
		</u:notLogin>

	</header>

	<!-- 실제 body -->
	<div id="b_contents">
		<table
			style="border-spacing: 0; padding: 0; margin: auto; width: 700px;">
			<tbody>
				<tr class="tr_body">
					<td style="text-align: left; padding: 5px 15px;">
						<!-- 게시글 상단부 -->
						<h2>${article.title}</h2>
						<div class="profile_area">
							<div class="nickname">
								${article.writer_name}(${article.writer_id})</div>
							<div class="article_info">${article.article_regDate}</div>
						</div>
						<div class="reply_area">
							<a href="#replyListPos">댓글 ${article.reply_cnt}</a>
						</div> <!-- 게시글 중단부(글내용) -->
						<hr>
						<div class="contents">
							<p>${article.content}</p>
						</div>
						<hr> <!-- 게시글 하단부(댓글) -->
						<div id="replyListPos"></div>
						<c:forEach items="${replyList}"
							var="reply">
							<div class="reply" style="border-bottom: 1px solid #CCC;">
								<div class="reply_writer_area">
									<div class="reply_name">
										<strong>${reply.reply_name}</strong>
									</div>
									<div class="reply_content"
										style="width: 700px; white-space: normal; word-break: break-all;">
										${reply.reply_content}</div>
									<div class="reply_regDate">${reply.reply_regDate}</div>

									<!-- 좋아요/싫어요 검사 (좋아요 : T | 싫어요 : F)-->
									<c:set var="replyInfo" value="${reply.reply_no},${article.article_no},${auth.id},${reply.reply_like}" />
									<c:choose>
									<c:when test="${empty reply.reply_like || reply.reply_like == null}">
										<button type="button" class="btn_like" id="like_hate_btn" value="${replyInfo }">좋아요</button>
										<button type="button" class="btn_hate" id="like_hate_btn" value="${replyInfo }">싫어요</button>
									</c:when>
									<c:when test="${reply.reply_like eq 'T'}">
										<button type="button" class="btn_like" id="like_hate_btn" value="${replyInfo }">좋아요취소</button>
										<button type="button" class="btn_hate" id="like_hate_btn" value="${replyInfo }">싫어요</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn_like" id="like_hate_btn" value="${replyInfo }">좋아요</button>
										<button type="button" class="btn_hate" id="like_hate_btn" value="${replyInfo }">싫어요취소</button>
									</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</c:forEach> <!-- 댓글 작성 --> <u:isLogin>
							<form action="writeReply.do" method="post">
								<input type="hidden" name="article_no"
									value="${article.article_no}"> <input type="hidden"
									name="reply_id" value="${auth.id}"> <input
									type="hidden" name="reply_name" value="${auth.name}">
								<div class="card-footer py-3 border-0"
									style="padding-bottom: 3rem !important;">
									<div class="d-flex flex-start w-100">
										<div class="form-outline w-100">
											<textarea class="form-control" rows="5" name="reply_content"></textarea>
										</div>
									</div>
									<div class="float-end mt-1 pt-1">
										<button type="submit" class="btn btn-primary btn-sm">등록</button>
									</div>
								</div>
							</form>
						</u:isLogin>
					</td>
				</tr>
			</tbody>
			<!-- 버튼부 -->
			<tfoot>
				<tr>
					<td>
						<!-- 왼쪽버튼(글쓰기/수정/삭제) -->
						<div class="bottom_left_btn">
							<u:isLogin>
								<!-- 글쓰기 -->
								<a href="writeArticle.do"><button type="button"
										class="btn btn-outline-dark">글쓰기</button></a>
								&ensp;
								<!-- 글 수정/삭제 -->
								<c:if test="${article.writer_id eq auth.id}">
									<a href="updateArticle.do">
										<button type="submit" class="btn btn-outline-info">수정</button>
									</a>
									&ensp;
									<a href="deleteArticle.do?article_no=${article.article_no}"><button
											type="button" class="btn btn-outline-danger">삭제</button></a>
								</c:if>
							</u:isLogin>
						</div> <!-- 오른쪽버튼(공지등록/목록보기/상단으로) -->
						<div class="bottom_right_btn">
							<c:if test="<%=isManager%>">
								<a href="<%=notice_url%>"><button type="button"
										class="btn btn-outline-warning"><%=btn_notice_name%></button></a>
								&ensp;
							</c:if>
							<a href="list.do"><button type="button"
									class="btn btn-outline-dark">목록</button></a>&ensp; <a href="#top"><button
									type="button" class="btn btn-outline-dark">▲ TOP</button></a>
						</div>
					</td>
				</tr>
			</tfoot>

		</table>
	</div>
</body>
<script>
$(function(){
	$(".btn_like").click(function(){
		var reply = $(this).attr('value');
		var infoArray = reply.split(",");
		var reply_no = infoArray[0];
		var article_no = infoArray[1];
		var auth_id = infoArray[2];
		var reply_like = infoArray[3];
		
		var _replyInfo = {"reply_no" : reply_no, "article_no" : article_no, "id" : auth_id, "reply_like" : reply_like};
		
		$.ajax({
			type:"post",
			async:false,
			data : _replyInfo,
			dataType : "text",
			url:"replyLike.do",
			success:function (data){
				if(data == "N"){
					alert("로그인을 해주세요.");
				}else{
					window.location.reload();
				}
			},
			error:function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"+"error : " + error);
			},
			complete:function(data){
				console.log("완료! : " + data);
			}
		});
		
	});
	
	$(".btn_hate").click(function(){
		var reply = $(this).attr('value');
		var infoArray = reply.split(",");
		var reply_no = infoArray[0];
		var article_no = infoArray[1];
		var auth_id = infoArray[2];
		var reply_like = infoArray[3];
		
		var _replyInfo = {"reply_no" : reply_no, "article_no" : article_no, "id" : auth_id, "reply_like" : reply_like};
		
		$.ajax({
			type:"post",
			async:false,
			data : _replyInfo,
			dataType : "text",
			url:"replyHate.do",
			success:function (data){
				if(data == "N"){
					alert("로그인을 해주세요.");
				}else{
					window.location.reload();
				}
			},
			error:function(request, status, error){
				alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n"+"error : " + error);
			},
			complete:function(data){
				console.log("완료! : " + data);
			}
		});
		
	});
});




</script>
</html>