<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
    <meta charset="UTF-8" />
    <title>회원가입 선택 창</title>
    <script></script>
    <style>
      .box {
        width: 100px;
        height: 24px;
        display: inline-block;
      }
    </style>
    <c:choose>
      <c:when test="${result=='loginFailed' }">
        <script>
          window.onload = function () {
            alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요");
          };
        </script>
      </c:when>
    </c:choose>
  </head>
  <body>
    <form method="post" action="${contextPath}/member/sellerRegister_one.do">
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="sellermain-wrap">
          <div class="textsize-3 textbold">
            <div class="mainline"></div>
            <br />
            <br />
            <div
              class="box"
              style="border-top: solid 5px; border-color: #a3d060"
            >
              가입
            </div>
            <div class="box">약관동의</div>
            <div class="box">정보입력</div>
            <div class="box">가입완료</div>
            <br />
            <br />
            <div
              class="btn-midlong_2 textsize-2 btn-round textcolor-white bg-lightgreen border-0"
            >
              사업자 회원가입
            </div>
            <div class="brd-lightgreen btn-round">
              <br />
              <br />
            </div>
            <br />
            <br />
            <br />
            <br />
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
