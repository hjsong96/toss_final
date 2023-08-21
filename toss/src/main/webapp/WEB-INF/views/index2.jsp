<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
	$("#check").click(function() {
		let input = $("#aaccount").val();
		if (input === "") {
			alert("계좌번호를 입력해주세요.")
			$("#aaccount").focus();
			return false;
		}	
	});
});


</script>
	
</head>
<body>
	<div id = "loginBox">
		<form action="./send" method="post">
    <p>계좌번호: ${aaccount}</p>
    <input type="hidden" name="aaccount" value="${aaccount}">
    <button id="check"><b>확인</b></button>
</form>
	</div>
</body>
</html>