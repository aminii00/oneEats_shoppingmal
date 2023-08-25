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
    <title>로그인창</title>
    <!--bootstrap-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />

    <style>
      :root {
        --body-background-color: #f5f6f7;
        --font-color: #4e4e4e;
        --border-gray-color: #dadada;
        --naver-green-color: #04c75a;
        --naver-green-border-color: #06b350;
      }
      .login-main {
        align-items: center;
        width: 390px;
        height: auto;
      }

      .circle {
        display: inline-block; /* 영역적용가능해짐 */
        width: 20px;
        height: 20px;
        border: 2px solid #a3d060;
        box-sizing: border-box;
        border-radius: 10px; /* 모서리둥글게 처리 */
        position: relative;
        top: 4px;
        cursor: pointer; /* 마우스 올렸을때 손모양 처리 */
      }

      .circle:after {
        content: "\2714"; /* 체크박스 특수문자 */
        font-size: 24px;
        color: #a3d060;
        position: absolute;
        top: -14px;
        left: 0;

        opacity: 0; /* 처음엔 안보이게 처리 */
        transition: 0.2s; /* CSS변화에 시간차 처리 */
      }

      /* input이 체크되면 특수문자 보이게 처리 */
      #chk:checked + .circle:after {
        opacity: 1;
      }

      /* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
      #chk {
        position: absolute;
        left: -999em;
      }

      .btn-long {
        width: 100%;
        height: 60px;
      }

      .api-btn-img {
        height: 90%;
      }

      .input-tall {
        height: 60px;
      }
      .main-wrap {
        max-width: 600px;
        min-height: 800px;
        margin: auto;
      }
    </style>
    <script>
      $(function () {
        fnInit();
      });

      function frm_check() {
        saveid();
      }

      function fnInit() {
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if (cookieid != "") {
          $("input:checkbox[id='saveId']").prop("checked", true);
          $("#logId").val(cookieid);
        }
      }

      function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if (todayDate > expiredays) {
          document.cookie =
            name +
            "=" +
            escape(value) +
            "; path=/; expires=" +
            expiredays +
            ";";
        } else if (todayDate < expiredays) {
          todayDate.setDate(todayDate.getDate() + expiredays);
          document.cookie =
            name +
            "=" +
            escape(value) +
            "; path=/; expires=" +
            todayDate.toGMTString() +
            ";";
        }

        console.log(document.cookie);
      }

      function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);

        if (document.cookie.length > 0) {
          // 쿠키가 설정되어 있다면
          offset = document.cookie.indexOf(search);
          console.log("offset : " + offset);
          if (offset != -1) {
            // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            console.log("end : " + end);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1) end = document.cookie.length;
            console.log("end위치  : " + end);

            return unescape(document.cookie.substring(offset, end));
          }
        }
        return "";
      }

      function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")) {
          expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
          setCookie("saveid", $("#logId").val(), expdate);
        } else {
          expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
          setCookie("saveid", $("#logId").val(), expdate);
        }
      }
    </script>
  </head>
  <body>
    <form
      method="post"
      action="${contextPath}/member/login.do"
      onsubmit="return frm_check();"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="main-wrap">
          <div class="row">
            <div class="col text-center textbold textsize-4">로그인</div>
          </div>
          <br />
          <div class="row">
            <div class="col">
              <div>
                <input
                  class="textsize-2 form-control input-tall"
                  placeholder=" 아이디 입력"
                  id="logId"
                  name="id"
                  type="text"
                />
              </div>
            </div>
          </div>

          <br />

          <div class="row">
            <div class="col">
              <div>
                <input
                  class="textsize-2 form-control input-tall"
                  placeholder=" 비밀번호 입력(8-12자 대소문자+숫자+특수문자)"
                  name="pwd"
                  type="password"
                />
              </div>
            </div>
          </div>
          <br />
          <div class="row textsize-2">
            <div class="col-md-4 col-lg-4 text-left">
              <input
                type="checkbox"
                id="saveId"
                name="checkId"
                style="margin-top: 5px"
                class="bg-lightgreen"
              />

              <span class="text">아이디 저장하기 </span>
            </div>
            <div class="col-md col-lg text-right">
              <a href="${contextPath}/member/idSearchForm.do">아이디찾기</a>
              /
              <a href="${contextPath}/member/pwSearchForm.do">비밀번호 찾기</a>
              /
              <a href="${contextPath}/member/registerTypeSelect.do">회원가입</a>
            </div>
          </div>
          <br />
          <div class="row">
            <div class="col text-center">
              <button
                type="submit"
                class="bg-lightgreen textcolor-white textsize-3 textbold border-0 btn-long"
              >
                로그인
              </button>
            </div>
          </div>
          <br />
          <div class="row">
            <div class="col d-flex justify-content-start">
              <a href="${kakaoUrl}">
                <img
                  class="api-btn-img"
                  src="${contextPath}/img/icon/kakao_login_medium_narrow.png"
                />
              </a>
            </div>
            <div class="col d-flex justify-content-end">
              <a>
                <img
                  class="api-btn-img"
                  src="${contextPath}/img/icon/naver_login.png"
                />
              </a>
            </div>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
