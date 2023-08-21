<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/register.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>

<script type="text/javascript">
$(function(){
		$("#mphoneCheck").click(function(){
		let mphone = $("#mphone").val();
		let mphone_reg = /[^0-9]/g; //숫자만
		
		// test()는 인수로 전달된 문자열에 특정 패턴과 일치하는 문자열이 있는지를 검색합니다
       // test()는 패턴과 일치하는 문자열이 있으면 true를, 없으면 false를 반환합니다
		
		if (mphone == "" || mphone.length < 11) {
			$("#mphone").focus();
			$("#mphoneMsg").text("11자를 입력하세요.(숫자만)");
			$("#mphoneMsg").css("color","red");
			return false;
		}
		
		if (mphone_reg.test(mphone)) {
			$("#mphone").focus();
			$("#mphoneMsg").text("영어/한글/특수문자는 사용할 수 없습니다.");
			$("#mphoneMsg").css("color","red");
			return false;
		}
		
			$.ajax({
				url:"./checkmphone",  
				type:"post",
				data:{"mphone" : mphone},
				dataType : "json", 
				success:function(data){
					if(data.result == 1){
						$("#mphone").focus();
						$("#mphoneMsg").text("이미 등록된 번호 입니다.");
						$("#mphoneMsg").css("color","red");
						$('.button_register').attr('disabled', true);
						$('#mname').attr('disabled', true);
						$('#mpw').attr('disabled', true);
						$('#mpw2').attr('disabled', true);
						$('#mphone').css("border","1px solid red");
						$('#mname').val("").css("border","1px solid red");
						$('#mpw').val("").css("border","1px solid red");
						$('#mpw2').val("").css("border","1px solid red");
						$("#mnameMsg").empty();
						$("#mpwMsg").empty();
						$("#mpwMsg2").empty();

					} else{
						$("#mphoneMsg").text("사용할 수 있는 번호 입니다.");							
						$("#mphoneMsg").css("color","green");
						$('.button_register').attr('disabled', false);
						$('#mname').attr('disabled', false);
						$('#mpw').attr('disabled', false);
						$('#mpw2').attr('disabled', false);
						$('#mphone').css("border","1px solid #666666");
						$('#mname').val("").css("border","1px solid #666666");
						$('#mpw').val("").css("border","1px solid #666666");
						$('#mpw2').val("").css("border","1px solid #666666");
					}
				},
					error : function(request, status, error){
					$("#mphoneMsg").text("오류가 발생했습니다. 가입할 수 없습니다.");
				}
			});
		});
		

	$(".button_register").click(function() {
			let mphone = $("#mphone").val();
			let mname = $("#mname").val();
			let mpw = $("#mpw").val();
			let mpw2 = $("#mpw2").val();
			
			let mphone_reg = /[^0-9]/g; //숫자ㄴ
			let mname_reg =  /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]/; //한글 영어만
			let mpw_reg = /[^0-9]/g; //숫자ㄴ
			
			// test()는 인수로 전달된 문자열에 특정 패턴과 일치하는 문자열이 있는지를 검색합니다
           // test()는 패턴과 일치하는 문자열이 있으면 true를, 없으면 false를 반환합니다
			
           if (mphone == "" || mphone.length < 2) {
				$("#mphone").focus();
				$("#mphoneMsg").text("번호를 입력해주세요");
				$("#mphoneMsg").css("color", "red");
				return false;
			}
			
			if (mname == "" || mname.length < 2) {
				$("#mname").focus();
				$("#mnameMsg").text("이름은 2글자 이상 한글/영어만");
				$("#mnameMsg").css("color", "red");
				return false;
			} else{
				$("#mnameMsg").empty();
			}
			
			if (mname_reg.test(mname)) {
				$("#mname").focus();
				$("#mnameMsg").text("영어/한글만 입력해주세요.");
				$("#mnameMsg").css("color", "red");
				return false;
			} 

			if (mpw == "" || mpw.length != 5) {
				$("#mpw").focus();
				$("#mpwMsg").text("비밀번호는 5자리 입니다.");
				$("#mpwMsg").css("color", "red");
				return false;
			} else{
				$("#mpwMsg").empty();
			}
			
			if (mpw_reg.test(mpw)) {
				$("#mpw").focus();
				$("#mpwMsg").text("숫자만 입력해주세요.");
				$("#mpwMsg").css("color", "red");
				return false;
			}

			if (mpw2 == "" || mpw2.length != 5) {
				$("#mpw2").focus();
				$("#mpwMsg2").text("비밀번호는 5자리입니다.");
				$("#mpwMsg2").css("color", "red");
				return false;
			}  else{
				$("#mpwMsg").empty();
			}

			if (mpw_reg.test(mpw2)) {
				$("#mpw2").focus();
				$("#mpwMsg2").text("숫자만 입력해주세요.");
				$("#mpwMsg2").css("color", "red");
				return false;
			} 

		})

	});
	
	  $(function(){
		$("#mpw").keyup(function(){
		let mpw = $("#mpw").val();
		let mpw2 = $("#mpw2").val();
		
		if (mpw == mpw2) {
			$("#mpwMsg2").text("비밀번호가 일치합니다.");
			$("#mpwMsg2").css("color", "green");
			$(".button_register").attr("type", "submit");
		} else {
			$("#mpwMsg2").text("비밀번호가 일치하지 않습니다.");
			$("#mpwMsg2").css("color", "red");
			}
		
		if(mpw.length==0 && mpw2.length==0){
			$("#mpwMsg2").text("");
		}
		})

		$("#mpw2").keyup(function(){
		let mpw = $("#mpw").val();
		let mpw2 = $("#mpw2").val();
		
		if (mpw == mpw2) {
			$("#mpwMsg2").text("비밀번호가 일치합니다.");
			$("#mpwMsg2").css("color", "green");
			$(".button_register").attr("type", "submit");
		} else {
			$("#mpwMsg2").text("비밀번호가 일치하지 않습니다.");
			$("#mpwMsg2").css("color", "red");
			}
		if(mpw.length==0 && mpw2.length==0){
			$("#mpwMsg2").text("");
		}
		})
	}); 

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
							<h1>회원가입</h1>
							<form action="./register" method="post">
							<div class="inline">
								<input class="register_phone" type="text" name="mphone" id="mphone" maxlength="11" placeholder="휴대폰번호">
								<button type="button" id="mphoneCheck" class="mphoneCheck" > 중복검사</button>
							</div>
								<br>
								<span id="mphoneMsg" ></span><br><br>
								<input class="register_input" type="text" name="mname" id="mname" maxlength="20" placeholder="이름" disabled="disabled">
								<br>
								<span id="mnameMsg" ></span><br><br>
								<input class="register_input" type="password" name="mpw" id="mpw" maxlength="5" placeholder="비밀번호" disabled="disabled">
								<br>
								<span id="mpwMsg" ></span><br><br> 
								<input class="register_input" type="password" name="mpw2" id="mpw2" maxlength="5" placeholder="비밀번호확인" disabled="disabled">
								<br>
								<span id="mpwMsg2" ></span><br>
								<button type="button" class="button_register" id="register_login" disabled="disabled">회원가입</button>
							</form>
							<button type="button" onclick="location.href='./'" id="register_login">홈으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>