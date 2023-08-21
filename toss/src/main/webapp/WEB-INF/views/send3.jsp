<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/send3.css">

<meta charset="UTF-8">
<title>보내기3</title>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap')
	;
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {//회원 ajax
		
		$("#dbCheck2").click(
				function() {
					let trAccount1 = $("#trAccount1").val();
					let trAbank1 = $(".trAbank1").val();
					$.ajax({
						url : "./sendCheck2", //어디로 갈지
						type : "post", //타입
						data : {
							"aaccount" : trAccount1,
							"abank" : trAbank1
						}, //어떤 값으로
						dataType : "json", // {result : 0}
						success : function(data) {
							//alert(data.result); //데이터에서 result 값만 뽑겠다.
							if (data.result == 1) {
								$("#resultMSG").text("올바른 계좌입니다.");
								$("#resultMSG").css("color", "green").css(
										"font-weight", "bold").css("font-size",
										"10pt")

								let form = $("<form></form>");
								form.attr("action", "./send4");
								form.attr("method", "post");

								let list = $("#aaccount").val();
								console.log(list);
								let input = $("<input>");
								input.attr("type", "hidden");
								input.attr("name", "aaccount");
								input.val(list);

								let list2 = $("#trAccount1").val();
								let input2 = $("<input>");
								input2.attr("type", "hidden");
								input2.attr("name", "trAccount1");
								input2.val(list2);

								let list3 = $(".trAbank1").val();
								let input3 = $("<input>");
								input3.attr("type", "hidden");
								input3.attr("name", "trAbank1");
								input3.val(list3);

								form.append(input);
								form.append(input2);
								form.append(input3);

								let button = $("<button></button>");
								button.text("다음");
								button.attr("type", "submit");
								$("#next").append(form);

								button.click(function() {
									window.location.href = "./send4?aaccount="
											+ encodeURIComponent(list);
								}); // 버튼 클릭 시 페이지 이동
								form.append(button);
							} else {
								$("#resultMSG").text(
										"올바르지 않은 계좌입니다. 다시 입력해주세요.");
								$("#resultMSG").css("color", "red").css(
										"font-weight", "bold").css("font-size",
										"10pt")
								$("#aaccount").focus();
								return false;
							}
							//$("#resultMSG").text("성공시 결과값 : " + data);
						}, //서버에서 날라오는 데이터이다.
						error : function(request, status, error) {
							$("#resultMSG").text("오류가 발생했습니다. 가입할 수 없습니다.");
						}
					}); //ajax 끝
				}); //acCheck 끝
	});
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
				<form action="./send4" method="post">
					<input type="hidden" id="aaccount" name="aaccount"
						value="${list[0].aaccount}">
					<h3>${list[0].abank}${list[0].aaccount}</h3>
				</form>
				<h1>어떤 계좌로 보낼까요?</h1>
				<!-- 	<form action="./send3" method="post"> -->
				<div class="ac_input">
				<span>계좌번호 입력</span><br> <input type="text"
					placeholder="계좌번호 입력" id="trAccount1" name="trAccount1"><br>
				</div>
				<div class="bank_choose">
				<span>은행선택</span><br> <select class="trAbank1" name="trAbank1">
					<option value="은행선택">은행선택</option>
					<option value="NH농협">NH농협</option>
					<option value="카카오뱅크">카카오뱅크</option>
					<option value="KB국민">KB국민</option>
					<option value="신한">신한</option>
					<option value="우리">우리</option>
					<option value="토스뱅크">토스뱅크</option>
					<option value="IBK">IBK기업</option>
					<option value="하나">하나</option>
					<option value="새마을">새마을</option>
				</select><span id="resultMSG"></span><br>
				</div>
				<button id="dbCheck2">계좌확인</button><div id="next"></div>
				<!-- 	</form> -->
			</div>
		</div>
	</div>
</body>
</html>