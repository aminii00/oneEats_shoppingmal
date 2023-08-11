<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>관리자 메인 페이지</title>
    <style>
      div.sellerMain_menus a {
        width: 22%;
        padding-top: 16px;
        padding-bottom: 16px;
      }
    </style>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        사업자 메뉴
      </div>
      <hr style="border: 0px; height: 2px; background-color: black" />
      <div class="row">
        <div class="col-lg text-left textsize-2">메뉴를 선택해주세요</div>
      </div>
      <div>&nbsp;</div>
      <div
        class="sellerMain_menus"
        style="width: 100%; display: flex; justify-content: space-between"
      >
        <a href="" class="btn btn-outline-secondary">
          <img
            class="btn-square"
            src="${contextPath}/img/icon/product.png"
            alt=""
          />
          &nbsp;
          <span>상품관리</span>
        </a>
        <a href="" class="btn btn-outline-secondary">
          <img
            class="btn-square"
            src="${contextPath}/img/icon/truck.png"
            alt=""
          />
          &nbsp;
          <span>주문/배송관리</span>
        </a>
        <a href="" class="btn btn-outline-secondary">
          <img
            class="btn-square"
            src="${contextPath}/img/icon/event.png"
            alt=""
          />
          &nbsp;
          <span>이벤트관리 </span>
        </a>
        <a href="" class="btn btn-outline-secondary">
          <img
            class="btn-square"
            src="${contextPath}/img/icon/community.png"
            alt=""
          />
          &nbsp;
          <span>커뮤니티관리</span>
        </a>
      </div>
    </section>
  </body>
</html>
