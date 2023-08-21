<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/send2.css">
<meta charset="UTF-8">
<title>보내기2</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
<script type="text/javascript">
	/* document.addEventListener("DOMContentLoaded", function() {
	 var stopLink = document.querySelector("#stop");
	
	 stopLink.addEventListener("click", function(event) {
	 event.preventDefault();  // Prevent default link behavior
	
	 history.pushState(null, null, location.href);

	 window.onpopstate = function(event) {
	 history.go(1);
	 };
	
	 window.addEventListener("beforeunload", function(event) {
	 event.returnValue = "이 페이지를 떠나시겠습니까?";
	 });
	 });
	 }); */
</script>
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
			<div class="top_area">
				<h1>어디로 돈을 보낼까요?</h1>
				<div class="big_button">
					<button class="accountBtn" onclick="location.href='./account'">계
						좌</button>
					<button class="contactBtn" onclick="location.href='./contact'">연
						락 처</button>
				</div>
				<div class="ac_input">
					<form action="send3" method="post">
						<button>계좌번호 입력</button>
						<input type="hidden" name="aaccount" value="${list[0].aaccount}" />
						<!-- <input id=aaccount name="aaccount" placeholder="보낼 계좌를 입력하세요."> -->
					</form>
				</div>
					<div class="my_account" onclick="location.href='./myAccount'">내계좌
						확인하기</div>
				<div class="bottom_area">
				<div class="latest_accout">최근 보낸 계좌</div>
				<img alt="이미지 없음" src="./img/fake2.jpg"> <img alt="이미지 없음"
					src="./img/fake2.jpg"> <img alt="이미지 없음"
					src="./img/fake2.jpg"> <img alt="이미지 없음"
					src="./img/fake2.jpg">
				<!-- 					 <br> 최근 보낸
					계좌(DESC 10개만) <br> NH 농협 1001 ★ <br> 신한 2002 ★ <br>
					... -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<!-- <form action="./send3" method="post"> -->