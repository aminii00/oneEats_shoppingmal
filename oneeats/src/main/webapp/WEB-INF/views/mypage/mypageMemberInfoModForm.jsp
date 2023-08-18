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
      .modForm {
        width: 400px;
        height: 474px;
        text-align: center;
        margin: auto;
      }
      .modFormServe {
        width: 30%;
        height: 100%;
        align-items: center;
        text-align: center;
        margin: auto;
      }

      .input_minflex {
        display: flex;
        justify-content: space-around;
        align-content: center;
        align-items: center;
        margin-bottom: 22px;
      }
      .input_minflex1 {
        display: flex;
        justify-content: space-around;
        margin-right: 100px;
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
        <div class="profile-edit-header">
          <br />
          <br />
          <h4>회원정보 수정</h4>
          <hr class="linebold" />
          <br />
        </div>
        <div class="modForm">
          <br />

          <div class="input_minflex">
            <div class="textbold textsize-1">아이디&nbsp&nbsp</div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5"
              type="text"
            /><br />
          </div>

          <div class="input_minflex">
            <div class="textbold textsize-1">비밀번호</div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5"
              type="text"
            /><br />
          </div>

          <div class="input_minflex">
            <div class="textbold textsize-1">비밀번호 확인</div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5"
              style="margin-right: 22px"
              type="text"
            /><br />
          </div>

          <div class="input_minflex">
            <div class="textbold textsize-1">생년월일</div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5"
              type="text"
            /><br />
          </div>

          <div class="textbold textsize-1 input_minflex1">
            성별
            <div>
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input
                type="radio"
                name="gender"
                value="man"
              />
              <span class="textsize-1">남&nbsp&nbsp&nbsp&nbsp</span>
              <input type="radio" name="gender" value="woman" />
              <span class="textsize-1">여&nbsp&nbsp&nbsp&nbsp</span>
              <input type="radio" name="no" value="no" /><span
                class="textsize-1"
                >선택안함</span
              >
            </div>
          </div>
          <br />

          <div class="input_minflex">
            <div class="textbold textsize-1">휴대폰 번호</div>
            <input
              class="brd-lightgray btn-round btn-memberInfo textsize-1"
              placeholder=" 휴대폰 번호를 입력해 주세요."
              type="text"
            />
            <button
              class="btn-serveInfo bg-lightgreen textsize-0 border-0 margin btn-round textbold"
            >
              인증번호요청
            </button>
          </div>
          <div style="margin-bottom: 48px; margin-right: 24px">
            <input
              class="brd-lightgray btn-round btn-memberInfo bg-lightgray border-0 textsize-1 margin1"
              placeholder=" 인증번호를 입력하세요."
              type="text"
            />
            <p class="textsize-0 margin-id">
              인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호 차단
              여부를 확인해 주세요.
            </p>
          </div>
          <br />

          <span class="margin1 textbold textsize-1 text-left"
            >SMS 안내&nbsp&nbsp&nbsp</span
          ><input type="radio" name="gender" value="man" /><span
            class="textsize-1"
            >수신함</span
          >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
          <input type="radio" name="gender" value="woman" /><span
            class="textsize-1"
            >수신안함</span
          >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
          <br />
          <br />
        </div>
        <button
          type="reset"
          class="btn-midlong_2 textsize-1 textbold input btn-round border-0"
        >
          취소
        </button>
        <button
          type="submit"
          class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0"
          onclick="location.href='${contextPath}/mypage/mypageMemberInfoModForm.do'"
        >
          저장
        </button>
      </div>
    </form>
  </body>
</html>
