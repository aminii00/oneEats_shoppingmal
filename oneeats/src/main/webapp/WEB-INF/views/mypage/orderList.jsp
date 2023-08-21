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
    <form method="post" action="#">
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          주문내역
        </p>
        <div class="div-sib textsize-1">
          <select name="search-1">
            <option value="전체">전체</option>
            <option value="1개월">1개월</option>
            <option value="3개월">3개월</option>
            <option value="1년">1년</option>
          </select>
          <input type="text" name="search-2" placeholder="search.." />
          <button
            class="btn-1 textcolor-white border-0 bg-lightgreen"
            type="button"
          >
            검색
          </button>
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
                  src="${contextPath}/download.do?imageFileName=${order.goodsImg}&path=order"
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
                  onclick="location.href='${contextPath}/mypage/orderCancel.do'"
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
    <%--
    <!--    <div> 페이징처리
        <c:if test="${totArticles != null}"
            <c:choose>
            <c:when test="${totArticles > 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <c:if test="${section > 1 && page == 1}">
                    <a href="#">&nbsp:prev</a>
                    </c:if>
                    <a href="#"></a>
                    <c:if test="${page == 10}">
                    <a href="#">&nbsp:next</a>
                    </c:if>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles == 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <a href="#">${page}</a>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles < 100}">
                <c:foreach var="page" begin="1" end="${totArticles/10+1}" step="1">
                <c:choose>
                    <c:when test="${page == pageNum}">
                    <a href="#">${page}</a>
                    </c:when>
                    <c:otherwise>
                    <a href="#">${page}</a>
                    </c:otherwise>
                </c:choose>
                </c:foreach>
            </c:when>
            </c:choose>
        </c:if>
        </div> 
-->
    --%>
    <div>
      <ul class="ul-li">
        <li class="li-btn">
          <button class="btn-2 btn-square bg-white btn-border">
            <img
              class="img-2"
              src="${contextPath}/img/icon/prev.png"
              alt="prev"
            />
          </button>
        </li>
        <li class="li-btn">
          <button class="btn-2 btn-square bg-white btn-border">1</button>
        </li>
        <li class="li-btn">
          <button class="btn-2 btn-square bg-white btn-border">
            <img
              class="img-2"
              src="${contextPath}/img/icon/next.png"
              alt="next"
            />
          </button>
        </li>
      </ul>
    </div>
  </body>
</html>
