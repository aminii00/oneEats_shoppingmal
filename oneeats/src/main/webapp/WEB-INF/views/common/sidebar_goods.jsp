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
          <div class="latest-prdouct__slider__item">  <ul>
            <!--   상품이 없습니다. -->
             <c:choose>
              <c:when test="${ empty quickGoodsList }">
                     <strong>상품이 없습니다.</strong>
              </c:when>
              <c:otherwise>
                 <form name="frm_sticky"  >	        
                  <c:forEach var="item" items="${quickGoodsList }" varStatus="itemNum">
                     <c:choose>
                       <c:when test="${itemNum.count==1 }">
                    <!-- <a href="javascript:goodsDetail();"> -->
                           <img width="110" height="110" id="img_sticky"  
                             src="${contextPath}/download.do?imageFileName=${i.img1}&path=prop">
         
                    <!-- </a> -->
                             <input type="hidden"  name="h_goods_id" value="${item.goodsNo}" />
                            <input type="hidden" name="h_goods_fileName" value="${item.img1}" />
                         <br/>
                    </c:when>
                    <c:otherwise>
                      <input type="hidden"  name="h_goods_id" value="${item.goodsNo}" />
                      <input type="hidden" name="h_goods_fileName" value="${item.img1}" />
                    </c:otherwise>
                    </c:choose>
        </form>
                 </c:forEach>
               </c:otherwise>
                </c:choose>
             </ul></div>
         	</div>
	 <div>
	 <c:choose>
	    <c:when test="${ empty quickGoodsList }">
		    <h5>  &nbsp; &nbsp; &nbsp; &nbsp;  0/0  &nbsp; </h5>
	    </c:when>
	    <c:otherwise>
           <h5><a  href='javascript:fn_show_previous_goods();'> 이전 </a> &nbsp;  <span id="cur_goods_num">1</span>/${quickGoodsListNum}  &nbsp; <a href='javascript:fn_show_next_goods();'> 다음 </a> </h5>
       </c:otherwise>
       </c:choose>
    </div>
        </div>
      </div>
    </div>
  </body>
</html>
