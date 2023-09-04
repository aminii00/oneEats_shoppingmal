<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>주문하기</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy2.css" />

    <!-- 배송요청사항 직접입력 선택했을 때 input창 떠요 -->
    <script>
      $(function () {
        $("#selboxDirect").hide();

        $("#selbox").change(function () {
          if ($("#selbox").val() == "direct") {
            $("#selboxDirect").show();
          } else {
            $("#selboxDirect").hide();
          }
        });
      });
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
            } else {
            }

            var choizongzuso = "(" + data.zonecode + ")" + addr;
            document.getElementById("address_input").value = choizongzuso;

            document.getElementById("address_detail_input").focus();
          },
        }).open();
      }
    </script>
    <!--다음 주소 api 스크립트 끝-->
  </head>
  <body>
    <!-- 주문/결제 -->
    <form
      method="post"
      action="${contextPath}/mypage/newOrder.do"
      id="orderForm"
    >
      <div class="div-p">
        <p class="p-1 extsize-2 text-left textcolor-black textbold">
          주문/결제
        </p>
      </div>

      <hr class="linebold" />

      <table class="textcolor-black textsize-2">
        <!-- 구매자정보 -->
        <tr class="tr-1">
          <th>구매자정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td>
            <input
              type="text"
              name="orderer_name"
              value="${memberInfo.name}"
              readonly
            />
          </td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input
              type="text"
              name="orderer_phone"
              value="${memberInfo.phone}"
              readonly
            />
          </td>
        </tr>

        <!-- 받는분정보 -->
        <tr class="tr-1">
          <th>받는분정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td>
            <input
              type="text"
              name="receiver_name"
              value="${memberInfo.name}"
            />
          </td>
        </tr>
        <tr>
          <td>배송주소</td>
          <td>
            <input
              onclick="execDaumPostCode()"
              readonly
              type="text"
              id="address_input"
              name="receiver_address"
              value="(${memberInfo.zipCode}) ${memberInfo.address}"
            /><br />
            <input
              type="text"
              id="address_detail_input"
              name="receiver_addressDetail"
              value="${memberInfo.address_detail}"
            />
          </td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input
              type="text"
              name="receiver_phone"
              value="${memberInfo.phone}"
            />
          </td>
        </tr>
        <tr>
          <td>배송요청사항</td>
          <td>
            <select id="selbox" name="receiver_comment">
              <option value="부재시 경비실에 맡겨주세요">
                부재시 경비실에 맡겨주세요
              </option>
              <option value="문앞에 놔주세요">문앞에 놔주세요</option>
              <option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
              <option value="direct">직접입력</option>
              <input type="text" id="selboxDirect" />
            </select>
          </td>
        </tr>

        <c:set var="used_point" value="${param.used_point}" />
        <!-- 적립금 -->
        <tr class="tr-1">
          <th>적립금</th>
        </tr>
        <tr>
          <td>보유적립금</td>
          <td>${memberInfo.point}</td>
        </tr>
        <tr>
          <td>사용적립금</td>
          <td>
            <input
              type="number"
              id="used_point"
              name="used_point"
              min="0"
              max="${memberInfo.point}"
              value="0"
            />
          </td>
        </tr>

        <c:set var="used_coupon" value="${param.used_coupon}" />
        <!-- 쿠폰 -->
        <tr class="tr-1">
          <th>쿠폰</th>
        </tr>
        <tr>
          <td>쿠폰사용</td>
          <td>
            <select name="used_couponId">
              <option value="0" selected>쿠폰을 선택해주세요</option>
              <c:forEach var="coupon" items="${couponList}">
                <option value="${coupon.couponNo}">${coupon.name}</option>
                <input
                  type="hidden"
                  id="used_coupon"
                  value="${coupon.discount_price}"
                />
              </c:forEach>
            </select>
          </td>
        </tr>

        <!-- 결제정보 -->
        <tr class="tr-1">
          <th>결제정보</th>
        </tr>
        <fmt:parseNumber
          var="percent"
          value="${payment_price*0.05}"
          integerOnly="true"
        />
        <c:set
          var="total_price"
          value="${payment_price-discount_price+shippingFee}"
        />
        <tr>
          <!-- value는 이엘태그로 값 넣어주기! -->
          <td>상품 금액</td>
          <td>
            <input
              type="hidden"
              name="payment_price"
              value="${payment_price}"
            />${payment_price}원
          </td>
        </tr>
        <tr>
          <td>상품 할인 금액</td>
          <td>
            <input
              type="hidden"
              name="discount_price"
              value="${discount_price}"
            />-${discount_price}원
          </td>
        </tr>
        <tr>
          <td>배송비</td>
          <td>
            <input
              type="hidden"
              name="shippingfee"
              value="${shippingfee}"
            />${shippingFee}원
          </td>
        </tr>
        <tr>
          <td>적립금액</td>
          <td>
            <input
              type="hidden"
              name="point_price"
              value="${percent}"
            />${percent}원
          </td>
        </tr>
        <tr>
          <td>총 결제금액</td>
          <td>
            <input
              type="hidden"
              name="total_price"
              value="${total_price}"
            />${total_price}원
          </td>
        </tr>
        <tr>
          <td>결제방법</td>
          <td>
            <div id="payment-method"></div>
          </td>
        </tr>
      </table>
      <input name="payment_type" type="hidden" />
      <hr class="linebold" style="margin: 0" />
      <br />

      <!-- 주문버튼 -->
      <div class="div-btn">
        <button
          class="btn-1 btn-regular bg-white textcolor-black btn-border"
          type="reset"
        >
          취소
        </button>
        <button
          class="btn-1 btn-regular bg-lightgreen textcolor-white textbold border-0"
          id="payment-request-button"
          onclick="fn_sendOrderInfo('${contextPath}')"
          type="button"
        >
          결제하기
        </button>
      </div>
    </form>
    <!--토스결제 api-->
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <script>
      const paymentWidget = PaymentWidget(
        "test_ck_kYG57Eba3GZb4JRkMzQ8pWDOxmA1",
        // 비회원 customerKey
        PaymentWidget.ANONYMOUS
      );

      /**
       * 결제창을 렌더링합니다.
       * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
       */
      paymentWidget.renderPaymentMethods("#payment-method", {
        value: "${total_price}",
        currency: "KRW",
        country: "KR",
      });

      function fn_sendOrderInfo(contextPath) {
        var formData = $("#orderForm").serialize();

        $.ajax({
          type: "POST",
          url: contextPath + "/storeOrderInfo.do",
          data: formData,
          success: function (response) {
            if (response == "success") {
              alert("저장되었습니다.");
              fn_requestPayment();
            } else {
              alert("주문정보를 저장하지 못 했습니다.");
            }
          },
          error: function (response) {
            alert("원인불명의 에러");
            console.log(response);
          },
        });
      }

      function fn_requestPayment() {
        paymentWidget.requestPayment({
          orderId: generateRandomString(),
          orderName: "테스트 주문",
          successUrl: window.location.origin + "/toss/orderSuccess.do",
          failUrl: window.location.origin + "/toss/orderFail.do",
          customerName: "${memberInfo.name}",
        });
      }

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    </script>
    <!--토스결제 api 끝-->
  </body>
</html>
