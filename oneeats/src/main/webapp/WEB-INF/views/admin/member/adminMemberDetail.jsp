<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <meta charset="UTF-8" />
    <title>회원가입 선택 창</title>
    <style></style>
  </head>
  <body>
    <section>
      <div class="row vertical-align">
        <div class="col-md textsize-3 text-left textbold textcolor-black">
          회원정보
        </div>
      </div>
      <hr class="line-black" />
      <div class="adminMemberDetail_grid text-left textcolor-black textsize-2">
        <div class="row">
          <div class="col-md-2 textbold">분류</div>
          <div class="col-md">사업자</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">아이디</div>
          <div class="col-md">hanyeji</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">비밀번호</div>
          <div class="col-md">1234</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">이름</div>
          <div class="col-md">강태공</div>
        </div>

        <div class="row">
          <div class="col-md-2 textbold">닉네임</div>
          <div class="col-md">강씨</div>
        </div>

        <div class="row">
          <div class="col-md-2 textbold">가입일</div>
          <div class="col-md">2023/08/12</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">생년월일</div>
          <div class="col-md">1990/12/12</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">성별</div>
          <div class="col-md">남</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">이메일</div>
          <div class="col-md">kang@naver.com</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">휴대폰</div>
          <div class="col-md">010-1234-5678</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">수신동의</div>
          <div class="col-md">
            <input type="checkbox" checked disabled /> 이메일 &nbsp;
            <input type="checkbox" checked disabled /> SMS
          </div>
        </div>
      </div>
      <hr class="line-black" />
      <div style="float: right">
        <button
          class="btn-tolist"
          onclick="location.href='${contextPath}/admin/member/adminMemberList.do'"
        >
          목록으로
        </button>
      </div>
    </section>
  </body>
</html>
