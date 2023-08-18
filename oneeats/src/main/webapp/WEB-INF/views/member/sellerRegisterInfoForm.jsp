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
<title>회원가입 창</title>
</head>
<body>
<form method = "post" action = "${contextPath}/seller/member/sellerRegisterLastForm.do">
<br>

<div class="main-container">
    <div class="main-wrap">
        <div class="textsize-3 textbold text-left">
            <br>
            <br>
            <div class ="textsize-2">
                <div class ="sellerNextAgree"></div>
                가입 &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 약관동의&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 정보입력 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 가입완료
            </div>
            <br>
            <br>
        </div> 
        <div class = " margin1 textbold textsize-1 text-left">아이디<span class="textcolor-red">*</span></div>
        <input class =" brd-lightgray btn-round btn-midlong-input textsize-1 border-0.5 " placeholder=" 아이디를 입력해 주세요." type="text"></input>
            &nbsp
            <button class = "btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 btn-round">
                중복확인
            </button>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">비밀번호<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong  textsize-1 " placeholder=" 비밀번호를 입력해 주세요.." type="password"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">비밀번호 확인<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " placeholder=" 비밀번호를 한 번 더 입력해주세요." type="password"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">이름<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " placeholder=" 이름을 입력해 주세요." type="text"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">이메일</p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " placeholder=" 이메일을 입력해 주세요." type="text"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">휴대폰 번호<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong-input textsize-1 " placeholder=" 휴대폰 번호를 입력해 주세요." type="text"></input>
            &nbsp
            <button class = "btn-fatfat-mina bg-lightgreen textsize-0 border-0 margin btn-round textbold">
                인증번호요청
            </button><br>
            <input class ="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin1 " placeholder=" 인증번호를 입력하세요." type="text"></input>
            <p class = "textsize-0 margin-id">인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호</p>
            <p class =" textsize-0 margin-id">차단 여부를 확인해 주세요.</p><br>

            <p class = " text-left textsize-1 margin1 textbold">주소</p>
            <button class = "btn-midlong bg-lightgreen margin textsize-1 border-0 btn-round">
                주소 검색
            </button>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">성별</span>
                <div class = "btn-tinylong margin textsize-1 border-0 btn-round">
                 
                <input type="radio" name="gender" value="man"><span class=" textsize-1">남</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="radio" name="gender" value="woman"><span class="textsize-1">여</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="radio" name="no" value="no"><span class="textsize-1">선택안함</span>
                </div>
            </p>
            <p class = " text-left  textsize-1 margin1 textbold">생년월일</p>
            <input class ="brd-lightgray btn-round btn-midlong  textsize-1 " placeholder="  YYYY  /  MM  /  DD" type="text"></input>
            <br>
            <div class="line"></div>
            <br>
            <button class = "btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round">
                회원가입 완료
            </button>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            
    </div>
</form>
</body>
</html>