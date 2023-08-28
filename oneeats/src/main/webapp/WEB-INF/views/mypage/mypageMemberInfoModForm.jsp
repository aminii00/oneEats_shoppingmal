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
    <style>
      .genderdv {
        width: 200px;
        text-align: center;
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
    <form method="post" action="${contextPath}/mypage/memberInfoMod.do">
      <div class="content-area">
        <div class="profile-edit-box">
          <div class="profile-edit-header">
            <h4>회원정보 수정</h4>
            <hr />
            <br />
          </div>

          <div class="margin1 textbold textsize-1">
            아이디
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 text-center"
                type="text"
                name ="id"
                value="${memberInfo.id}"
                readonly
              />
            </div>
          </div>
          <br />

          <div class="textpoint-center textsize-1 margin1 textbold">
            비밀번호

            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                type="password"
                name="pwd"
              />
            </div>
          </div>
          <br />

          <div
            class="textpoint-center textsize-1 margin1 textbold"
            style="margin-right: 15px"
          >
            비밀번호 확인

            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                type="password"
              />
            </div>
          </div>
          <br />


          <div class="margin1 textbold textsize-1">
            이름&nbsp&nbsp
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 text-center"
                type="text"
                name ="name"
                value="${memberInfo.name}"
              />
            </div>
          </div>
          <br />

          <div class="textsize-1 margin1 textbold">
            생년월일
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                placeholder="  YYYY  /  MM  /  DD"
                type="date"
                name="birth"
              />
            </div>
          </div>
          <br />

          <div class="margin1 textbold textsize-1 text-center">
            성별
            <div class="btn-memberInfo textsize-1">
              <div style="display: flex; justify-content: center">
                <div>
                  <input type="radio" 
                  name="gender" 
                  value="m" />
                  <span class="textsize-1">남</span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </div>
                <div>
                  <input 
                  type="radio" 
                  name="gender" 
                  value="w" /><span class="textsize-1">여</span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </div>
                <div>
                  <input type="radio" 
                  name="gender" 
                  value="no" 
                  /><span class="textsize-1">선택안함</span>
                </div>
              </div>
            </div>
          </div>
          <br>


          <div class="margin1 textbold textsize-1">
            휴대폰 번호
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 margin1 text-center"
                type="text"
                name="phone"
                value="${memberInfo.phone}"
              />
              <br>
              <button
              class="brd-lightgray btn-round margin1 btn-memberInfo textsize-1 border-0.5"
              type="text"
              >인증번호 요청</button>
              <br>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 margin1 text-center"
                type="text"
              />
            </div>
            
          </div>
          <br />

          <div class="margin1 textbold textsize-1 property_margin">
            SMS
            <div>
              <input 
              type="radio" 
              name="sms_agreement" 
              value="yes" /><span class="textsize-1">&nbsp&nbsp&nbsp&nbsp&nbsp수신함</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <input 
              type="radio" 
              name="sms_agreement" 
              value="no" />
              <span class="textsize-1" > &nbsp&nbsp&nbsp&nbsp&nbsp수신안함</span>
            </div>
          </div>

          <div 
          class="margin1 textbold textsize-1 property_margin"
          style="margin-top:20px;" >
            email
            <div>
              <input 
              type="radio" 
              name="email_agreement" 
              value="yes" />
              <span class="textsize-1">&nbsp&nbsp&nbsp&nbsp&nbsp수신함</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <input 
              type="radio" 
              name="email_agreement" 
              value="no"
              />
              <span class="textsize-1" > &nbsp&nbsp&nbsp&nbsp&nbsp수신안함</span>
            </div>
          </div>


        </div>

       

      <br />
      <br />
      <button
        type="reset"
        class="btn-midlong_2 textsize-1 textbold input btn-round border-0"
      >
        취소
      </button>
      <button
        type="submit"
        class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0"
      >
        확인
      </button>
      <br /><br /><br />
    </form>
  </body>
</html>
