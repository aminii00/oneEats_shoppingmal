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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">
<title>로그인창</title>
<style>

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
</head>
<body>
    <form method = "post" action = "${contextPath}/loginForm.do">
        <br>
        
        <div class="main-container">
            <div class="main-wrap">
                
                
                <input class =" brd-lightgray btn-round btn-midlong-input textsize-1  border-0.5  " placeholder="#" type="text"></input>
                    <button style = "margin-bottom: 4px; margin-top:0%" class = "btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 margin1 btn-round" onclick="">
                        재검색
                    </button>
                    <br>
                    <input style ="width: 286px; height:50px " class="brd-lightgray margin1 btn-round btn-midlong-address textsize-1 " placeholder=" 상세 주소를 입력해주세요." type="text"></input>
                    <br>
                    
                    <div class="idselect" style="width: 282px; height: 50px;">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<label for="chk" >
                            <label for="chk">
                                <input type="checkbox" id="chk">
                                <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                <i class="circle"></i>
                                <span class="textsize-0">기본배송지로 저장</span>
                            </label>
                    </div>
                    <br>
                    <br>
                    <button class = "btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round">
                        저장
                    </button>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    
            </div>
        </div>
</body>
</html>
<table>

</table>
</form>
</body>
</html>