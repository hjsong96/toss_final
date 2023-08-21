<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채우기5</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
<link rel="stylesheet" href="./resources/css/charge.css">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="mainScreenArea">

		<a id="stop" href="./list" style="text-decoration-line: none"> <img
			alt="" src="./img/arrow2.png"><span style="font-size: 30px">TOSS</span>
		</a>

	<div class="check">
	<img alt="사진없음" src="./img/check128.png">
	</div>

	<form action="./charge" method="post">
	<input type="hidden" name="aaccount" value="${list[0].aaccount}">
	<input type="hidden" id= "trAccount0" name="trAccount" value="${list2[0].aaccount}">
	<input type="hidden" id= "trAbank0" name="trAbank" value="${list2[0].abank}">
	<div class="middle_content">
	<h1>${list3.tamount} 원을 보냈어요</h1>
	</div> 
	<button id="chargeCheck">확인</button>
	</form>
	</div>
</body>
</html>