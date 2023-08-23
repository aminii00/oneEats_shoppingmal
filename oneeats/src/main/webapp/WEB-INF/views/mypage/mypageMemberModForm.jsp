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
<title>프로필 편집</title>
<style>



</style>

</head>
<body>
    <form method="post" action="${contextPath}/mypage/mypageMemberModInfo.do">
    <div class="content-area">
        <div class="profile-edit-box ">
            <div class="profile-edit-header">
                <h4>비밀번호 재확인</h4>
                <p class="align-right-header-font">회원님의 정보를 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</p>
                <hr>
                <br>
            </div>
            <div class = "textpoint-center">
            <div class = " textpoint-center textbold textsize-1 text-left">아이디  </div>
            <input class ="textpoint-left brd-lightgray btn-round btn-midlong textsize-1 " value="${id}" type="text"></input>
            </div>
            <div class ="textpoint-center">
            <div class = " textpoint-center textbold textsize-1 text-left">비밀번호</div>
             <input class ="textpoint-center brd-lightgray btn-round btn-midlong textsize-1" name ="inputPwd" placeholder="현재 비밀번호를 입력해 주세요." type="password"></input>
            </div>
        </div>
            <button type="reset" class="btn-midlong_2 textsize-1 textbold input btn-round border-0">취소</button>
            <button type="submit" class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0">확인</button>
        </div>
    </div>
</form>
</body>
</html>