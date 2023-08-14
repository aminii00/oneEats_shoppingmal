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
            <div class =" brd-lightgreen btn-round ">
                <br>
                <div class ="serve-wrap">
                <span class ="textsize-2">고객님의 아이디를 찾았습니다.</span><br>
                <span class ="textsize-1">아이디 확인 후 로그인 해 주세요.</span> <br><br>
                <div>
                    aaa
                </div>
                <br>
                <button class = "btn-midlong bg-lightgray textsize-1 border-0 margin btn-round">
                    비밀번호 찾기
                </button>
                <button class = "btn-midlong bg-lightgreen textsize-1 border-0 btn-round">
                    로그인
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