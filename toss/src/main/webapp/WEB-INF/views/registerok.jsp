<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/register.css">
<script type="text/javascript">

function link(url) {
    window.location.href = url;
}
</script>
</head>

<body>

<div class="nav_container">
		<div class="content_signin">
			<div class="signin_selection_group">
				<div class="login_form">
					<div class="signin_swiper" id="otp">
						<div class="signin-section">
							<div>
							<img src="./resources/img/toss.png" alt="토스로고" />
							<h1>회원가입 성공</h1>
							<button id="register_login" onclick= "location.href='./'">로그인하기</button>							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- <button onclick="link('open')">  토스뱅크 계좌 개설하기 </button><p>
<button class="connect" onclick="link('list')">  기존 보유 계좌 연결하기 </button> -->


</body>
</html>