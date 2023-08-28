<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원가입 선택 창</title>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
  </head>
  <body>
    <br />
    <br />
    <br />
    <div class="main-container">
      <div class="main-wrap">
        <div class="row">
          <div class="col text-center textsize-4 textbold">회원가입</div>
        </div>
        <br />
        <div class="row">
          <div class="col">
            아이디, 비밀번호, 이름, 휴대번호 입력하기 귀찮으시죠? <br />
            카카오, 네이버로 1초만에 회원가입 하세요.
            <br />
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <a
            id="kakao-btn"
            class="d-flex justify-content-center align-items-center"
            href="${contextPath}/kakao/registerForm.do"
          >
            <img src="${contextPath}/img/icon/kakao.png" />
            카카오 로그인
          </a>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <a
            id="naver-btn"
            class="d-flex justify-content-center align-items-center"
            href="#"
          >
            <img src="${contextPath}/img/icon/naver.png" />
            네이버 로그인
          </a>
        </div>

        <br />
        <br />
        <div class="row">
          <div class="col text-center">
            <p class="textsize-2 margin1">
              ----------------------또는----------------------
            </p>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col text-center">
            <a
              id="register-btn"
              class="bg-lightgray d-flex justify-content-center align-items-center"
              href="${contextPath}/member/registerForm.do"
            >
              ID/PW 입력이 필요한 회원가입
            </a>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col">
            <p class="textsize-1 margin1">법인 고객이신가요?</p>
            <p class="textsize-1"></p>
            <a
              class="textbold"
              href="${contextPath}/member/sellerRegisterForm.do"
              >사업자 간편가입</a
            >
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
