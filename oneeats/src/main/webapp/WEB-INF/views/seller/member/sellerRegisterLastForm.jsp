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
<title>회원가입 선택 창</title>
<style>

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
<form method = "post" action = "${contextPath}/loginForm.do">
<br>
<br>
<br>
<div class="main-container">
    <div class="sellermain-wrap">
              <div class="textsize-3 textbold">
            <div class ="mainline"></div>
            <br>
            <br>
            <div class ="textsize-2">
                <div class ="sellerNext"></div>
                가입 &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 약관동의&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 정보입력 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 가입완료
            </div>
            <br>
            <br>
            <div class =" brd-lightgreen btn-round ">
                <br>
                <br>
                <div class ="serve-wrap">
                <span class ="textsize-2">One.Eats 회원이 되신 것을 환영합니다.</span><br>
                <span class ="textsize-1">로그인 후 다양한 혜택을 경험해 보세요.</span> <br><br>
                <button class = "btn-midlong bg-lightgreen textsize-1 border-0 btn-round">
                    로그인하러 가기
                </button>
                <br><br>
            </div>
            </div>
            <br>
            <br>
            <br>
            <br>

    </div>
    </div>
    </div>
</form>
</body>
</html>