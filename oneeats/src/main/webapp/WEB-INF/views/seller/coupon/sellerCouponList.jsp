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
    <form method="post" action="#">
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">쿠폰목록</p>
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

    <!-- 쿠폰목록 -->
      <table class="textcolor-black textsize-1">
        <tr>
          <th style="width:10%">번호</th>
          <th>쿠폰등록일</th>
          <th style="width:40%">쿠폰명</th>
          <th>사용처</th>
          <th style="width:10%">삭제</th>
        </tr>
        <tr>
          <td>&nbsp 1</td>
          <td>2023-08-11</td>
          <td>1000원 할인 쿠폰</td>
          <td>김판매</td>
          <td>
            <a
              href="javascript:void(0)"
              onclick='fn_openalert("쿠폰을 삭제하시겠습니까?","${contextPath}/seller/coupon/sellerCouponList.do")'
              >삭제</a
            >
          </td>
        </tr>
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
