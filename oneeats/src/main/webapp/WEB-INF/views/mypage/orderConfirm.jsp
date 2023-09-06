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
            document.getElementById("h_input_zipcode").value = data.zonecode;
            document.getElementById("address_input").value = choizongzuso;

            document.getElementById("address_detail_input").focus();
          },
        }).open();
      }
    </script>
    <!--다음 주소 api 스크립트 끝-->

    <script>
      function fn_changeText(d_price, t_price) {
        $("input[name=discount_price]").val(d_price);
        $("#discount_price_text").text("-" + d_price + "원");
        $("input[name=total_price]").val(t_price);
        $("#total_price_text").text(t_price + "원");
      }
      $(document).ready(function () {
        $("#used_point").on("change", function () {
          var used_point = parseInt($("#used_point").val());
          var original_discount_price = parseInt(
            $("#h_original_discount_price").val()
          );
          var coupon_discount_price = parseInt(
            $("#h_coupon_discount_price").val()
          );
          var payment_price = parseInt($("input[name=payment_price]").val());
          var new_total_price =
            payment_price -
            used_point -
            coupon_discount_price -
            original_discount_price;
          if (new_total_price < 0) {
            alert("포인트를 더이상 쓸 수 없습니다.");
            $(this).val(0);
            used_point = 0;
            new_total_price =
              payment_price -
              used_point -
              coupon_discount_price -
              original_discount_price;
          }
          var new_discount_price =
            used_point + coupon_discount_price + original_discount_price;
          fn_changeText(new_discount_price, new_total_price);
        });

        $("select[name=used_couponId]").on("change", function () {
          var couponNo = $(this).val();
          console.log("couponNo:" + couponNo);
          if (parseInt(couponNo) != 0) {
            $.ajax({
              type: "POST",
              url: "/mypage/selectCoupon.do",
              data: {
                couponNo: couponNo,
              },
              success: function (response) {
                console.log(response);
                var result = response.result;

                if (result == "success") {
                  console.log("success if 실행");
                  var total_price = parseInt(
                    $("input[name=total_price]").val()
                  );
                  if (parseInt(result.condition) > total_price) {
                    alert("쿠폰 사용조건을 만족하지 못 했습니다.");
                  } else {
                    var discount_price = parseInt(response.discount_price);
                    var used_point = parseInt($("#used_point").val());
                    var original_discount_price = parseInt(
                      $("#h_original_discount_price").val()
                    );
                    var payment_price = parseInt(
                      $("input[name=payment_price]").val()
                    );
                    var coupon_discount_price = discount_price;
                    var new_total_price =
                      payment_price -
                      used_point -
                      coupon_discount_price -
                      original_discount_price;
                    if (new_total_price < 0) {
                      alert("쿠폰을 쓸 수 없습니다.");
                      $(this).val(0);
                      $("#h_coupon_discount_price").val(0);
                      coupon_discount_price = 0;
                      new_total_price =
                        payment_price -
                        used_point -
                        coupon_discount_price -
                        original_discount_price;
                    }
                    var new_discount_price =
                      used_point +
                      coupon_discount_price +
                      original_discount_price;
                    console.log(coupon_discount_price);
                    fn_changeText(new_discount_price, new_total_price);
                  }
                } else {
                  alert("쿠폰 정보를 가져오는 데에 실패했습니다.");
                }
              },
              error: function (response) {
                alert("원인불명의 에러");
                console.log(response);
              },
            });
          } else {
            var used_point = parseInt($("#used_point").val());
            var original_discount_price = parseInt(
              $("#h_original_discount_price").val()
            );
            var payment_price = parseInt($("input[name=payment_price]").val());
            var coupon_discount_price = 0;
            var new_total_price =
              payment_price -
              used_point -
              coupon_discount_price -
              original_discount_price;
            var new_discount_price =
              used_point + coupon_discount_price + original_discount_price;
            console.log(coupon_discount_price);
            fn_changeText(new_discount_price, new_total_price);
          }
        });
      });
    </script>
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
              type="hidden"
              id="h_input_zipCode"
              name="zipCode"
              value="${memberInfo.zipCode}"
            />
            <input
              onclick="execDaumPostCode()"
              readonly
              type="text"
              id="address_input"
              name="receiver_address"
              value="(${memberInfo.zipCode}) ${memberInfo.address}"
              placeholder="주소"
            /><br />
            <input
              type="text"
              id="address_detail_input"
              name="receiver_addressDetail"
              value="${memberInfo.address_detail}"
              placeholder="상세주소"
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
              <input
                type="text"
                id="selboxDirect"
                name="receiver_comment_direct"
              />
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
            <c:set var="point_max_value" value="${memberInfo.point}" />
            <c:if test="${point_max_value>total_price}">
              <c:set var="point_max_value" value="total_price" />
            </c:if>
            <input
              type="number"
              id="used_point"
              name="used_point"
              min="0"
              max="${point_max_value}"
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
              </c:forEach>
            </select>
          </td>
        </tr>
        <input type="hidden" id="h_coupon_discount_price" value="0" />

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
            /><span id="discount_price_text">-${discount_price}원</span>
            <input
              type="hidden"
              id="h_original_discount_price"
              value="${discount_price}"
            />
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
            <input type="hidden" name="total_price" value="${total_price}" />
            <span id="total_price_text">${total_price}원</span>
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

      function fn_render_widget(price) {
        paymentWidget.renderPaymentMethods("#payment-method", {
          value: price,
          currency: "KRW",
          country: "KR",
        });
      }

      function fn_sendOrderInfo(contextPath) {
        var formData = $("#orderForm").serialize();
        var total_price = $("#orderForm").find("input[name=total_price]").val();
        fn_render_widget(total_price);
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
