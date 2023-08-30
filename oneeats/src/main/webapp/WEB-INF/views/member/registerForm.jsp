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
    <title>회원가입 창</title>

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
      // 다음 주소 api 스크립트 종료

      // 팝업창 띄우기
      function openPopUp() {
        // 함수 동작 테스트
        //alert("팝업 테스트");

        //window.open("[팝업을 띄울 파일명 path]", "[별칭]", "[팝업 옵션]")
        window.open(
          "mypageAddressAddForm.jsp",
          "배송지추가",
          "width=450, height=250, top=150, left=200"
        );
      }
      function showHidden() {
        alert(document.testForm.flag.value);
      }
    </script>

    <!---->

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
        ["id", false],
        ["pwd", false],
        ["pwd_confirm", false],
        ["phone", false],
      ]);

      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";
    </script>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
    <script src="${contextPath}/js/registerForm.js"></script>
  </head>
  <body>
    <br />
    <form
      id="registerForm"
      method="post"
      action="${contextPath}/member/register.do"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
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
                <span>아이디<span class="textcolor-red">*</span></span>
              </div>
            </div>
            <div class="col-md input-group">
              <input
                class="form-control"
                id="id"
                name="id"
                placeholder="아이디를 입력해주세요"
                type="text"
                required
              />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen border-0"
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
            <div class="col-md"><span id="errmsg_id">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="textbold textsize-2 text-left">
                <span> 비밀번호<span class="textcolor-red">*</span> </span>
              </div>
            </div>
            <div class="col-md">
              <input
                class="form-control"
                id="pwd"
                name="pwd"
                placeholder="영숫자+특수문자를 포함한 8~12자"
                type="password"
                required
              />
            </div>
          </div>

          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_pwd">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="text-left textsize-2 textbold">
                <span> 비밀번호 확인<span class="textcolor-red">*</span> </span>
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
                <span>이름<span class="textcolor-red">*</span></span>
              </div>
            </div>
            <div class="col-md">
              <input
                class="form-control"
                id="name"
                name="name"
                placeholder=" 이름을 입력해 주세요"
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
                type="text"
              />
            </div>
          </div>
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_email">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="text-left textsize-2 textbold">
                <span>휴대폰 번호<span class="textcolor-red">*</span></span>
              </div>
            </div>
            <div class="col-md input-group">
              <input
                class="form-control"
                id="phone"
                name="phone"
                placeholder="휴대폰번호를 입력해주세요"
                type="text"
                required
              />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen border-0"
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
            <div class="col-md"><span id="errmsg_phone">&nbsp;</span></div>
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
                      class="border-0"
                    >
                      인증
                    </button>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md"><span id="errmsg_inzung">&nbsp;</span></div>
              </div>
              <br />
              <div class="row">
                <div class="col">
                  인증번호가 오지 않는다면, <br />
                  통신사 수신 차단 혹은 휴대폰 번호 차단 여부를 확인해 주세요.
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
          />

          <div class="row">
            <div class="col">
              <input
                class="form-control"
                name="address"
                type="text"
                id="address_input"
                placeholder="주소"
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
                class="bg-lightgreen btn-long border-0"
              >
                주소 검색
              </button>
            </div>
          </div>
          <input type="hidden" id="h_input_zipcode" name="zipCode" />
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
              <input type="radio" name="gender" value="no" checked /><span
                class="textsize-2"
                >선택안함</span
              >
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
              />
            </div>
          </div>

          <br />
          <div class="line"></div>

          <br />
          <div class="agreement-container">
            <div class="row">
              <div
                class="col text-left textsize-2 margin1 textbold select-check"
              ></div>
            </div>
            <br />

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
                    <input class="req_checkbox check_box" type="checkbox" />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <div class="row agreement_box_grid">
              <div class="col">
                <div class="row toggle-btn border-bottom">
                  <div class="col">[필수]개인정보 수집 및 이용에 동의</div>
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
                    <input class="req_checkbox check_box" type="checkbox" />
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
                ><input class="req_checkbox check_box" type="checkbox" />
              </div>
            </div>
          </div>
          <br />
          <div class="row">
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
    </form>

    <br />
  </body>
</html>
