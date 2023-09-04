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
      var rotate1 = 0;
      var rotate2 = 0;
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 border">
          <div
            class="textcolor-white"
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
              background-color: #568203;
            "
          >
            <img
              style="margin-left: 16px"
              style="width: 20px"
              src="${contextPath}/img/icon/list.png"
            />
            <span class="textbold">&nbsp;카테고리</span>
          </div>
          <ul class="ul_menus" style="margin-left: 16px">
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_toggle(1);"
                >
                  못난이 상품
                  <img
                    id="motnan_arrow"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul
                  id="category_motnan"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=채소"
                      >채소</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=과일"
                      >과일</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=못난이주스수제청"
                      >못난이 주스/수제청</a
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
                  onclick="fn_toggle(2)"
                >
                  밀키트
                  <img
                    id="meal_arrow"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul
                  id="category_meal"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=찌개탕찜"
                      >찌개/탕/찜</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=식사안주류"
                      >식사/안주류</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=죽"
                      >죽</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=식사대용식"
                      >식사대용식</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=간편한끼반찬"
                      >간편한끼 반찬</a
                    >
                  </li>
                </ul>
              </div>
            </li>
          </ul>
          <div>&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
