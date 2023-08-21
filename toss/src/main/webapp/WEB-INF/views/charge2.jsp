<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 돈 채우기</title>
</head>
<body>
	<h1>어떤 계좌에서 돈을 가져올까요?</h1>
	<form action="./charge3" method="post">
		<input id=aaccount name="aaccount" value="${aaccount}">
		<button>계좌번호</button>
	</form>
	<table>
		<c:forEach items="${list }" var="row">
			<h1>${row.abank } / ${row.mphone } / ${row.abalance }원</h1>
		</c:forEach>
	</table>
	<hr>
</body>
</html>
