<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/send4.css">
<meta charset="UTF-8">
<title>보내기4</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	$(function() {
		$("#send").click(function() {
			
			let tHistory = $(".tHistory1").val();
			if (tHistory.length > 14 ) {
				alert("14자리 이하만 가능합니다.");
				return false;
			}
			
			if (tHistory == null || tHistory === "") {
				$(".tHistory1").val("${list[0].aholder}");
			}
			
			let tgCheck0 = $("#aaccount").val();
			let tgCheck1 = $("#trAccount1").val();

			if (tgCheck0 != null) {
				$(".ttoggle0").val(0);
			}
			
			if (tgCheck1 !=null) {
				$(".ttoggle1").val(1);
			}
			

			let trbalance0 = parseFloat($(".trbalance0").val()); //출금
			let trbalance1 = parseFloat($(".trbalance1").val()); //입금
			let tamount = parseFloat($(".tamount").val());
			
	        if (isNaN(tamount) || tamount <= 0) {
	            alert("올바른 금액을 입력해주세요.");
				$(".tamount").focus();
	            return false;
	        }

			if (trbalance0 < tamount ) {
				alert("잔액이 부족합니다. 다시 입력해주세요.")
				$(".tamount").focus();
				$(".alertB").text("잔액 ${list[0].abalance} 원 내에서 입력해주세요").css("color", "red").css("font-weight", "bold").css("font-size", "13pt");
				return false;
			}
			
			
			trbalance0 = trbalance0 - tamount;
			trbalance1 = trbalance1 + tamount;
			$(".trbalance0").val(trbalance0);
			$(".trbalance1").val(trbalance1);
		});
	});
//출금0 입금1
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
	<form action="./send5" method="post">
	<input type="hidden" id= "aaccount" name="aaccount" value="${list[0].aaccount}">
	<input type="hidden" class= "trAbank0" name="trAbank0" value="${list[0].abank}">
	<input  type="hidden" class="trholder0" name="trholder0" value="${list[0].aholder}">
	<input  type="hidden" class="trbalance0" name="trbalance0" value="${list[0].abalance}">
	<br>
	<input type="hidden" id= "trAccount1" name="trAccount1" value="${list2[0].aaccount}">
	<input type="hidden" class="trAbank1" name="trAbank1" value="${list2[0].abank}">
	<input type="hidden" class="trholder1" name="trholder1" value="${list2[0].aholder}">
	<input  type="hidden" class="trbalance1" name="trbalance1" value="${list2[0].abalance}">
	<h1>내 ${list[0].abank} 통장에서 ${list[0].aholder} 님이 </h1>
	<h3>잔액 <fmt:formatNumber value="${list[0].abalance}" pattern="#,###" /> 원</h3>
	<h1>${list2[0].aholder} 님에게</h1>
	<h3>${list2[0].abank} ${list2[0].aaccount}</h3>
	<div>
	<input class= "tamount" name="tamount" type="text" placeholder="얼마나 보낼까요?">
	</div>
	<h3 class="alertB">잔액 <fmt:formatNumber value="${list[0].abalance}" pattern="#,###" /> 원 입력</h3>
	<input class="tHistory1" name="tHistory1" placeholder="받는 분에게 표시"><br>
	<button id="send">보내기</button>
	<input type="hidden" class="tHistory0" name="tHistory0" value="${list2[0].aholder}" >
	<input type="hidden" class="ttoggle0" name="ttoggle0"><br>
	<input type="hidden" class="ttoggle1" name="ttoggle1">
	</form>
	</div>
	</div>
</body>
</html>
<!-- 	<button onclick="window.location.href='./send5'; return false;">보내기</button> -->