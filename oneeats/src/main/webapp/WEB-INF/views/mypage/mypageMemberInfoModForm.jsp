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
    <div class="content-area">
        <div class="profile-edit-box ">
            <div class="profile-edit-header">
                <h4>비밀번호 재확인</h4>
                <p class="align-right-header-font">회원님의 정보를 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</p>
                <hr>
                <br>
            </div>

                <div class = " margin1 textbold textsize-1 text-left">아이디</div>
                <input class =" brd-lightgray btn-round btn-memberInfo  textsize-1 border-0.5" type="text"></input><br>
               
                <div class = " textpoint-center text-left textsize-1 margin1 textbold">비밀번호</div>
                <input class ="brd-lightgray btn-round btn-memberInfo  textsize-1 " type="password"></input><br>
                
                <div class = " textpoint-center text-left textsize-1 margin1 textbold">비밀번호 확인</div>
                <input class ="brd-lightgray btn-round btn-memberInfo  textsize-1 " type="password"></input><br>
              
                <div class = " text-left  textsize-1 margin1 textbold">생년월일</div>
                <input class ="brd-lightgray btn-round btn-memberInfo  textsize-1 " placeholder="  YYYY  /  MM  /  DD" type="text"></input><br>
                
                <div class = " text-left textsize-1 margin1 textbold">성별&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                    <div class = "btn-tinylong margin textsize-1 border-0 btn-round">
                     
                    <input type="radio" name="gender" value="man"><span class=" textsize-1">남</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="radio" name="gender" value="woman"><span class="textsize-1">여</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    <input type="radio" name="no" value="no"><span class="textsize-1">선택안함</span>
                    </div>
                </div>

                <div class = " text-left textsize-1 margin1 textbold">휴대폰 번호<span class="textcolor-red">*</span></div>
                <div>
            <input class ="brd-lightgray btn-round btn-memberInfo textsize-1 " placeholder=" 휴대폰 번호를 입력해 주세요." type="text"></input>
            <button class = "btn-serveInfo bg-lightgreen textsize-0 border-0 margin btn-round textbold">
                인증번호요청
            </button>
        </div>
            <input class ="brd-lightgray btn-round btn-memberInfo bg-lightgray border-0 textsize-1 margin1 " placeholder=" 인증번호를 입력하세요." type="text"></input>
            <p class = "textsize-0 margin-id">인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호</p>
            <p class =" textsize-0 margin-id">차단 여부를 확인해 주세요.</p>
        <br>

            <div class = " text-left textsize-1 margin1 textbold">SMS 안내&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                <div class = "btn-tinylong margin textsize-1 border-0 btn-round">
                 
                <input type="radio" name="gender" value="man"><span class=" textsize-1">수신함</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="radio" name="gender" value="woman"><span class="textsize-1">수신안함</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </div>
            </div>

</div>
</div>
</div>

</form>
</body>
</html>