<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/list.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
   function link(url) {
      window.location.href = url;
   }

   function tossButtonClick(tossBalance) {
      if (tossBalance) {
         // tossAbalance가 비어있지 않으면 detail 페이지로 이동
         window.location.href = './detail';
      } else {
         // tossAbalance가 비어있으면 open 페이지로 이동
         window.location.href = './open';
      }
   }

   function logout() {
      let name = "<c:out value='${sessionScope.mname}'/>";
      let chk = confirm(name + "님 로그아웃 하시겠습니까?");
      if (chk) {
         location.href = "./logout";
      }
   }
</script>

<c:choose>
   <c:when test="${sessionScope.mname eq null}">
      <button onclick="location.href='./'">로그인</button>
   </c:when>
   <c:otherwise>
               ${sessionScope.mname }님 안녕하세요.
            <button onclick="logout()">로그아웃</button>
   </c:otherwise>
</c:choose>


</head>
<body>
   <!--     
   <button type="button" class="btn1" id = "tossButton">
      <div class="tossbank">토스뱅크</div>
      <span id="tossBalance"></span>
</button>-->

<div class="edge">
         <div class="btnList">
            <button type="button" class="totalbtn">
               <div class="total" >
                  총자산금액
                  </div>
                   <div class="balance">
                  	<fmt:formatNumber value="${totalbalance}" pattern="#,###" />원
              </div>
            </button>


            <div class="accList">
               <button type="button" class="accbtn" onclick="link('open')">
                  <div class="tossopen">토스뱅크 계좌개설</div>
               </button>



               <c:forEach items="${tossBank}" var="toss">
                  <div class="acc-container">
                     <form action="./main" method="post">
                        <input type="hidden" name="aaccount" value="${toss.aaccount}" />
                        <button  class="accbtn">
                           <div class="tossbank">${toss.abank}</div>
                           <div class="balance">
                           <fmt:formatNumber value="${toss.abalance}" pattern="#,###"/>원
                        </div>
                        </button>
                     </form>

                     <form action="./send2" method="post">
                        <input type="hidden" name="aaccount" value="${toss.aaccount}" />
                        <button class="sendBtn">송금</button>
                     </form>
                  </div>
               </c:forEach>


               <c:forEach items="${otherBank}" var="other">
                  <div class="acc-container">
                     <form action="./main" method="post">
                        <input type="hidden" name="aaccount" value="${other.aaccount}" />
                        <button  class="accbtn">
                           <div class="otherbank">${other.abank}</div>
                            <div class="balance">
                           <fmt:formatNumber value="${other.abalance}" pattern="#,###"/>원
                           </div>
                        </button>
                     </form>

                     <form action="./send2" method="post">
                        <input type="hidden" name="aaccount" value="${other.aaccount}" />
                        <button class="sendBtn">송금</button>
                     </form>
                  </div>
               </c:forEach>
            </div>
         </div>
  </div>
</body>
</html>