<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/login.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".button_login").click(function(){
		let mphone = $("#mphone").val();
		let mpw=$("#mpw").val();
		
		let mphone_reg = /[^0-9]/g; //숫자ㄴ
		
		
		if (mphone == "" || mphone.length < 11) {
			$("#mphone").focus();
			$("#mphoneMsg").text("핸드폰 번호를 입력하세요.(11자리)");
			$("#mphoneMsg").css("color", "red");
			return false;
		} else {
			$("#mphoneMsg").empty();
		}

		if (mphone_reg.test(mphone)) {
			$("#mphone").focus();
			$("#mphoneMsg").text("영어/한글/특수문자는 사용할 수 없습니다.");
			$("#mphoneMsg").css("color", "red");
			return false;
		} else {
			$("#mphoneMsg").empty();
		}
		
		if (mpw == "" || mpw.length != 5) {
			$("#mpw").focus();
			$("#mpwMsg").text("비밀번호를 입력하세요.(숫자4자리+영어1자리)");
			$("#mpwMsg").css("color","red");
			return false;
		}else{
			$("#mpwMsg").empty();
		}
		
		});
	});
</script>

<body>
	<div class="nav_container">
		<div class="content_signin">
			<div class="signin_selection_group">
				<div class="login_form">
					<div class="signin_swiper" id="otp">
						<div class="signin-section">
							<div>
							<img src="./resources/img/toss.png" alt="토스로고" />
							<form action="./login" method="post">
								<input class="signin_id"type="text" name="mphone" id="mphone" maxlength="11" placeholder="휴대폰번호">
								<br>
								<span id="mphoneMsg"></span> <br><br>
								<input class="signin_pw"type="password" name="mpw" id="mpw" maxlength="5" placeholder="비밀번호">
								<br>
								<span id="mpwMsg"></span> <br>
								<button type="submit" class="button_login" id="button_login"> 로그인 </button> <br>
							</form>
							<button type="button" onclick="location.href='./register'" id="button_login"> 회원가입 </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>