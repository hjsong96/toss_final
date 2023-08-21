<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

			<c:choose>
				<c:when test="${sessionScope.mname eq null}">
					<button onclick="location.href='./'">로그인</button>			
				</c:when>
				<c:otherwise>
					${sessionScope.mname }님 안녕하세요.
				<button onclick="logout()">로그아웃</button>
				</c:otherwise>
			</c:choose>


<script>	
	function logout(){
		let name = "<c:out value='${sessionScope.mname}'/>";
		let chk = confirm(name+"님 로그아웃 하시겠습니까?");
		if(chk){
			location.href="./logout";
		}
	}
</script>

