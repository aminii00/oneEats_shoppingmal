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
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/css/sellerForm.css" />
  </head>
  <body>
    <div class="div-p">
      <p class="textsize-2 text-left textcolor-black textbold">상품</p>
      <div class="div-sib textsize-1">
        <select name="search-1">
          <option value="전체">전체</option>
          <option value="사업자번호">사업자번호</option>
          <option value="상품명">상품명</option>
          <option value="아이디">아이디</option>
          <option value="등록일">등록일</option>
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
    <table border="0" class="textcolor-black textsize-1">
      <tr>
        <th>상품 번호</th>
        <th>사업자번호</th>
        <th>상품명</th>
        <th>아이디</th>
        <th>작성일</th>
        <th style="text-align: right">삭제</th>
      </tr>

      <c:forEach var="goods" items="${newGoodsList}">
        <c:choose>
          <c:when test="${goods.goodsNo != preGoodsNo}">
            <tr>
              <td>${goods.goodsNo}</td>
              <td>${goods.memberNo}</td>
              <td>
                <a
                  href="${contextPath}/goods/goodsDetail.do?goodsNo=${goods.goodsNo}"
                >
                  ${goods.name}</a
                >
              </td>
              <td>${goods.seller_id}</td>
              <td>${goods.creDate}</td>
              <td style="text-align: right">
                <a
                  href="javascript:void(0)"
                  onclick='fn_openalert("상품을 삭제하시겠습니까?","${contextPath }/admin/goods/deleteAdminSellerGoods.do?goodsNo=${goods.goodsNo}")'
                  >삭제</a
                >
              </td>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preGoodsNo" value="${goods.goodsNo}" />
      </c:forEach>
    </table>
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
        <c:if test="${section>1}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminSellerGoodsList.do?&section=${section-1}&pageNum=1'"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </button>
          </li>
        </c:if>
        <c:forEach begin="1" end="10" var="i">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminSellerGoodsList.do?section=${section}&pageNum=${i}'"
            >
              ${(section-1)*10+i}
            </button>
          </li>
        </c:forEach>
        <li class="li-btn">
          <button
            class="btn-2 btn-square bg-white btn-border"
            onclick="location.href='${contextPath}/admin/goods/adminSellerGoodsList.do?section=${section+1}&pageNum=1'"
          >
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
