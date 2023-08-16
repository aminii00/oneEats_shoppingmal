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
<form method = "post" action = "${contextPath}/member/loginForm.do">
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
            이름 
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 " placeholder=" 이름을 입력해주세요." type="text"></input>
            
        </div>
        <div>
            아이디 
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 " placeholder=" 아이디를 입력해주세요." type="text"></input>
            
        </div>
        <div class="margin_bottom_plus">
            휴대폰 번호
            <br>
            <input class ="brd-lightgray btn-round margin1 btn-midlong textsize-1" placeholder=" 휴대폰 번호를 입력해주세요." type="text"></input>
        </div>
        <div>
        <input class ="brd-lightgray btn-round margin1 btn-midlong-input textsize-1 " placeholder=" 휴대폰 번호를 입력해 주세요." type="text"></input>
        &nbsp
        <button class = "btn-fatfat-mina bg-lightgreen textsize-0 border-0 margin btn-round textbold">
            인증번호요청
        </button><br>
    </div>
        <input class ="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin-id " placeholder=" 인증번호를 입력하세요." type="text"></input>
        <div>
            <span class = "textsize-0  textcolor-red btn-midlong textbold">인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호 차단 여부를 확인해 주세요.</span><br>
            </div>
       <br>
    <button class = "btn-midlong brd-lightgray textsize-1 textbold input btn-round textcolor-white border-0">
        인증번호 받기</button>
        <button class = "btn-midlong bg-lightgreen textsize-1 textbold input btn-round textcolor-white border-0">
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