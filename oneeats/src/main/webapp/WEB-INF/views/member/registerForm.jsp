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

<style>
    form{ padding: 10px; }
.circle{
    display: inline-block; /* 영역적용가능해짐 */
    width: 20px; height: 20px;
    border: 2px solid #333;
    box-sizing: border-box;
    border-radius: 10px; /* 모서리둥글게 처리 */
    position: relative; top: 4px;
    cursor: pointer; /* 마우스 올렸을때 손모양 처리 */
}
.circle:after{
    content: '\2714'; /* 체크박스 특수문자 */
    font-size: 24px; color: #333;
    position: absolute; top: -14px; left: 0;

    opacity: 0; /* 처음엔 안보이게 처리 */
    transition: 0.2s; /* CSS변화에 시간차 처리 */
}

/* input이 체크되면 특수문자 보이게 처리 */
#chk:checked + .circle:after{ opacity: 1; }

/* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
#chk{ position: absolute; left: -999em; }
</style>
</head>
<body>
<form method = "post" action = "${contextPath}/member/loginForm.do">
<br>

<div class="main-container">
    <div class="main-wrap">
        <div class="textsize-3 textbold text-left">
            회원가입
            <div class ="mainline"></div>
            <br>
            <br>
        </div> 
        <div class = " margin1 textbold textsize-1 text-left">아이디<span class="textcolor-red">*</span></div>
        <input class =" brd-lightgray btn-round btn-midlong-input textsize-1 border-0.5 " placeholder=" 아이디를 입력해 주세요." type="text"></input>
            &nbsp
            <button class = "btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 btn-round">
                중복확인
            </button><br>

            <c:set var="name" value="홍길동" />
            <c:if test="${name eq '홍길동'}">
            <c:out value="${str}" />
            </c:if>

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
            <input class ="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin1 " placeholder=" 인증번호를 입력하세요." type="text"></input><br>
            <span class = "textsize-0 margin-id">인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호</span><br>
            <span class =" textsize-0 margin-id">차단 여부를 확인해 주세요.</span>

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
            <br><p class = " text-left textsize-1 margin1 textbold">
            <input class = " text-left" type="checkbox" name ="check1" value="agreeTotal">&nbsp&nbsp&nbsp전체 약관 동의</span><br><br>
            
            <input type="checkbox" name ="check2" value="agree1">&nbsp&nbsp&nbsp[필수]서비스 이용 약관 동의<br><br>
            <input type="checkbox" name ="check2" value="agree1">&nbsp&nbsp&nbsp[필수]개인정보 수집 및 이용에 동의<br><br>
            <input type="checkbox" name ="check2" value="agree1">&nbsp&nbsp&nbsp[선택]긴급 할인 등 정보,혜택 수신 동의<br>
            &nbsp&nbsp&nbsp&nbsp<input type="checkbox" name ="smsagree" value="smsagree">&nbsp&nbsp&nbsp&nbsp SMS &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="checkbox" name ="emailagree" value="emailagree">&nbsp&nbsp&nbsp이메일<br><br>
            <input type="checkbox" name ="check2" value="agree1">&nbsp&nbsp&nbsp[필수]본인은 만 14세 이상입니다.<br><br>
            <br>
            </p>
            <button type="button" class = "btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round" onclick="fn_openalert('회원가입이 완료되었습니다.', '${contextPath}/member/loginForm.do')">
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