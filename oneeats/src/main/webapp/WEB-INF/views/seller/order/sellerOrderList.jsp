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
    <title>사업자 주문/배송</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 검색창 -->
    <form method="post" action="#">
      <div class="div-p2">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          주문/배송
        </p>
        <div class="div-sib textsize-1">
          <select name="search-1">
            <option value="전체">전체</option>
            <option value="주문번호">주문번호</option>
            <option value="주문자명">주문자명</option>
            <option value="아이디">아이디</option>
          </select>
          <input type="text" name="search-2" placeholder="search.." />
          <button
            class="btn-1 bg-lightgreen textcolor-white border-0"
            type="button"
          >
            검색
          </button>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- 주문/배송 -->
    <table class="textcolor-black textsize-1">
      <tr>
        <th>주문번호</th>
        <th style="width: 20%">결제일시</th>
        <th>주문자명</th>
        <th>아이디</th>
        <th style="width: 20%">주문내역</th>
        <th>주문상태</th>
        <th style="width: 10%">취소</th>
      </tr>
      <c:forEach var="sellerOrder" items="${sellerOrderList}">
        <c:choose>
          <c:when test="${sellerOrder.orderNo != preOrderNo}">
            <tr style="border-top: 1px solid #b3b3b3">
              <td style="text-align: center">${sellerOrder.orderNo}</td>
              <td>${sellerOrder.orderDate}</td>
              <td>${sellerOrder.orderer_name}</td>
              <td>${sellerOrder.orderer_id}</td>
              <td>
                <a
                  href="${contextPath}/mypage/orderDetail.do?orderNo=${sellerOrder.orderNo}"
                >
                  ${sellerOrder.goodsName} 외 ${sellerOrder.gun}건</a
                >
              </td>
              <td>${sellerOrder.delivery_status}</td>
              <td>
                <a
                  href="javascript:void(0)"
                  onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/seller/order/sellerOrderCancel.do?orderNo=${sellerOrder.orderNo}")'
                  >취소</a
                >
              </td>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preOrderNo" value="${sellerOrder.orderNo}" />
      </c:forEach>
    </table>

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
              width="20px"
              height="20px"
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
              width="20px"
              height="20px"
              src="${contextPath}/img/icon/next.png"
              alt="next"
            />
          </button>
        </li>
      </ul>
    </div>
  </body>
</html>
