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
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div class="textsize-2 textcolor-black border text-left">
          <div id="side_menu_title">
            <span>&nbsp;&nbsp;마이페이지</span>
          </div>
          <ul class="ul_menus">
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(1);"
                >
                  회원정보
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
                  <li>
                    <a href="${contextPath}/mypage/myPageMain.do"
                      >프로필 편집</a
                    >
                  </li>
                  <li><a href="">회원정보 수정</a></li>
                  <li><a href="">배송지 관리</a></li>
                </ul>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">주문내역</a>
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/bookmarkList.do">찜한 목록</a>
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">1:1문의 내역</a>
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">상품리뷰</a>
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/couponSearch.do"
                    >쿠폰/적립금 조회</a
                  >
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="text-left textsize-2 textcolor-red">
          <a href="">탈퇴하기</a>
        </div>
      </div>
    </div>
  </body>
</html>
