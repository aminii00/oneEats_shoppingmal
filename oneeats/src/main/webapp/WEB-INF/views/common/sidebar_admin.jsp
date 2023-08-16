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
        if (selectedSideMenu == "goods") {
          if (currentPath.includes("Seller")) {
            selectedSideMenu = "sellerGoods";
          } else {
            selectedSideMenu = "adminGoods";
          }
        }

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
            <span>&nbsp;&nbsp;관리자 메뉴</span>
          </div>
          <ul class="ul_menus">
            <li id="menu_member">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/admin/member/adminMemberList.do"
                    >회원</a
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
                    <a href="${contextPath}/admin/hotdeal/adminHotDealList.do"
                      >핫딜</a
                    >
                  </li>
                  <li id="menu_coupon">
                    <a href="${contextPath}/admin/coupon/adminCouponList.do"
                      >쿠폰</a
                    >
                  </li>
                </ul>
              </div>
            </li>

            <li id="menu_order">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/admin/order/adminOrderList.do"
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
                  onclick="fn_slideToggle(2)"
                >
                  상품
                  <img
                    id="arrow_2"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_2" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_sellerGoods">
                    <a href="${contextPath}/admin/goods/adminSellerGoodsList.do"
                      >사업자 상품</a
                    >
                  </li>
                  <li id="menu_adminGoods">
                    <a href="${contextPath}/admin/goods/adminGoodsList.do"
                      >관리자 상품</a
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
                  onclick="fn_slideToggle(3)"
                >
                  고객센터
                  <img
                    id="arrow_3"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_3" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_notice">
                    <a
                      href="${contextPath}/admin/community/notice/adminNoticeList.do"
                      >공지사항</a
                    >
                  </li>
                  <li id="menu_mostQnA">
                    <a
                      href="${contextPath}/admin/community/mostQnA/adminMostQnAList.do"
                      >자주하는 문의</a
                    >
                  </li>
                  <li id="menu_oneQnA">
                    <a
                      href="${contextPath}/admin/community/oneQnA/adminOneQnAList.do"
                      >1:1문의</a
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
                  onclick="fn_slideToggle(4)"
                >
                  커뮤니티
                  <img
                    id="arrow_4"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_4" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_review">
                    <a
                      href="${contextPath}/admin/community/review/adminReviewList.do"
                      >리뷰</a
                    >
                  </li>
                  <li id="menu_recipe">
                    <a
                      href="${contextPath}/admin/community/recipe/adminRecipeList.do"
                      >레시피</a
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
