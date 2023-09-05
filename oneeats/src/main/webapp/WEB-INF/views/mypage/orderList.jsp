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
    <title>주문내역</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 검색창 -->
    <form method="post" action="${contextPath}/mypage/orderList.do">
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          주문내역
        </p>
        <div class="div-sib2 textsize-1">
          <select name="order_search_type" onchange="this.form.submit()">
            <option value="all">전체</option>
            <option value="1month">1개월</option>
            <option value="3month">3개월</option>
            <option value="1year">1년</option>
          </select>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- 전체주문내역 -->
    <c:forEach var="order" items="${orderList}">
      <c:choose>
        <c:when test="${order.orderNo != preOrderNo}">
          <div class="div-tot">
            <!-- 주문일, 주문내역상세보기 -->
            <div class="div-t1 textbold textcolor-black textsize-1">
              <span>${order.orderDate}</span>
              <a
                style="float: right"
                href="${contextPath}/mypage/orderDetail.do?orderNo=${order.orderNo}"
                >주문내역 상세보기</a
              >
            </div>
            <!-- 주문내역 -->
            <div class="div-t2">
              <!-- 왼쪽정보 -->
              <div class="div-left2">
                <img
                  class="img-1"
                  src="${contextPath}/download.do?imageFileName=${order.goodsImg}&path=goodsNo${order.goodsNo}"
                  alt="상품메인"
                />
                <div class="div-dl">
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      상품명
                    </dt>
                    <dd class="dd-1 textsize-1 textcolor-black">
                      ${order.goodsName} 외 ${order.gun}건
                    </dd>
                  </dl>
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      주문번호
                    </dt>
                    <dd class="dd-2 textsize-1 textcolor-black">
                      ${order.orderNo}
                    </dd>
                  </dl>
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      결제방법
                    </dt>
                    <dd class="dd-1 textsize-1 textcolor-black">
                      ${order.payment_type}
                    </dd>
                  </dl>
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      결제금액
                    </dt>
                    <dd class="dd-1 textsize-1 textcolor-black">
                      ${order.total_price}원
                    </dd>
                  </dl>
                </div>
              </div>
              <!-- 오른쪽정보 -->
              <div class="div-right">
                <span class="span-1 textsize-1 textcolor-black"
                  >${order.delivery_status}</span
                >
                <button
                  class="btn-3 border-0 textsize-1 textcolor-black"
                  type="button"
                  onclick="location.href='${contextPath}/mypage/orderCancel.do?orderNo=${order.orderNo}'"
                >
                  <span>취소하기</span>
                </button>
              </div>
            </div>
          </div>
        </c:when>
      </c:choose>
      <c:set var="preOrderNo" value="${order.orderNo}" />
    </c:forEach>

    <hr class="linebold" />

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section-1}&pageNum=1&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </a>
          </li>
        </c:if>
        <c:set
          var="end"
          value="${Math.ceil((totalOrderNum - (section-1)*60)/ 6)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section}&pageNum=${i}&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*60<totalOrderNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section+1}&pageNum=1&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </a>
          </li>
        </c:if>
      </ul>
    </div>
  </body>
</html>
