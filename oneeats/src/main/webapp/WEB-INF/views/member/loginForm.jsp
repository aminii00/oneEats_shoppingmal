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
     doKakaoLogin(){
      const url = 'https://kauth.kakao.com/oauth/authorize?client_id=' +
          process.env.VUE_APP_KAKAO_JS_KEY +
          '&redirect_uri=' +
          process.env.VUE_APP_KAKAO_REDIRECT_URL +
          '&response_type=code&' +
          'scope=account_email birthday gender profile_nickname profile_image'
	  // -- 중략 --
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
.login-main{
    align-items: center;
    width: 390px;
    height:auto;
}


.circle{
    display: inline-block; /* 영역적용가능해짐 */
    width: 20px; height: 20px;
    border: 2px solid #a3d060;
    box-sizing: border-box;
    border-radius: 10px; /* 모서리둥글게 처리 */
    position: relative; top: 4px;
    cursor: pointer; /* 마우스 올렸을때 손모양 처리 */
}

.circle:after{
    content: '\2714'; /* 체크박스 특수문자 */
    font-size: 24px; color: #a3d060;
    position: absolute; top: -14px; left: 0;

    opacity: 0; /* 처음엔 안보이게 처리 */
    transition: 0.2s; /* CSS변화에 시간차 처리 */
}

/* input이 체크되면 특수문자 보이게 처리 */
#chk:checked + .circle:after{ opacity: 1; }

/* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
#chk{ position: absolute; left: -999em; }


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
            로그인
            <br>
        </div>
        <br>
    </header>
        <div>
             <input class =" brd-lightgray btn-round margin btn-midlong textsize-1 " placeholder=" 아이디 입력" name = "id" type="text" ></input>
        </div>

        <div>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1" placeholder=" 비밀번호 입력(8-12자 대소문자+숫자+특수문자)" name = "pwd" type="password"></input>
        </div>
        <div class = "textsize-1" align:right>
           
            <label for="chk">
                <input type="checkbox" id="chk">
                <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                <i class="circle"></i>
                <span class="text">아이디 저장하기
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
            </label>

            <a href="${contextPath}/member/idSearchForm.do">아이디찾기</a>/
            <a href="${contextPath}/member/pwSearchForm.do">비밀번호 찾기</a>/
            <a href="${contextPath}/member/registerTypeSelect.do">회원가입</a>
        </div> 
        <br>
        <button type ="submit" class = "btn-midlong bg-lightgreen margin textsize-2 textbold border-0 btn-round">로그인</button>
    
    </section>
    <br>
    
    <button class = "btn-midlong_2 bg-kakao textsize-1 textbold input btn-round border-0">
        <img class ="imgsize-square " src="${contextPath}/img/icon/kakao.png"/>카카오로 로그인하기</button>
    <button class = "btn-midlong_2 bg-naver textsize-1 textbold input btn-round textcolor-white border-0">
        <img class ="imgsize-square " src="${contextPath}/img/icon/naver.png"/>
        네이버로 로그인하기</button>
    
    </div>

    <div>
        <br>
        <br>
        <p class = "textsize-1 margin1">법인 고객이신가요?</p>
        <p class =" textsize-1">사업자 회원으로 전용 특가 혜택을 누려보세요</p>
        <a class = "textbold" href="${contextPath}/member/sellerRegisterForm.do">사업자 간편가입</a>
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