<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>, 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/open3.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

	function link(url) {
		window.location.href = url;
	}


	$(document).ready(function() {
	$("input:radio[name='yn']").click(function() {
		if ($("input[name='yn']:checked").val() == '1') {
			alert("${mname}님이 쓸 계좌만 만들 수 있어요 자금 세탁 방지를 위해, 다른 사람이 쓸 계좌는 만들 수 없어요");
			$('.yesbutton').attr('disabled', true);
		} else {
			$('.yesbutton').attr('disabled', false);
		}
	});
	 });

	$(document).ready(function() {
		$('.yesbutton').click(function() {        
	        
	        const holderNameInput = document.getElementById("holderName");
	        const warningMessage = document.getElementById("warningMessage");

	        const holderName = holderNameInput.value.trim();
	        
	        
	        if (holderName === "") {
	            // 예금주명이 비어있는 경우 경고 메시지 표시
	            warningMessage.textContent = "예금주명을 입력해주세요.";
	            return false;
	        }
	        
		});
	 });

</script>


<title>Insert title here</title>
</head>
<body>
<div class="edge">
	<h1>${mname }님의 정보를 확인해주세요</h1><br>
	<div class="index">이름</div><p>
	${mname }<br><br>
	<div class="index">예금주명</div><p>
 <form action="./open4" method="post" id="inputForm">
       <input type="text" id="holderName" name="aholder">
        <p id="warningMessage" style="color: red;"></p>
	<br><br>
	<div class="index">휴대폰 번호</div>
	<p>${mphone }<br><br>
	<div class="index">직업</div>
	<p>
		<select name="job" id="job" style="width: 200px; height: 30px">
			<option value="1">직장인</option>
			<option value="2">전문직</option>
			<option value="3">공무원</option>
			<option value="4">자영업자</option>
			<option value="5">프리랜서</option>
			<option value="6">주부</option>
			<option value="7">학생</option>
			<option value="8">무직</option>
			<option value="9">기타</option>
		</select>
		<br><br>
	<div class="index">${mname }님이 쓸 계좌인가요?</div><p>
	<div class="yes">
		<input type="radio" name="yn" value="0" id="y" class="yn" checked>
		<label for="y">네</label> <input type="radio" name="yn" value="1"
			id="n" class="yn"> <label for="n">아니요</label>
	</div>
	<br><br><br><br>
	<div class="yesbutton">
      <button class="yesbutton" id="yesbutton">확인</button></div>
</form>
</div>
</body>
</html>