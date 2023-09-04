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
    <link rel="stylesheet" href="${contextPath}/css/list.css" />
  </head>
  <body>
    <div class="div-p">
      <p class="textsize-2 text-left textcolor-black textbold">상품목록</p>
      <div class="div-sib textsize-1">
        <select name="search-1">
          <option value="전체">전체</option>
          <option value="등록일">등록일</option>
          <option value="상품명">상품명</option>
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
        <th>번호</th>
        <th>등록일</th>
        <th>상품명</th>
        <th style="text-align: right">수정</th>
        <th style="text-align: right">삭제</th>
      </tr>
      <c:forEach var="goods" items="${newGoodsList}">
        <c:choose>
          <c:when test="${goods.goodsNo != preGoodsNo}">
            <tr>
              <div class="th-1">
                <td>${goods.goodsNo}</td>
                <td>${goods.creDate}</td>
                <td>
                  <a
                    href="${contextPath}/goods/goodsDetail.do?goodsNo=${goods.goodsNo}"
                  >
                    ${goods.name}</a
                  >
                </td>

                <td style="text-align: right">
                  <a
                    href="${contextPath}/admin/goods/modAdminGoods.do?goodsNo=${goods.goodsNo}"
                    >수정</a
                  >
                </td>
                <td style="text-align: right">
                  <a
                    href="javascript:void(0)"
                    onclick='fn_openalert("상품을 삭제하시겠습니까?","${contextPath }/admin/goods/deleteAdminGoods.do?goodsNo=${goods.goodsNo}")'
                    >삭제</a
                  >
                </td>
              </div>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preGoodsNo" value="${goods.goodsNo}" />
      </c:forEach>
    </table>
    <button
      style="font-size: 12px; margin-top: 22px; float: right"
      class="btn-1 bg-lightgreen textcolor-white border-0"
      type="button"
    >
      상품 추가
    </button>

    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?&section=${section-1}&pageNum=1'"
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
              onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?section=${section}&pageNum=${i}'"
            >
              ${(section-1)*10+i}
            </button>
          </li>
        </c:forEach>
        <li class="li-btn">
          <button
            class="btn-2 btn-square bg-white btn-border"
            onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?section=${section+1}&pageNum=1'"
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
