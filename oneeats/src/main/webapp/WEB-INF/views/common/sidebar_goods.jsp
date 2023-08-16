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
    <div class="row" style="margin-top: 80px">
      <div class="col-lg">
        <div class="textsize-2 border text-left">
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
        </div>
      </div>
    </div>
    <div>&nbsp;</div>
    <div class="row">
      <div class="col-lg text-left">
        <div class="sidebar__item" style="margin-top: 86px">
          <h4 style="font-size: 20px">가격</h4>
          <div class="price-range-wrap">
            <div
              class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
              data-min="0"
              data-max="10000"
            >
              <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
                style="left: 0%"
              ></span>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
                style="left: 100%"
              ></span>
              <div
                class="ui-slider-range ui-corner-all ui-widget-header"
                style="width: 100%; left: 0%"
              ></div>
            </div>
            <div class="range-slider">
              <div class="price-input">
                <input type="text" id="minamount" />
                <input type="text" id="maxamount" class="text-right" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="sidebar__item">
      <div class="latest-product__text">
        <h4 style="font-size: 20px" class="text-left">최근 본 상품</h4>
        <div class="latest-product__slider owl-carousel">
          <div class="latest-prdouct__slider__item">
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic" style="width: 110px">
                <img src="${contextPath}/img/product/main/apple.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>못난이 사과 3개</h6>
                <span>￦3000</span>
              </div>
            </a>
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic" style="width: 110px">
                <img src="${contextPath}/img/product/main/nyoki.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>포르치니버섯 크림 뇨끼</h6>
                <span>￦8800</span>
              </div>
            </a>
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic" style="width: 110px">
                <img src="${contextPath}/img/product/main/shabu.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>샤브샤브 밀키트 2인</h6>
                <span>￦15900</span>
              </div>
            </a>
          </div>
          <div class="latest-prdouct__slider__item">
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic">
                <img src="img/latest-product/lp-1.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>Crab Pool Security</h6>
                <span>$30.00</span>
              </div>
            </a>
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic">
                <img src="img/latest-product/lp-2.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>Crab Pool Security</h6>
                <span>$30.00</span>
              </div>
            </a>
            <a href="#" class="latest-product__item">
              <div class="latest-product__item__pic">
                <img src="img/latest-product/lp-3.jpg" alt="" />
              </div>
              <div class="latest-product__item__text">
                <h6>Crab Pool Security</h6>
                <span>$30.00</span>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
