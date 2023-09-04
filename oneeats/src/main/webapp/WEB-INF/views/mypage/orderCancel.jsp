<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>주문취소</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 주문취소 -->
    <div class="div-p">
      <p class="p-1 textsize-2 text-left textcolor-black textbold">주문취소</p>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- 구매자정보 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>구매자정보</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">이름</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                name="orderer_name"
                value="${order.orderer_name}"
              />${order.orderer_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">연락처</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                name="orderer_phone"
                value="${order.orderer_phone}"
              />
              ${order.orderer_phone}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- 환불정보 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>환불정보</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">결제금액</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.total_price}"
              />${order.total_price}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              환불예상금액
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.total_price-order.shippingfee}"
              />
              ${order.total_price}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">환불수단</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.payment_type}"
              />${order.payment_type}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- 취소상품 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>취소상품</span>
      </div>
      <c:forEach var="cancel" items="${orderCancel}">
        <div class="div-t2">
          <div class="div-left2" style="margin: 5px 0px">
            <img
              class="img-1"
              src="${contextPath}/download.do?imageFileName=${cancel.goodsImg}&path=goodsNo${cancel.goodsNo}"
              alt="상품메인"
            />
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ${cancel.goodsName}
                </dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ￦${cancel.goodsPrice} | ${cancel.weight}g
                  ${cancel.goods_qty}개
                </dt>
              </dl>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <hr class="linebold" style="margin: 0" />
    <div class="row">
      <div class="col">
        <form id="cancel_form">
          <input type="hidden" name="orderNo" id="" value="${order.orderNo}" />
          <input type="hidden" name="paymentKey" value="${paymentKey}" />
          <input type="hidden" name="paymentType" id="${order.payment_type}" />
          <select name="cancel_reason" id="" required>
            <option value="">주문 취소 이유를 선택해주세요</option>
            <option value="유사한 상품을 이미 주문해서">
              유사한 상품을 이미 주문해서
            </option>
          </select>
          <c:choose>
            <c:when test="${order.payment_type=='가상계좌'}">
              가상계좌 결제의 경우 계좌를 입력해주세요
              <select name="bank" id="" class="form-control">
                <option value="20">우리</option>
                <option value="37">전북</option>
                <option value="39">경남</option>
                <option value="32">부산</option>
                <option value="45">새마을</option>
                <option value="88">신한</option>
                <option value="71">우체국</option>
              </select>
              <input
                type="text"
                name="accountNumber"
                class="form-control"
                placeholder="계좌번호(하이픈없이)"
                required
              />
              <input
                type="text"
                name="holderName"
                class="form-control"
                placeholder="예금주"
                required
              />
            </c:when>
          </c:choose>
        </form>
      </div>
    </div>
    <!-- 주문취소버튼 -->
    <div class="div-btn">
      <button
        class="btn-4 btn-regular bg-lightgreen textcolor-white textbold border-0"
        onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/toss/orderCancel.do",fn_cancel)'
        type="button"
      >
        취소하기
      </button>
    </div>
  </body>
  <script>
    function fn_cancel(url) {
      $("#cancel_form").attr("action", url).submit();
    }
  </script>
</html>
