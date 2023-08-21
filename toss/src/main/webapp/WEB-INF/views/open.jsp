<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/open.css">
  <script>
        function link(url) {
            window.location.href = url;
        }
    </script>


<title>Insert title here</title>
</head>
<body>

<div class="edge">
<div class="open">
<div class="title">
<br>
<h3>토스뱅크 통장</h3><br>
<h1>조건 없는 통장,<p>
하나로 끝</h1></div>
<img alt="" src="./img/tossopen.jpg" class="imgsize">
<br>
<div class="leftbox">
<div class="left">
모두에게<p>
조건 없는 연 2%<p></div>
<div class="left2">
이제 더이상 까다로운 조건을 알 필요 없어요<p>
하루만 넣어도 이자를 드릴게요<p>
연 2% 금리(세전)
</div>
</div>
<br><br>
<button class="openBtn" onclick="link('open2')">통장 만들기</button>
</div>
</div>

  
</body>
</html>