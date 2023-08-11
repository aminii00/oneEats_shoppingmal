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
            class="bg-lightgreen textcolor-white"
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
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
                  class="toggle-content"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>채소</li>
                  <li>과일</li>
                  <li>못난이 주스/수제청</li>
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
                  class="toggle-content"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>찌개/탕/찜</li>
                  <li>식사/안주류</li>
                  <li>죽</li>
                  <li>식사대용식</li>
                  <li>간편한끼 반찬</li>
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
