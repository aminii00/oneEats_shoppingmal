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
    <title>회원가입 창</title>
    <script>
      // 체크박스 전체 선택
      $(".checkbox_group").on("click", "#check_all", function () {
        var checked = $(this).is(":checked");

        if (checked) {
          $(this)
            .parents(".checkbox_group")
            .find("input")
            .prop("checked", true);
        } else {
          $(this)
            .parents(".checkbox_group")
            .find("input")
            .prop("checked", false);
        }
      });
      // 체크박스 개별 선택
      $(".checkbox_group").on("click", ".normal", function () {
        var checked = $(this).is(":checked");

        if (!checked) {
          $("#check_all").prop("checked", false);
        }
      });

      function chkPW() {
        var pwd = $("#pwd").val();
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/gi);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        if (pwd.length < 8 || pwd.length > 12) {
          alert("8자리 ~ 20자리 이내로 입력해주세요.");
          return false;
        } else if (pwd.search(/\s/) != -1) {
          alert("비밀번호는 공백 없이 입력해주세요.");
          return false;
        } else if (num < 0 || eng < 0 || spe < 0) {
          alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
          return false;
        } else {
          console.log("통과");
          return true;
        }
      }
    </script>

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

            document.getElementById("sample6_postcode").value = data.zonecode; // 우편번호
            document.getElementById("address_input").value = addr;

            document.getElementById("address_detail_input").focus(); // 상세주소
          },
        }).open();
      }
    </script>
    <!--다음 주소 api 스크립트 종료-->

    <style>
      .agreement-container {
        color: black;
      }
      form {
        padding: 10px;
      }
      .circle {
        display: inline-block; /* 영역적용가능해짐 */
        width: 20px;
        height: 20px;
        border: 2px solid #333;
        box-sizing: border-box;
        border-radius: 10px; /* 모서리둥글게 처리 */
        position: relative;
        top: 4px;
        cursor: pointer; /* 마우스 올렸을때 손모양 처리 */
      }
      .circle:after {
        content: "\2714"; /* 체크박스 특수문자 */
        font-size: 24px;
        color: #333;
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
    </style>
  </head>
  <body>
    <br />
    <form method="post" action="${contextPath}/member/register.do">
      <div class="main-container">
        <div class="main-wrap">
          <div class="textsize-3 textbold text-left">
            회원가입
            <div class="mainline"></div>
            <br />
            <br />
          </div>
          <div class="margin1 textbold textsize-1 text-left">
            아이디<span class="textcolor-red">*</span>
          </div>
          <input
            class="brd-lightgray btn-round btn-midlong-input textsize-1 border-0.5"
            name="id"
            placeholder=" 아이디를 입력해 주세요."
            type="text"
            required
          />
          &nbsp
          <button
            class="btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 btn-round"
          >
            중복확인</button
          ><br />

          <c:set var="name" value="홍길동" />
          <c:if test="${name eq '홍길동'}">
            <c:out value="${str}" />
          </c:if>

          <br />
          <p class="text-left textsize-1 margin1 textbold">
            비밀번호<span class="textcolor-red">*</span>
          </p>
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            onclick="chkPW"
            id="pwd"
            name="pwd"
            placeholder=" 비밀번호를 입력해 주세요.."
            type="password"
            required
          />
          <br />
          <p class="text-left textsize-1 margin1 textbold">
            비밀번호 확인<span class="textcolor-red">*</span>
          </p>
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            placeholder=" 비밀번호를 한 번 더 입력해주세요."
            type="password"
            required
          />
          <br />
          <p class="text-left textsize-1 margin1 textbold">
            이름<span class="textcolor-red">*</span>
          </p>
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            name="name"
            placeholder=" 이름을 입력해 주세요."
            type="text"
            required
          />
          <br />
          <p class="text-left textsize-1 margin1 textbold">이메일</p>
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            name="email"
            placeholder=" 이메일을 입력해 주세요."
            type="text"
          />
          <br />
          <p class="text-left textsize-1 margin1 textbold">
            휴대폰 번호<span class="textcolor-red">*</span>
          </p>
          <input
            class="brd-lightgray btn-round btn-midlong-input textsize-1"
            name="phone"
            placeholder=" 휴대폰 번호를 입력해 주세요."
            type="text"
            required
          />
          &nbsp
          <button
            class="btn-fatfat-mina bg-lightgreen textsize-0 border-0 margin btn-round textbold"
          >
            인증번호요청</button
          ><br />
          <input
            class="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin1"
            placeholder=" 인증번호를 입력하세요."
            type="text"
          /><br />
          <span class="textsize-0 margin-id"
            >인증번호가 오지 않는다면, 통신사 수신 차단 혹은 휴대폰 번호</span
          ><br />
          <span class="textsize-0 margin-id">차단 여부를 확인해 주세요.</span>

          <p class="text-left textsize-1 margin1 textbold">주소</p>
          <button
            type="button"
            onclick="execDaumPostCode()"
            class="btn-midlong bg-lightgreen margin textsize-1 border-0 btn-round"
          >
            주소 검색
          </button>

          <input
            type="hidden"
            id="sample6_postcode"
            placeholder="우편번호"
            name="zipCode"
          />

          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            name="address"
            type="text"
            id="address_input"
            placeholder="주소"
            readonly
          />
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            type="text"
            id="address_extra_input"
            placeholder="참고항목"
            readonly
          />
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            name="address_detail"
            type="text"
            id="address_detail_input"
            placeholder=" 상세주소를 입력해 주세요."
          />
          <input type="hidden" id="sample6_postcode" name="zipCode" />
          <br />
          <p class="text-left textsize-1 margin1 textbold">성별</p>
          <div class="btn-tinylong margin textsize-1 border-0 btn-round">
            <input type="radio" name="gender" value="m" /><span
              class="textsize-1"
              >남</span
            >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="radio" name="gender" value="w" /><span
              class="textsize-1"
              >여</span
            >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input type="radio" name="no" value="no" checked /><span
              class="textsize-1"
              >선택안함</span
            >
          </div>

          <p class="text-left textsize-1 margin1 textbold">생년월일</p>
          <input
            class="brd-lightgray btn-round btn-midlong textsize-1"
            name="birth"
            placeholder="  YYYY  -  MM  -  DD"
            type="date"
          />
          <br />
          <div class="line"></div>

          <br />
          <div class="agreement-container">
            <p class="text-left textsize-1 margin1 textbold">
              <input
                class="text-left"
                type="checkbox"
                id="allcheck"
                name="check1"
                value="agreeTotal"
              /><label>&nbsp&nbsp&nbsp전체 약관 동의</label>
            </p>
            <br /><br />

            <input
              class="req_checkbox"
              type="checkbox"
              name="check1"
              value="1"
            />&nbsp&nbsp&nbsp[필수]서비스 이용 약관 동의<br /><br />
            <input
              class="req_checkbox"
              type="checkbox"
              name="check2"
              value="1"
            />&nbsp&nbsp&nbsp[필수]개인정보 수집 및 이용에 동의<br /><br />
            <input
              class="req_checkbox"
              type="checkbox"
              name="check3"
            />&nbsp&nbsp&nbsp[선택]긴급 할인 등 정보,혜택 수신 동의<br />
            &nbsp&nbsp&nbsp&nbsp<input
              type="checkbox"
              name="sms_agreement"
              value="yes"
            />&nbsp&nbsp&nbsp&nbsp SMS &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <input
              class="req_checkbox"
              type="checkbox"
              name="email_agreement"
              value="yes"
            />&nbsp&nbsp&nbsp이메일<br /><br />
            <input
              class="req_checkbox"
              type="checkbox"
              name="check4"
            />&nbsp&nbsp&nbsp[필수]본인은 만 14세 이상입니다.<br /><br />
            <br />
          </div>
          <button
            type="submit"
            class="btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round"
          >
            회원가입 완료
          </button>
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
        </div>
      </div>
    </form>

    <br />
  </body>
</html>
