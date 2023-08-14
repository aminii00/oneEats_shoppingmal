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
.login-main{
    align-items: center;
    width: 390px;
    height:auto;
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
<form method = "post" action = "${contextPath}mainPage.do">
<br>
<br>
<br>
<div class="main-container">
    <div class="main-wrap">
    <header>
        <div class="textbold textsize-4">
            로그인
            <br>
        </div>
        <br>
    </header>
        <div>
             <input class =" brd-lightgray btn-round margin btn-midlong textsize-1 " placeholder=" 아이디 입력" type="text" value="#" disabled></input>
        </div>

        <div>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1" placeholder=" 비밀번호 입력(8-12자 대소문자+숫자+특수문자)" type="password"></input>
        </div>
        <div class = "textsize-1" align:right>
           
           <input type ="checkbox" name="idcheck">
            아이디 저장&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="${contextPath}/idSearchForm.do">아이디찾기</a>/
            <a href="${contextPath}/pwSearchForm.do">비밀번호 찾기</a>/
            <a href="${contextPath}/registerTypeSelect.do">회원가입</a>
        </div> 
        <br>
        <button class = "btn-midlong bg-lightgreen margin textsize-2 textbold border-0 btn-round">로그인</button>
    
    </section>
    <br>
    
    <button class = "btn-midlong_2 bg-kakao textsize-1 textbold input btn-round border-0">
        <img class ="imgsize-square " src="img/icon/kakao.png"/>카카오로 로그인하기</button>
    <button class = "btn-midlong_2 bg-naver textsize-1 textbold input btn-round textcolor-white border-0">
        <img class ="imgsize-square " src="img/icon/naver.png"/>
        네이버로 로그인하기</button>
    
    </div>

    <div>
        <br>
        <br>
        <p class = "textsize-1 margin1">법인 고객이신가요?</p>
        <p class =" textsize-1">사업자 회원으로 전용 특가 혜택을 누려보세요</p>
        <a class = "textbold" href="${contextPath}/seller/member/sellerRegisterForm.do">사업자 간편가입</a>
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