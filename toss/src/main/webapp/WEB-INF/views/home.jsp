<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<script src="./js/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	  function link(url) {
          window.location.href = url;
      }
  
	  document.addEventListener("DOMContentLoaded", function() {
		    const connectButton = document.getElementById("connectButton");
		    const messageArea = document.getElementById("messageArea");
		    
		    connectButton.addEventListener("click", function() {
		        // 여기에 abank 값을 가져오는 로직을 추가해야 합니다.
		        const hasAbankValue = true; // abank 값을 가지고 있는지 여부를 확인하는 변수
		        
		        if (hasAbankValue) {
		            // abank 값을 가지고 있으면 ./list 페이지로 이동
		            window.location.href = "./list";
		        } else {
		            // abank 값을 가지고 있지 않으면 경고 메시지 표시
		            messageArea.innerHTML = "abank 값을 갖고 있지 않습니다. 연결할 수 없습니다.";
		        }
		    });
		});
	</script>
</head>
<body>
<h1>
	토스뱅크 계좌가 없으시군요 
</h1>

<button onclick="link('open')">  토스뱅크 계좌 개설하기 </button><p>
<button class="connect" onclick="link('list')">  기존 보유 계좌 연결하기 </button>
 <div id="message"></div>
</body>
</html>
