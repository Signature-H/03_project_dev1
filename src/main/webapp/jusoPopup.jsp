<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도로명 주소 검색</title>
<%
	request.setCharacterEncoding("UTF-8");

	String inputYn = request.getParameter("inputYn");
	String roadAddrPart1 = request.getParameter("roadAddrPart1");
	String addrDetail = request.getParameter("addrDetail");
	String zipNo = request.getParameter("zipNo");
%>
</head>
<script type="text/javascript">
function init(){
	var url= location.href;
	var confmKey="devU01TX0FVVEgyMDIxMDQyNjIyMDIwNzExMTA5NTU=";//테스트용 승인키 : TESTJUSOGOKR
	var resultType="3";//1:도로명, 2:도로명+지번+상세보기(관련지번, 관할주민센터),
						//3: 도로명+상세보기(상세건물명), 4:도로명+지번+상세보기(관련지번,관할주민센터,상세건물명)
	var inputYn = "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value=confmKey;
		document.form.returnUrl.value=url;
		document.form.resultType.value=resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do";//모바일 웹인 경우, 인터넷망
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=roadAddrPart1%>", "<%=addrDetail%>", "<%=zipNo%>");
		window.close();
	}
	
}
</script>
<body onload="init();">
<form id="form" name="form" method="post">
<input type="hidden" id="confmKey" name="confmKey" value=""/>
<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
<input type="hidden" id="resultType" name="resultType" value=""/>
</form>

</body>
</html>