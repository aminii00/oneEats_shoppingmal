<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      isELIgnored="false"%>       
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "contextPath" value= "${pageContext.request.contextPath}" />
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">
<title>로그인창</title>
<script>
    const getToken = () => {

// 인증확인 버튼 활성화
document.getElementById("completion").setAttribute("style","background-color:yellow;")
document.getElementById("completion").disabled = false;

if (processID != -1) clearInterval(processID);
const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
document.getElementById("certificationNumber").innerText = token;
let time = 180;
processID = setInterval(function () {
  if (time < 0 || document.getElementById("sendMessage").disabled) {
    clearInterval(processID);
    initButton();
    return;
  }
  let mm = String(Math.floor(time / 60)).padStart(2, "0");
  let ss = String(time % 60).padStart(2, "0");
  let result = mm + ":" + ss;
  document.getElementById("timeLimit").innerText = result;
  time--;
}, 50);
};

function checkCompletion(){
alert("문자 인증이 완료되었습니다.")
initButton();
document.getElementById("completion").innerHTML="인증완료"
document.getElementById("signUpButton").disabled = false;
document.getElementById("signUpButton").setAttribute("style","background-color:yellow;")
}
</script>
<style>
    :root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--naver-green-color: #04c75a;
	--naver-green-border-color: #06b350;
}




</style>
<c:choose>
	<c:when test = "${result=='loginFailed' }">
	<script>
	window.onload=function(){
		alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요");
	}
	</script>
	</c:when>
	</c:choose>
</head>
<body>
<form method = "post" action = "${contextPath}/member/updatePw.do">
<br>
<br>
<br>
<div class="main-container">
    <div class="main-wrap">
    <header>
        <div class="textbold textsize-4">
            비밀번호 찾기
            <br>
        </div>
        <br>
    </header>
        <div>
            새 비밀번호 등록 
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 " name ="pwd" placeholder=" 새 비밀번호를 입력해주세요." type="password"></input>
            <p class = "textsize-1  textcolor-red margin-id">10자 이상 입력</p>
            <p class =" textsize-1  textcolor-red margin-id">영문/숫자/특수문자(공백제외)만 허용하며, 2개 이상 조합</p>
            <p class =" textsize-1  textcolor-red margin-id">동일한 숫자  3개 이상 연속 사용 불가</p><br>
        </div>
        <div>
            새 비밀번호 확인
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 " placeholder=" 새 비밀번호를 한 번 더 입력해주세요." type="password"></input>
           
        </div>
      
        <button type="submit" class = "btn-midlong bg-lightgreen textsize-1 textbold input btn-round textcolor-white border-0" >
             확인</button>
    </div>
</div>
<br>
<br>
<br>
<br>  
</body>
</html>
<table>

</table>
</form>
</body>
</html>