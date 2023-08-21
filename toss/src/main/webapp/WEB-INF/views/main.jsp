<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
</style>
<link rel="stylesheet" href="./resources/css/main.css">
<style>*{font-family: 'Noto Sans KR', sans-serif;}</style>



<script src="./js/jquery-3.7.0.min.js"></script>

</head>
<body>

<div class="mainScreenArea">

	<a id="stop" href="./list" style="text-decoration-line: none">
	<img alt="" src="./img/arrow2.png"><span style="font-size: 30px">TOSS</span>
	</a>

   <h3 id="accountInfo" style="cursor: pointer;">${accountInfo.abank } ${accountInfo.aaccount}</h3>
   <span id="copyAcc" class="copyAcc">계좌번호가 클립보드에 복사되었습니다.</span>
   <h1><fmt:formatNumber value="${accountInfo.abalance }" pattern="#,###" />원</h1>
   
	<form action="./charge3" method="post" style="display: inline;">
		<button id="chargeBtn" type="submit">채우기</button>
		<input type="hidden" name="aaccount" value="${accountInfo.aaccount}">
	</form>
	<form action="./send2" method="post" style="display: inline;">
		<button id="sendBtn" type="submit">보내기</button>
		<input type="hidden" name="aaccount" value="${accountInfo.aaccount}">
	</form>
   <br>


    <button id="openPopup">전체</button><img alt="" src="./img/arrow3.png" id="openPopupImg">
    

    <div class="overlay" id="overlay"></div>
    <div class="popup" id="popup">
        <span>내역 선택</span><button class="closePopup"><img alt="닫기" src="./img/x.png" id="closePopupImg"></button><br>
        <button type="button" class="closePopup selectBtn" onclick="changeList('-1')">전체</button><br>
        <button type="button" class="closePopup selectBtn" onclick="changeList('1')">입금</button><br>
        <button type="button" class="closePopup selectBtn" onclick="changeList('0')">출금</button><br>
    </div>
    
   <div class="transactionListBoard"></div>
   
</div>
    
<script type="text/javascript">
	let copyAccVisible = false;

	document.getElementById("accountInfo").addEventListener("click", function() {
		const accountInfoText = "${accountInfo.aaccount}";
		copyToClipboard(accountInfoText);
		toggleCopyAcc();
	});

	function copyToClipboard(text) {
		const textarea = document.createElement("textarea");
		textarea.value = text;
		document.body.appendChild(textarea);
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
	}

	function toggleCopyAcc() {
		const popup = document.getElementById("copyAcc");
		copyAccVisible = !copyAccVisible;
		if (copyAccVisible) {
			popup.classList.remove("hide");
			popup.classList.add("show");
			setTimeout(function() {
				popup.classList.remove("show");
				popup.classList.add("hide");
			}, 2000);
		}
	}
	
	document.getElementById("openPopup").addEventListener("click", function() {
		document.getElementById("overlay").style.display = "block";
		document.getElementById("popup").style.display = "block";
	});

   document.getElementById("openPopup").addEventListener("click", function() {
       document.getElementById("overlay").style.display = "block";
       document.getElementById("popup").style.display = "block";
   });

   let closeButtons = document.getElementsByClassName("closePopup");
   for (var i = 0; i < closeButtons.length; i++) {
       closeButtons[i].addEventListener("click", function() {
           document.getElementById("overlay").style.display = "none";
           document.getElementById("popup").style.display = "none";
       });
   }

   let allButtons = document.querySelectorAll("button[type='button']");
   allButtons.forEach(function(button) {
       button.addEventListener("click", function() {
           document.getElementById("openPopup").innerHTML = this.innerHTML;
       });
   });
   
   function changeList(value){
      $.ajax({
         url : "./chgList",
         type : "post",
         data : {"option" : value, "aaccount": ${accountInfo.aaccount}},
         dataType : "json",
         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         success : function(data){
            
            $(".transactionListBoard").empty();
            
            let ndate = 0;
            $.each(data.transactionList, function (index, transaction) {
               
               let html = "";
               
               let date = data.transactionDate[index];
               if(ndate != date.date){
                  html += '<div class="dateDiv">';
                  html += date.month + "월" + date.date + "일";
                  html += "</div>";
                  
                  ndate = date.date;
               }

               html += '<div class="tableDiv">';
               html +=    "<table>";
               html +=       "<tr>";
               html +=          '<td class="thistory">';
               html +=               transaction.thistory;
               html +=          "</td>";
               if(transaction.ttoggle == 0) html += '<td class="tmamount">' + "-" + transaction.tamount;
               if(transaction.ttoggle == 1) html += '<td class="tpamount">' + transaction.tamount;
               html +=          "</td>";
               html +=       "</tr>";
               html +=       "<tr>";
               html +=          '<td class="tdate">';
               html +=               date.hour + ":" + date.minute;
               html +=          "</td>";
               html +=          '<td class="tbalance">';
               html +=             transaction.tbalance;
               html +=          "</td>";
               html +=       "</tr>";
               html +=    "</table>";
               html += "</div>";
				$(".transactionListBoard").append(html);
				});
         },
         error : function(error){
            alert("ERROR : " + error);
         }
      });
   }
</script>
</body>
</html>