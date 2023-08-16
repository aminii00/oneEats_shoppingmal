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
        <div class="textsize-2 border text-left">
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
                  onclick="fn_slideToggle(1);"
                >
                  못난이 상품
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
                  <li><a href="">채소</a></li>
                  <li><a href="">과일</a></li>
                  <li><a href="">못난이 주스/수제청</a></li>
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
                  밀키트
                  <img
                    id="arrow_2"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_2" style="margin-left: 12px; margin-top: 12px">
                  <li><a href="">찌개/탕/찜</a></li>
                  <li><a href="">식사/안주류</a></li>
                  <li><a href="">죽</a></li>
                  <li><a href="">식사대용식</a></li>
                  <li><a href="">간편한끼 반찬</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div>&nbsp;</div>
    <div class="row">
      <div class="col-lg text-left">
        <div class="sidebar__item">
          <h4>가격</h4>
          <div class="price-range-wrap">
            <div
              class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
              data-min="10"
              data-max="540"
            >
              <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
              ></span>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
              ></span>
            </div>
            <div class="range-slider">
              <div class="price-input">
                <div class="row">
                  <div class="col-md-4">
                    <input
                      type="text"
                      id="minamount"
                      style="min-width: 100px"
                    />
                  </div>
                  <div class="col-md-4">
                    <input
                      type="text"
                      id="maxamount"
                      style="min-width: 100px"
                    />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg text-left">
        <div id="side_recentgoods_wrapper" class="border">
          <div class="textcolor-black textsize-2 textbold" style="margin: 12px">
            최근 본 상품
            <div style="float: right; display: flex; align-items: center">
              <a href="">
                <img
                  class="btn-square"
                  src="${contextPath}/img/icon/prev.png"
                  alt=""
                />
              </a>
              <a href="">
                <img
                  class="btn-square"
                  src="${contextPath}/img/icon/next.png"
                  alt=""
                />
              </a>
            </div>
          </div>
          <div
            id="side_recentgoods_row"
            class="row"
            onclick="location.href='#'"
            style="margin: 12px"
          >
            <div class="col-md-6 p-0">
              <div class="img-square-wrapper">
                <img
                  src="${contextPath}/img/product/product-1.jpg"
                  alt="상품 사진"
                  style="width: 100%"
                />
              </div>
            </div>
            <div class="col-md-1 p-0">&nbsp;</div>
            <div class="col-md-5 p-0">
              <div class="textbold textsize-2">상품명</div>
              <div class="textsize-1">￦3,000</div>
            </div>
          </div>
          <div
            id="side_recentgoods_row"
            class="row"
            onclick="location.href='#'"
            style="margin: 12px"
          >
            <div class="col-md-6 p-0">
              <div class="img-square-wrapper">
                <img
                  src="${contextPath}/img/product/product-2.jpg"
                  alt="상품 사진"
                  style="width: 100%"
                />
              </div>
            </div>
            <div class="col-md-1 p-0">&nbsp;</div>
            <div class="col-md-5 p-0">
              <div class="textbold textsize-2">상품명</div>
              <div class="textsize-1">￦5,000</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
