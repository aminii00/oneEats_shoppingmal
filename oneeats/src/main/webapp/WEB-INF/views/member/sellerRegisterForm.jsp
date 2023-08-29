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
    <title>사업자 회원가입</title>
    <style>
      .redText {
        color: red;
      }
      .blueText {
        color: green;
      }
      .fade {
        display: none;
      }
      .fade.active {
        display: inherit;
      }

      a.active {
        background-color: rgb(226, 226, 226);
        border-top: 4px solid #a3d060;
      }
      .brd-lightgreen {
        border: 0.5px;
        border-style: solid;
        border-color: #a3d060;
      }
      .sellermain-wrap {
        max-width: 600px;
        margin: auto;
      }
      .seller_registerForm_wrap {
        max-width: 600px;
        margin: auto;
      }
      .seller_registerForm_header {
        max-width: 600px;
      }
      .sellermain-wrap .main-wrap {
        padding: 8px;
      }

      .sellermain-wrap .main-wrap a {
        min-width: 120px;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .seller_registerForm_wrap .main-wrap {
        min-height: auto;
      }
    </style>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />

    <!-- 다음 주소 api 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function execDaumPostCode() {
        new daum.Postcode({
          oncomplete: function (data) {
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            if (data.userSelectedType === "R") {
              addr = data.roadAddress;
            } else {
              addr = data.jibunAddress;
            }

            if (data.userSelectedType === "R") {
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }

              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? ", " + data.buildingName
                    : data.buildingName;
              }

              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }

              document.getElementById("address_extra_input").value = extraAddr; //참고항목
            } else {
              document.getElementById("address_extra_input").value = "";
            }

            document.getElementById("h_input_zipcode").value = data.zonecode; // 우편번호
            document.getElementById("address_input").value = addr;

            document.getElementById("address_detail_input").focus(); // 상세주소
          },
        }).open();
      }
    </script>
    <!--다음 주소 api 스크립트 종료-->

    <script>
      var check_map = new Map([
        ["id", false],
        ["pwd", false],
        ["pwd_confirm", false],
        ["phone", false],
        ["busNo", false],
      ]);
      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";
      $(document).ready(function () {
        $(".nav-link").click(function () {
          $(".nav-link").removeClass("active");
          $(this).addClass("active");

          $(".tab-pane").removeClass("show active");

          $($(this).attr("href")).addClass("show active");

          var num = $(this).attr("value");
          $("a.tab-menu").removeClass("active");
          $("#register" + num).addClass("active");
        });
      });

      function fn_bus_inzung() {
        var inzung_bunho = $("input[name=busNo]").val();
        var regex = /[^0-9]/;
        if (regex.test(inzung_bunho)) {
          alert("올바른 인증번호를 입력해주세요");
          return false;
        }

        var path = contextPath + "/busInzung.do";
        $.ajax({
          type: "post",
          async: true,
          dataType: "text",
          data: {
            bunho: inzung_bunho,
          },
          url: path,
          success: function (data, textStatus) {
            if (data == "success") {
              alert("인증되었습니다.");
              $("input[name=busNo]").attr("readonly", "readonly");
              check_map.set("busNo", true);
            } else if (data == "fail") {
              alert("인증에 실패했습니다.");
            } else {
              alert("원인불명의 에러 발생");
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
    </script>
    <script src="${contextPath}/js/registerForm.js"></script>
  </head>
  <body>
    <form
      method="post"
      id="registerForm"
      action="${contextPath}/member/sellerRegister.do"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="sellermain-wrap">
          <div class="textsize-3 textbold">
            <div class="mainline"></div>

            <div class="seller_registerForm_header">
              <div class="row">
                <div class="col">
                  <c:choose>
                    <c:when test="${empty registerResult}">
                      <a id="register1" class="tab-menu active">사업자인증</a>
                    </c:when>
                    <c:otherwise>
                      <a id="register1" class="tab-menu">사업자인증</a>
                    </c:otherwise>
                  </c:choose>
                </div>
                <div class="col">
                  <a id="register2" class="tab-menu">약관동의</a>
                </div>
                <div class="col">
                  <a id="register3" class="tab-menu">정보입력</a>
                </div>
                <div class="col">
                  <c:choose>
                    <c:when test="${empty registerResult}">
                      <a id="register4" class="tab-menu">가입완료</a>
                    </c:when>
                    <c:otherwise>
                      <a id="register4" class="tab-menu active">가입완료</a>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>

            <br />
            <hr class="line-black" />
            <div class="seller_registerForm_wrap">
              <c:choose>
                <c:when test="${empty registerResult}">
                  <div
                    class="busNo-container brd-lightgreen tab-pane fade show active"
                    role="tabpanel"
                    id="tab1"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <span class="textsize-3"
                            >One.Eats에 오신 것을 환영합니다.</span
                          >
                          <hr class="line-gray" />
                          <span class="textsize-2"
                            >사업자 회원가입 페이지 입니다.</span
                          >
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col input-group">
                          <input
                            class="form-control"
                            name="busNo"
                            maxlength="10"
                            placeholder=" 사업자 등록번호 10자리"
                            value="${busNo}"
                          />
                          <div class="input-group-append">
                            <button
                              onclick="fn_bus_inzung()"
                              type="button"
                              class="bg-lightgreen textsize-2 border-0"
                            >
                              인증
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <div class="text-center textsize-1">
                            사업자 회원으로 가입하려면 사업자등록증 인증이
                            필요합니다.
                            <br />
                            사업자등록증을 미리 준비해주세요.
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <a
                            href="#tab2"
                            class="nav-link btn-long bg-lightgreen textsize-2 border-0"
                            role="tab"
                            data-toggle="tab"
                            value="2"
                          >
                            다음으로
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="agreement-container tab-pane fade"
                    role="tabpanel"
                    id="tab2"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col agreement_box_col">
                              <input
                                class="text-left"
                                type="checkbox"
                                id="allcheck"
                              /><span>전체 약관 동의</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col">[필수]서비스 이용 약관 동의</div>
                            <div class="float-right">
                              <img
                                class="agreement_arrow_icon"
                                src="${contextPath}/img/icon/downarrow.png"
                                alt=""
                              />
                            </div>
                          </div>
                          <div class="row toggle-content">
                            <div class="col-md">
                              <div class="row">
                                <div class="col">이용규약 내용 <br /></div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md agreement_box_col">
                              <span>약관 내용에 동의합니다.</span>
                              <input
                                class="req_checkbox check_box"
                                type="checkbox"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col">
                              [필수]개인정보 수집 및 이용에 동의
                            </div>
                            <div class="float-right">
                              <img
                                class="agreement_arrow_icon"
                                src="${contextPath}/img/icon/downarrow.png"
                                alt=""
                              />
                            </div>
                          </div>
                          <div class="row toggle-content">
                            <div class="col-md">
                              <div class="row">
                                <div class="col">이용규약 내용 <br /></div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md agreement_box_col">
                              <span>약관 내용에 동의합니다.</span>
                              <input
                                class="req_checkbox check_box"
                                type="checkbox"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col select-check">
                          <div class="row border-bottom">
                            <div class="col">
                              [선택]긴급 할인 등 정보,혜택 수신 동의<br />
                            </div>
                          </div>
                          <div class="row">
                            <div class="col agreement_box_col">
                              <input
                                type="checkbox"
                                name="sms_agreement"
                                class="check_box"
                                value="yes"
                              />
                              <span>SMS</span>
                              <input
                                class="check_box"
                                type="checkbox"
                                name="email_agreement"
                                value="yes"
                              /><span>이메일</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col agreement_box_col">
                          <span>[필수]본인은 만 14세 이상입니다.</span
                          ><input
                            class="req_checkbox check_box"
                            type="checkbox"
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab1"
                            role="tab"
                            data-toggle="tab"
                            value="1"
                          >
                            이전으로
                          </a>
                        </div>
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab3"
                            role="tab"
                            data-toggle="tab"
                            value="3"
                          >
                            다음으로
                          </a>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">&nbsp;</div>
                    </div>
                  </div>
                  <div
                    class="form-container tab-pane fade"
                    role="tabpanel"
                    id="tab3"
                  >
                    <div class="main-wrap">
                      <div class="row">
                        <div class="col textsize-3 textbold text-center">
                          회원가입
                          <div class="line-black"></div>
                          <br />
                          <br />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="textbold textsize-2 text-left">
                            <span
                              >아이디<span class="textcolor-red">*</span></span
                            >
                          </div>
                        </div>
                        <div class="col-md input-group">
                          <input
                            class="form-control"
                            id="id"
                            name="id"
                            placeholder="아이디를 입력해주세요"
                            type="text"
                            value="${id}"
                            required
                          />
                          <div class="input-group-append">
                            <button
                              class="bg-lightgreen border-0 textsize-2"
                              type="button"
                              onclick="checkDuplicateId()"
                            >
                              중복확인
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_id">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="textbold textsize-2 text-left">
                            <span>
                              비밀번호<span class="textcolor-red">*</span>
                            </span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="pwd"
                            name="pwd"
                            placeholder="영숫자+특수문자를 포함한 8~12자"
                            value="${pwd}"
                            type="password"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_pwd">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span>
                              비밀번호 확인<span class="textcolor-red">*</span>
                            </span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            placeholder=" 비밀번호를 한 번 더 입력해주세요"
                            id="pwd_confirm"
                            type="password"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_pwd_confirm">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span
                              >이름<span class="textcolor-red">*</span></span
                            >
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="name"
                            name="name"
                            placeholder=" 이름을 입력해 주세요"
                            value="${name}"
                            type="text"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md" id="errmsg_name">&nbsp;</div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span>이메일</span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="email"
                            name="email"
                            placeholder=" 이메일을 입력해 주세요"
                            value="${email}"
                            type="text"
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_email">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span
                              >휴대폰 번호<span class="textcolor-red"
                                >*</span
                              ></span
                            >
                          </div>
                        </div>
                        <div class="col-md input-group">
                          <input
                            class="form-control"
                            id="phone"
                            name="phone"
                            placeholder="휴대폰번호를 입력해주세요"
                            type="text"
                            value="${phone}"
                            required
                          />
                          <div class="input-group-append">
                            <button
                              class="bg-lightgreen border-0 textsize-2"
                              onclick="fn_open_inzung_row()"
                              type="button"
                            >
                              인증번호요청
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_phone">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row toggle-content inzung_row">
                        <div class="col">
                          <div class="row">
                            <div class="col input-group">
                              <input
                                class="form-control"
                                id="inzung"
                                placeholder=" 인증번호를 입력하세요"
                                type="text"
                              />
                              <div class="input-group-append">
                                <button
                                  onclick="fn_phone_inzung()"
                                  type="button"
                                  class="border-0 textsize-2"
                                >
                                  인증
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md">
                              <span id="errmsg_inzung">&nbsp;</span>
                            </div>
                          </div>
                          <br />
                          <div class="row">
                            <div class="col">
                              인증번호가 오지 않는다면, <br />
                              통신사 수신 차단 혹은 휴대폰 번호 차단 여부를
                              확인해 주세요.
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col-md-3 text-left textsize-2 textbold">
                          <span class="">주소</span>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <input
                        type="hidden"
                        id="h_input_zipcode"
                        placeholder="우편번호"
                        name="zipCode"
                        value="${zipCode}"
                      />
                      <div class="row">
                        <div class="col">
                          <input
                            class="form-control textsize-2"
                            name="address"
                            type="text"
                            id="address_input"
                            placeholder="주소"
                            value="${address}"
                            readonly
                          />
                        </div>
                        <div class="col">
                          <input
                            class="form-control"
                            type="text"
                            id="address_extra_input"
                            placeholder="참고항목"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <input
                            class="form-control"
                            name="address_detail"
                            type="text"
                            id="address_detail_input"
                            value="${address_detail}"
                            placeholder=" 상세주소를 입력해 주세요."
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <button
                            type="button"
                            onclick="execDaumPostCode()"
                            class="bg-lightgreen btn-long border-0 textsize-2"
                          >
                            주소 검색
                          </button>
                        </div>
                      </div>

                      <br />
                      <div class="row">
                        <div class="col-md-3">
                          <div class="text-left textsize-2 textbold">
                            <span>성별</span>
                          </div>
                        </div>
                        <div class="col-md select-radio">
                          <input type="radio" name="gender" value="m" /><span
                            class="textsize-2"
                            >남</span
                          >
                          <input type="radio" name="gender" value="w" /><span
                            class="textsize-2"
                            >여</span
                          >
                          <input
                            type="radio"
                            name="gender"
                            value="no"
                            checked
                          /><span class="textsize-2">선택안함</span>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col-md-3">
                          <div class="text-left textsize-2 textbold">
                            <span>생년월일</span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            name="birth"
                            placeholder="  YYYY  -  MM  -  DD"
                            type="date"
                            value="${birth}"
                          />
                        </div>
                      </div>
                      <br />
                      <div class="line"></div>
                      <br />
                      <div class="row">
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab2"
                            role="tab"
                            data-toggle="tab"
                            value="2"
                          >
                            이전으로
                          </a>
                        </div>
                        <div class="col">
                          <button
                            type="submit"
                            class="bg-lightgreen textsize-2 border-0 btn-long"
                          >
                            회원가입 완료
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:otherwise>
                  <div
                    class="brd-lightgreen tab-pane fade show active"
                    role="tabpanel"
                    id="tab4"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <span class="textsize-3"
                            >One.Eats 회원이 되신 것을 환영합니다.</span
                          ><br />
                          <span class="textsize-2"
                            >로그인 후 다양한 혜택을 경험해 보세요.</span
                          >
                        </div>
                      </div>

                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <button
                            type="button"
                            onclick="location.href='${contextPath}/member/loginForm.do'"
                            class="bg-lightgreen btn-long border-0 textsize-2"
                          >
                            로그인하러 가기
                          </button>
                        </div>
                        <div class="row">&nbsp;</div>
                        <div class="row">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <br />
        </div>
      </div>
    </form>
  </body>
</html>
