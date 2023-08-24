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
    <title>주문상세</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 주문상세 -->
    <div class="div-p">
      <p class="p-1 textsize-2 text-left textcolor-black textbold">주문상세</p>
      <div class="div-sib textsize-1">
        <button
          class="btn-3 textcolor-black border-0"
          onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/mypage/orderCancel.do?orderNo=${order.orderNo}")'
          type="button"
        >
          주문취소
        </button>
      </div>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- 주문일, 주문번호 -->
    <div class="div-tot">
      <div class="div-t11 textbold textcolor-black textsize-1">
        <span>${order.orderDate} 주문</span>
        <span style="float: right">주문번호 ${order.orderNo}</span>
      </div>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- 결제정보 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>결제정보</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">상품금액</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.payment_price}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              상품 할인금액
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              -${order.discount_price}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">배송비</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.shippingfee}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">적립금액</dt>
            <dd class="dd-1 textsize-1 textcolor-black">${point_price}원</dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">결제방법</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.payment_type}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              총 결제금액
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.total_price}원
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- 주문정보 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>주문정보</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">주문번호</dt>
            <dd class="dd-1 textsize-1 textcolor-black">${order.orderNo}</dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">주문자명</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.orderer_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">결제일시</dt>
            <dd class="dd-1 textsize-1 textcolor-black">${order.orderDate}</dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- 배송정보 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>배송정보</span>
        <button
          class="btn-4 textcolor-white bg-lightgreen border-0 textsize-1"
          style="float: right"
          onclick="location.href='${contextPath}/mypage/deliveryInquiry.do'"
          type="button"
        >
          배송조회
        </button>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">받는분</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">연락처</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_phone}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">배송지</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_address}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              배송요청사항
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_comment}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- 상품주문목록 -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>상품주문목록</span>
      </div>
      <c:forEach var="detail" items="${orderDetail}">
        <div class="div-t2">
          <div class="div-left2">
            <img
              class="img-1"
              src="${contextPath}/download.do?imageFileName=${detail.goodsImg}&path=order"
              alt="상품메인"
            />
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ${detail.goodsName}
                </dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ￦${detail.goodsPrice} | ${detail.weight}g
                  ${detail.goods_qty}개
                </dt>
              </dl>
            </div>
          </div>
          <div class="div-right">
            <span class="span-1 textsize-1 textcolor-black"
              >${detail.delivery_status}</span
            >
            <button
              class="btn-5 bg-lightgreen border-0 textsize-1 textbold textcolor-white"
              type="button"
              onclick='fn_openalert("장바구니에 담았습니다.<br> 장바구니로 이동하시겠습니까?","${contextPath}/cart.do")'
            >
              <span>장바구니 담기</span>
            </button>
          </div>
        </div>
      </c:forEach>
    </div>

    <hr class="linebold" />
  </body>
</html>
