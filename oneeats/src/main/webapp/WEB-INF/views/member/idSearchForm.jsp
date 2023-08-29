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
    <title>로그인창</title>
    <style>
      .fade {
        display: none;
      }
      .fade.active {
        display: inherit;
      }

      .nav-link.active {
        background-color: rgb(226, 226, 226);
      }
    </style>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />

    <script>
      var contextPath = "${contextPath}";
      var check_map = new Map([
        ["phone1", false],
        ["phone2", false],
      ]);

      function changeMessage(elname, str, clr) {
        $("#errmsg_" + elname).removeClass();
        $("#errmsg_" + elname).addClass(clr + "Text");
        if (str.length < 1) {
          $("#errmsg_" + elname).html("&nbsp;");
        } else {
          $("#errmsg_" + elname).text(str);
        }
      }
      function fn_phone_inzung(num) {
        var phone_text = $("#phone" + num).val();
        var inzung_bunho = $("#inzung" + num).val();

        $.ajax({
          type: "post",
          async: true,
          dataType: "text",
          data: {
            bunho: inzung_bunho,
            phone: phone_text,
          },
          url: contextPath + "/phoneInzung.do",
          success: function (data, textStatus) {
            if (data == "success") {
              changeMessage("inzung" + num, "인증되었습니다.", "blue");
              $("#phone" + num).attr("readonly", "readonly");
              $("#inzung" + num).attr("readonly", "readonly");
              check_map.set("phone" + num, true);
            } else if (data == "fail") {
              changeMessage("inzung" + num, "인증되지 않았습니다.", "red");
            } else {
              changeMessage("inzung" + num, "원인불명의 에러 발생", "red");
            }
          },
          error: function (xhr, status, error) {
            alert("에러발생");
          },
          complete: function (data) {
            // alert("성공적으로 처리되었습니다.");
          },
        });
      }

      function fn_open_inzung_row(num) {
        var phone_text = $("#phone" + num).val();
        var regex = /[^a-zA-Z0-9]/;
        phone_text = phone_text.replace(/-/g, "");

        if (phone_text.length < 8 || regex.test(phone_text)) {
          alert("휴대폰 번호를 입력해주세요");
          $("#phone" + num).focus();
        } else {
          $("#phone" + num).val(phone_text);
          $(".inzung_row" + num).show();
        }
      }

      $(document).ready(function () {
        $(".nav-link").click(function () {
          $(".nav-link").removeClass("active");
          $(this).addClass("active");

          // Hide all tab content
          $(".tab-pane").removeClass("show active");

          $($(this).attr("href")).addClass("show active");
        });

        $("#registerForm1").submit(function (event) {
          event.preventDefault();
          if (check_map.get("phone1") == false) {
            alert("휴대폰 인증을 해주세요.");
            return false;
          }
          $(this).unbind("submit").submit();
        });

        $("#registerForm2").submit(function (event) {
          if (check_map.get("phone2") == false) {
            alert("휴대폰 인증을 해주세요");
            return false;
          }
          $(this).unbind("submit").submit();
        });
      });
    </script>
  </head>
  <body>
    <br />
    <br />
    <br />
    <div class="main-container">
      <div class="main-wrap">
        <div class="row textsize-3 textbold text-center">
          <div class="col-md">
            <a
              id="id_search_btn"
              class="nav-link active"
              role="tab"
              data-toggle="tab"
              href="#tab1"
              aria-selected="true"
              >아이디 찾기</a
            >
          </div>

          <div class="col-md">
            <a
              id="pw_search_btn"
              class="nav-link"
              role="tab"
              data-toggle="tab"
              href="#tab2"
              aria-selected="false"
              >비밀번호 찾기</a
            >
          </div>
        </div>
        <hr class="line-black" />
        <br />

        <div
          class="id_search_form tab-pane fade show active"
          role="tabpanel"
          id="tab1"
        >
          <form
            action="${contextPath}/member/idSearch.do"
            method="post"
            id="registerForm1"
          >
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">이름</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="name"
                  placeholder=" 이름을 입력해주세요."
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">휴대폰번호</div>
              <div class="col-md input-group">
                <input
                  class="form-control"
                  id="phone1"
                  name="phone"
                  placeholder=" 휴대폰 번호를 입력해 주세요."
                  type="text"
                />
                <div class="input-group-append">
                  <button
                    type="button"
                    class="bg-lightgray border-0"
                    onclick="fn_open_inzung_row(1)"
                  >
                    인증번호 요청
                  </button>
                </div>
              </div>
            </div>
            <br />
            <div class="row inzung_row1 toggle-content">
              <div class="col">
                <div class="row">
                  <div class="col-md-3"></div>
                  <div class="col-md input-group">
                    <input
                      class="form-control"
                      id="inzung1"
                      placeholder=" 인증번호를 입력하세요."
                      type="text"
                    />
                    <div class="input-group-append">
                      <button
                        type="button"
                        onclick="fn_phone_inzung(1)"
                        class="bg-lightgreen border-0"
                      >
                        인증번호 확인
                      </button>
                    </div>
                  </div>
                </div>
                <br />
                <div id="errmsg_inzung1"></div>
                <div class="row">
                  <div class="col">
                    <span class="textsize-0 textcolor-red"
                      >인증번호가 오지 않는다면, <br />
                      통신사 수신 차단 혹은 휴대폰 번호 차단 여부를 확인해
                      주세요.</span
                    ><br />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <button type="submit" class="btn-long bg-lightgreen border-0">
              확인
            </button>
          </form>
        </div>

        <div class="pw_search_form tab-pane fade" role="tabpanel" id="tab2">
          <form
            action="${contextPath}/member/pwdSearch.do"
            method="post"
            id="registerForm2"
          >
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">아이디</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="id"
                  placeholder="아이디를 입력해주세요."
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">이름</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="name"
                  placeholder=" 이름을 입력해주세요."
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">휴대폰번호</div>
              <div class="col-md input-group">
                <input
                  class="form-control"
                  id="phone2"
                  name="phone"
                  placeholder=" 휴대폰 번호를 입력해 주세요."
                  type="text"
                />
                <div class="input-group-append">
                  <button
                    type="button"
                    class="bg-lightgray border-0"
                    onclick="fn_open_inzung_row(2)"
                  >
                    인증번호 요청
                  </button>
                </div>
              </div>
            </div>
            <br />
            <div class="row inzung_row2 toggle-content">
              <div class="col">
                <div class="row">
                  <div class="col-md-3"></div>
                  <div class="col-md input-group">
                    <input
                      class="form-control"
                      id="inzung2"
                      placeholder=" 인증번호를 입력하세요."
                      type="text"
                    />
                    <div class="input-group-append">
                      <button
                        class="bg-lightgray border-0"
                        type="button"
                        onclick="fn_phone_inzung(2)"
                      >
                        인증번호 확인
                      </button>
                    </div>
                  </div>
                </div>
                <br />
                <div id="errmsg_inzung2"></div>
                <div class="row">
                  <div class="col">
                    <span class="textsize-0 textcolor-red btn-midlong textbold"
                      >인증번호가 오지 않는다면, <br />
                      통신사 수신 차단 혹은 휴대폰 번호 차단 여부를 확인해
                      주세요.</span
                    ><br />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <button type="submit" class="btn-long bg-lightgreen border-0">
              확인
            </button>
          </form>
        </div>
      </div>
    </div>
    <br />
    <br />
    <br />
    <br />
  </body>
</html>
