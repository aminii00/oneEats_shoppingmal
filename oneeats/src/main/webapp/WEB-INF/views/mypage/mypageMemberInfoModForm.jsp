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
    <form method="post" action="${contextPath}/loginForm.do">
      <div class="content-area">
        <div class="profile-edit-box">
          <div class="profile-edit-header">
            <h4>회원정보 수정</h4>
            <hr />
            <br />
          </div>

          <div class="margin1 textbold textsize-1">아이디</div>
          <div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5"
              type="text"
            />
          </div>
          <br />

          <div class="textpoint-center textsize-1 margin1 textbold">
            비밀번호
          </div>
          <div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1"
              type="password"
            />
          </div>
          <br />

          <div class="textpoint-center textsize-1 margin1 textbold">
            비밀번호 확인
          </div>
          <div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1"
              type="password"
            />
          </div>
          <br />

          <div class="textsize-1 margin1 textbold">생년월일</div>
          <div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1"
              placeholder="  YYYY  /  MM  /  DD"
              type="text"
            />
          </div>
          <br />

          <div class="margin1 textbold textsize-1 text-center">성별</div>
          <div class="btn-memberInfo textsize-1 property_margin">
            <div style="display: flex; justify-content: center">
              <div>
                <input type="radio" name="gender" value="man" /><span
                  class="textsize-1"
                  >남</span
                >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              </div>
              <div>
                <input type="radio" name="gender" value="woman" /><span
                  class="textsize-1"
                  >여</span
                >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              </div>
              <div>
                <input type="radio" name="no" value="no" /><span
                  class="textsize-1"
                  >선택안함</span
                >
              </div>
            </div>
          </div>
        </div>

        <div class="margin1 textbold textsize-1 text-center">휴대폰 번호</div>
        <div>
          <input
            class="brd-lightgray btn-round btn-memberInfo textsize-1 property_margin1"
            placeholder=" 휴대폰 번호를 입력해 주세요."
            type="text"
          />
          <button
            class="btn-serveInfo bg-lightgreen textsize-0 border-0 margin btn-round textbold"
          >
            인증번호요청
          </button>
        </div>
        <input
          class="brd-lightgray btn-round btn-memberInfo bg-lightgray border-0 textsize-1 margin1"
          placeholder=" 인증번호를 입력하세요."
          type="text"
        />
        <p class="textsize-0 margin-id">
          인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호차단 여부를
          확인해 주세요.
        </p>
        <br />

        <div class="margin1 textbold textsize-1 property_margin">SMS 안내</div>
        <div class="btn-tinylong margin textsize-1 border-0 btn-round">
          <div class="property_margin2">
            <input type="radio" name="sms_agreement" value="yes" /><span
              class="textsize-1"
              >수신함</span
            >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="radio" name="sms_agreement" value="no" /><span
              class="textsize-1"
              >수신안함</span
            >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
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
