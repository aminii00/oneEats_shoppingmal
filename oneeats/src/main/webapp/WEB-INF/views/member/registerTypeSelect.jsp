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
    <style></style>
  </head>
  <body>
    <div class="main-container">
      <div class="main-wrap">
        <div class="textsize-4 textbold">
          회원가입
          <br />
        </div>
        <br />
        <div>
          <p class="textsize-1 margin1">
            아이디, 비밀번호, 이름, 휴대번호 입력하기 귀찮으시죠?
          </p>
          <p class="textsize-1">카카오, 네이버로 1초만에 회원가입 하세요.</p>
        </div>
        <button
          class="btn-midlong bg-kakao textbold margin textsize-1 border-0 btn-round"
          onclick="location.href='${kakaoUrl}'"
        >
          <img class="imgsize-square" src="${contextPath}/img/icon/kakao.png" />
          카카오 1초 회원가입
        </button>
        <button
          class="btn-midlong textcolor-white textbold bg-naver margin textsize-1 border-0 btn-round"
        >
          <img class="imgsize-square" src="${contextPath}/img/icon/naver.png" />
          네이버로 회원가입하기
        </button>

        <br />
        <br />
        <p class="textsize-2 margin1">
          ----------------------또는----------------------
        </p>
        <br />
        <button
          class="btn-midlong bg-lightgray margin textsize-1 border-0 btn-round"
          onclick="location.href ='${contextPath}/member/registerForm.do'"
        >
          ID/PW 입력이 필요한 회원가입
        </button>
        <br />

        <br />
        <p class="textsize-1 margin1">법인 고객이신가요?</p>
        <p class="textsize-1">사업자 회원으로 전용 특가 혜택을 누려보세요</p>
        <a class="textbold" href="${contextPath}/member/sellerRegisterForm.do"
          >사업자 간편가입</a
        >
      </div>
    </div>
  </body>
</html>
