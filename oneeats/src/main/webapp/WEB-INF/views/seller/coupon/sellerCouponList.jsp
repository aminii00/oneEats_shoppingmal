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
    <title>사업자 쿠폰목록</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 검색창 -->
    <form
      method="post"
      action="${contextPath}/seller/coupon/sellerCouponList.do"
    >
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          쿠폰목록
        </p>
        <div class="div-sib textsize-1">
          <select name="coupon_search_type">
            <option value="all">전체</option>
            <option value="couponNo">쿠폰번호</option>
            <option value="name">쿠폰명</option>
            <option value="memberName">사용처</option>
          </select>
          <input
            type="search"
            name="coupon_search_word"
            placeholder="search.."
          />
          <button
            class="btn-1 textcolor-white border-0 bg-lightgreen"
            type="submit"
          >
            검색
          </button>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- 쿠폰목록 -->
    <table class="textcolor-black textsize-1">
      <tr>
        <th style="width: 10%">번호</th>
        <th>쿠폰등록일</th>
        <th style="width: 30%">쿠폰명</th>
        <th>사용처</th>
        <th>유효기간</th>
        <th style="width: 10%">삭제</th>
      </tr>

      <c:forEach var="sellerCoupon" items="${sellerCouponList}">
        <tr style="border-top: 1px solid #b3b3b3">
          <td>${sellerCoupon.couponNo}</td>
          <td>${sellerCoupon.creDate}</td>
          <td>${sellerCoupon.name}</td>
          <td>${sellerCoupon.memberName}</td>
          <td>${sellerCoupon.expDate}</td>
          <td>
            <a
              href="javascript:void(0)"
              onclick='fn_openalert("쿠폰을 삭제하시겠습니까?","${contextPath}/seller/coupon/deleteCoupon.do?couponNo=${sellerCoupon.couponNo}")'
              >삭제</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>

    <hr class="linebold" />

    <button
      style="font-size: 12px; margin-top: 22px; float: right"
      class="btn-1 bg-lightgreen textcolor-white border-0"
      type="button"
      onclick="location.href='${contextPath}/seller/coupon/sellerCouponForm.do'"
    >
      쿠폰등록
    </button>

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/coupon/sellerCouponList.do?section=${section-1}&pageNum=1"
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
          value="${Math.ceil((totalCouponNum - (section-1)*100)/ 10)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/coupon/sellerCouponList.do?section=${section}&pageNum=${i}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*100<totalCouponNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/coupon/sellerCouponList.do?section=${section+1}&pageNum=1"
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
