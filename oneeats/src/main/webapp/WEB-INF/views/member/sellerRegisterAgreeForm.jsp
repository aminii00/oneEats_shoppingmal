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
<script>

</script>
<style>
.box{
    width: 100px; 
    height: 24px;
    display: inline-block;
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
<form method = "post" action = "${contextPath}/member/sellerRegister_two.do">
<br>
<br>
<br>
<div class="main-container">
    <div class="sellermain-wrap">
              <div class="textsize-3 textbold">
            <div class ="mainline"></div>
            <br>
            <br>
                <div class = "box" >가입</div>
                <div class = "box" style="border-top: solid 5px; border-color: #a3d060;">약관동의</div>
                <div class = "box">정보입력</div>
                <div class = "box">가입완료</div>
               
            <br>
            <span class = "textsize-1 textcolor-red ">!필수 항목에 모두 동의해주세요</span>
            <div class =" brd-lightgreen btn-round ">
                <br>
                <br>
                
                <div class ="serve-wrap">
                    <br><p class = " text-left textsize-1 margin1 textbold">
                        <input class = "text-left" type="checkbox" name ="check" value="agreeTotal">&nbsp&nbsp&nbsp전체 약관 동의</span><br>
                        <input type="checkbox" name ="check1" value="agree1">&nbsp&nbsp&nbsp[필수]서비스 이용 약관 동의<br>
                        <input type="checkbox" name ="check1" value="agree1">&nbsp&nbsp&nbsp[필수]개인정보 수집 및 이용에 동의<br>
                        <input type="checkbox" name ="check2" value="yes">&nbsp&nbsp&nbsp[선택]긴급 할인 등 정보,혜택 수신 동의<br>
                        &nbsp&nbsp&nbsp&nbsp<input type="checkbox" name ="sms_agreement" value="yes">&nbsp&nbsp&nbsp&nbsp SMS &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <input type="checkbox" name ="email_agreement" value="yes">&nbsp&nbsp&nbsp이메일<br>
                        <input type="checkbox" name ="check1" value="agree1">&nbsp&nbsp&nbsp[필수]본인은 만 14세 이상입니다.<br>
                        <br>
                        </p>
                <br>
                <button type="submit" class = "btn-long bg-lightgreen margin textsize-1 border-0 btn-round">
                    다음으로
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