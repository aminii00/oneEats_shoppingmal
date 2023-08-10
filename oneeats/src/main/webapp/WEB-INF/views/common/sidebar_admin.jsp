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
        <div style="text-align: left" class="textsize-2 textcolor-black border">
          <div
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
              margin-top: 12px;
              margin-left: 4px;
            "
          >
            <span class="textsize-3 textbold">&nbsp;&nbsp;관리자 메뉴</span>
          </div>
          <ul style="margin-left: 16px; margin-top: 24px">
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">회원</a>
                </div>
              </div>
            </li>

            <li style="margin-top: 24px">
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
                  <li><a href="">핫딜</a></li>
                  <li><a href="">쿠폰</a></li>
                </ul>
              </div>
            </li>

            <li style="margin-top: 24px">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">주문/배송</a>
                </div>
              </div>
            </li>
            <li style="margin-top: 24px; margin-bottom: 24px">
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
                  <li><a href="">사업자 상품</a></li>
                  <li><a href="">관리자 상품</a></li>
                </ul>
              </div>
            </li>
            <li style="margin-top: 24px; margin-bottom: 24px">
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
                  <li><a href="">공지사항</a></li>
                  <li><a href="">자주하는 문의</a></li>
                  <li><a href="">1:1문의</a></li>
                </ul>
              </div>
            </li>
            <li style="margin-top: 24px; margin-bottom: 24px">
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
                  <li><a href="">리뷰</a></li>
                  <li><a href="">레시피</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
