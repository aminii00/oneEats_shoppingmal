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
    <title>관리자 주문/배송</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
    <script>
      $(document).ready(function () {
        $("select[name=delivery_status]").on("change", function () {
          $(this)
            .closest("form.delivery_status_form")
            .attr("action", "/admin/order/modDeliveryStatus.do")
            .submit();
        });
      });
    </script>
  </head>
  <body>
    <!-- 검색창 -->
    <form method="post" action="${contextPath}/admin/order/adminOrderList.do">
      <div class="div-p2">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          주문/배송
        </p>
        <div class="div-sib textsize-1">
          <select name="order_search_type">
            <option value="all">전체</option>
            <option value="orderNo">주문번호</option>
            <option value="orderer_name">주문자명</option>
            <option value="orderer_id">아이디</option>
          </select>
          <input
            type="search"
            name="order_search_word"
            placeholder="search.."
          />
          <button
            class="btn-1 bg-lightgreen textcolor-white border-0"
            type="submit"
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
      <c:forEach var="adminOrder" items="${adminOrderList}">
        <c:choose>
          <c:when test="${adminOrder.orderNo != preOrderNo}">
            <tr style="border-top: 1px solid #b3b3b3">
              <td>${adminOrder.orderNo}</td>
              <td>${adminOrder.orderDate}</td>
              <td>${adminOrder.orderer_name}</td>
              <td>${adminOrder.orderer_id}</td>
              <td>
                <a
                  href="${contextPath}/mypage/orderDetail.do?orderNo=${adminOrder.orderNo}"
                >
                  ${adminOrder.goodsName} 외 ${adminOrder.gun}건</a
                >
              </td>
              <td>
                <form class="delivery_status_form">
                  <input
                    type="hidden"
                    name="orderNo"
                    value="${adminOrder.orderNo}"
                  />
                  <c:set
                    var="status_array"
                    value="${['결제완료','배송중','배송완료','취소완료']}"
                  />
                  <select name="delivery_status">
                    <c:forEach items="${status_array}" var="i">
                      <c:choose>
                        <c:when test="${i==adminOrder.delivery_status}">
                          <option value="${i}" selected>${i}</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${i}">${i}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </form>
              </td>
              <td>
                <a
                  href="javascript:void(0)"
                  onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/admin/order/adminOrderCancel.do?orderNo=${adminOrder.orderNo}")'
                  >취소</a
                >
              </td>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preOrderNo" value="${adminOrder.orderNo}" />
      </c:forEach>
    </table>

    <hr class="linebold" />

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/order/adminOrderList.do?section=${section-1}&pageNum=1"
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
          value="${Math.ceil((totalOrderNum - (section-1)*100)/ 10)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/order/adminOrderList.do?section=${section}&pageNum=${i}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*100<totalOrderNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/order/adminOrderList.do?section=${section+1}&pageNum=1"
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
