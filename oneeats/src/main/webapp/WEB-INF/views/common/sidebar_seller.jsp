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
    <title>사이드바</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
      $(document).ready(function () {
        var currentPath = window.location.pathname;
        var lastSlashIndex = currentPath.lastIndexOf("/");
        var secondLastSlashIndex = currentPath.lastIndexOf(
          "/",
          lastSlashIndex - 1
        );
        var selectedSideMenu = currentPath.substring(
          secondLastSlashIndex + 1,
          lastSlashIndex
        );

        $("#menu_" + selectedSideMenu).addClass("selected_menu");
        console.log(selectedSideMenu);
      });
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 textcolor-black border">
          <div id="side_menu_title">
            <span>&nbsp;&nbsp;사업자 메뉴</span>
          </div>
          <ul class="ul_menus">
            <li id="menu_goods">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/seller/goods/sellerGoodsList.do"
                    >상품</a
                  >
                </div>
              </div>
            </li>
            <li id="menu_order">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/seller/order/sellerOrderList.do"
                    >주문/배송</a
                  >
                </div>
              </div>
            </li>

            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(1);"
                >
                  이벤트
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_hotdeal">
                    <a href="${contextPath}/seller/hotdeal/sellerHotDealList.do"
                      >핫딜</a
                    >
                  </li>
                  <li id="menu_coupon">
                    <a href="${contextPath}/seller/coupon/sellerCouponList.do"
                      >쿠폰</a
                    >
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(2)"
                >
                  커뮤니티
                  <img
                    id="arrow_2"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_2" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_review">
                    <a
                      href="${contextPath}/community/review/sellerReviewList.do"
                      >리뷰</a
                    >
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
