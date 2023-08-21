<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/send5.css">
<meta charset="UTF-8">
<title>보내기5</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="total">
		<div class="send_content">
			<div class="back">
				<a href="./list" style="text-decoration-line: none"> <img
					alt="사진없음" src="./img/arrow2.png"><span
					style="font-size: 25px"></span>
				</a>
	</div>
	<div class="check">
	<img alt="사진없음" src="./img/check128.png">
	</div>
	<form action="./main" method="post">
	<input type="hidden" name="aaccount" value="${list[0].aaccount}">
	<input type="hidden" id= "trAccount1" name="trAccount1" value="${list2[0].aaccount}">
	<input type="hidden" id= "trAbank1" name="trAbank1" value="${list2[0].abank}">
	<div class="middle_content">
	<h1>${list3.trholder0} 님에게 </h1>
	<h1>${list3.tamount} 원을 보냈어요</h1> 
	<button class="memo" onclick="location.href='./memo'">메모남기기</button><br>
	</div>
	<div class="bottom_button">
	<button onclick="location.href='./memo'">공유하기</button>
	<button>확인</button>
	</div>
	</form>
	</div>
	</div>
</body>
</html>