<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
    <meta charset="UTF-8" />
    <title>비밀번호 찾기</title>
    <style>
      .redText {
        color: red;
      }
      .blueText {
        color: green;
      }
    </style>

    <script>
      var check_map = new Map([
        ["pwd", false],
        ["pwd_confirm", false],
      ]);

      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";

      function changeMessage(elname, str, clr) {
        $("#errmsg_" + elname).removeClass();
        $("#errmsg_" + elname).addClass(clr + "Text");
        if (str.length < 1) {
          $("#errmsg_" + elname).html("&nbsp;");
        } else {
          $("#errmsg_" + elname).text(str);
        }
      }
      $(document).ready(function () {
        $("#pwd").on("input", function () {
          var puttedText = $(this).val();
          pwd_input_text = puttedText;
          var regex = /[^a-zA-Z0-9!@#$%^&*()]/;
          var regex2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).+$/;
          if (puttedText.length < 8) {
            changeMessage("pwd", "비밀번호가 너무 짧습니다.", "red");
          } else if (puttedText.length > 12) {
            changeMessage("pwd", "비밀번호가 너무 깁니다.", "red");
          } else if (regex.test(puttedText)) {
            changeMessage(
              "pwd",
              "비밀번호에는 알파벳, 숫자, 혹은 특수문자(!@#$%^&*())만 사용할 수 있습니다.",
              "red"
            );
          } else if (!regex2.test(puttedText)) {
            changeMessage(
              "pwd",
              "비밀번호에는 영숫자와 특수문자가 하나 이상 들어가 있어야 합니다.",
              "red"
            );
          } else {
            if (pwd_check_text != "-1" && pwd_check_text != puttedText) {
              changeMessage(
                "pwd_confirm",
                "비밀번호가 일치하지 않습니다.",
                "red"
              );
              check_map.set("pwd_confirm", false);
            } else {
              changeMessage("pwd_confirm", "", "blue");
              check_map.set("pwd_confirm", true);
            }
            changeMessage("pwd", "", "blue");
            check_map.set("pwd", true);
          }
        });

        $("#pwd_confirm").on("input", function () {
          var puttedText = $(this).val();
          var regex = /[^a-zA-Z0-9!@#~]/;
          pwd_check_text = puttedText;
          if (puttedText != pwd_input_text) {
            changeMessage(
              "pwd_confirm",
              "비밀번호가 일치하지 않습니다.",
              "red"
            );
            check_map.set("pwd_confirm", false);
          } else {
            changeMessage("pwd_confirm", "", "blue");
            check_map.set("pwd_confirm", true);
          }
        });
      });

      $("#registerForm").submit(function (event) {
        event.preventDefault();

        for (let [key, value] of check_map) {
          console.log(key, value);
          if (value == false) {
            alert("다시 입력해주세요.");
            $("#" + key).focus();
            return false;
          }
        }

        $(this).unbind("submit").submit();
      });
    </script>
  </head>
  <body>
    <form method="post" action="${contextPath}/member/updatePw.do">
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="main-wrap">
          <div class="row">
            <div class="col textbold textsize-4 text-center">
              <span>비밀번호 찾기</span>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md-3">새 비밀번호 등록</div>
            <div class="col-md">
              <input
                class="form-control"
                id="pwd"
                name="pwd"
                placeholder=" 새 비밀번호를 입력해주세요."
                type="password"
              />
            </div>
          </div>

          <div class="row">
            <div class="col">
              <div id="errmsg_pwd">&nbsp;</div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-3">새 비밀번호 확인</div>
            <div class="col-md">
              <input
                id="pwd_confirm"
                class="form-control"
                placeholder=" 새 비밀번호를 한 번 더 입력해주세요."
                type="password"
              />
            </div>
          </div>
          <div class="row">
            <div class="col">
              <div id="errmsg_pwd_confirm">&nbsp;</div>
            </div>
          </div>

          <div class="row">
            <div class="col">
              <button
                type="submit"
                class="bg-lightgreen textbold border-0 btn-long"
              >
                확인
              </button>
            </div>
          </div>
        </div>
      </div>
      <br />
      <br />
    </form>
  </body>
</html>
