<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>One.eats</title>

    <script src="${contextPath}/js/hotdealClock.js"></script>
  </head>

  <body>
    <!-- Hero Section Begin -->
    <section class="hero">
      <div class="container">
        <div class="row">
          <div class="col-lg-9">
            <div
              class="hero__item set-bg"
              style="
                width: 767px;
                height: 431;
                justify-content: space-around !important;
              "
              data-setbg="${contextPath}/img/product/main/i-2.JPG"
            >
              <div class="hero__text">
                <span style="margin-left: -68px"
                  >신선한 제품 One.eats와 함께하세요</span
                >
                <h2 style="margin: 24px 0 12px -68px">못난이 <br />상품</h2>
                <p style="color: #fff; margin-right: 70px">
                  도매시장을 거치지 않는 산지 직송 못난이 농산물로<br />
                  시세 대비 20% 이상 저렴한 가격에 판매합니다.
                </p>
                <a
                  href="${contextPath}/goods/goodsList.do"
                  class="primary-btn"
                  style="margin-right: 60px"
                  >상품 보기</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Hero Section End -->

    <!-- Categories Section Begin -->

    <div class="product__discount">
      <div class="section-title">
        <h2>Hot Deals</h2>
      </div>
      <div class="row">
        <div class="product__discount__slider owl-carousel owl-loaded owl-drag">
          <div class="owl-stage-outer">
            <div
              class="owl-stage"
              style="
                transform: translate3d(-1942px, 0px, 0px);
                transition: all 1.2s ease 0s;
                width: 3330px;
              "
            >
              <c:forEach var="item" items="${newHotDealList }">
                <div class="owl-item cloned" style="width: 277.5px">
                  <div class="col-lg-4">
                    <div class="product__discount__item">
                      <div
                        class="hotdeal_time_row textcolor-red"
                        onclick="location.href='${contextPath}/goods/hotdealDetail.do?hotdealNo=${item.hotdealNo}'"
                      >
                        <input
                          type="hidden"
                          class="h_finishDate"
                          value="${item.finishDate}"
                        />
                        <span>
                          <i class="bi bi-alarm"></i>
                          남은 시간
                        </span>
                        <div class="hotdeal_time_text"></div>
                      </div>
                      <div
                        class="product__discount__item__pic set-bg"
                        data-setbg="${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}"
                        style="
                          background-image: url('${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}');
                        "
                      >
                        <!-- <div class="product__discount__percent">
                          <input type="hidden" id="showResult" value="" />
                        </div> -->
                        <ul class="product__item__pic__hover">
                          <li
                            onclick="fn_bookmark('${contextPath}','${item.goodsNo}')"
                          >
                            <a><i class="fa fa-heart"></i></a>
                          </li>

                          <li
                            onclick="fn_addCartOneOption('${contextPath}','${item.hotdealNo}')"
                          >
                            <a><i class="fa fa-shopping-cart"></i></a>
                          </li>
                        </ul>
                      </div>
                      <div
                        class="product__discount__item__text"
                        onclick="location.href='${contextPath}/goods/hotdealDetail.do?hotdealNo=${item.hotdealNo}'"
                      >
                        <span>${item.category}</span>
                        <h5><a href="#">${item.name}</a></h5>
                        <div class="product__item__price">
                          <div>
                            ${item.goods_qty}개 ￦${item.discounted_price}
                          </div>
                          <span>낱개 ￦${item.goodsPrice} </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="owl-nav disabled">
            <button type="button" role="presentation" class="owl-prev">
              <span aria-label="Previous">‹</span></button
            ><button type="button" role="presentation" class="owl-next">
              <span aria-label="Next">›</span>
            </button>
          </div>
          <div class="owl-dots"></div>
        </div>
      </div>
    </div>

    <!-- Categories Section End -->

    <!-- Banner Begin -->
    <div class="banner">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="banner__pic">
              <img
                src="${contextPath}/img/product/main/sm-banner.jpg"
                alt=""
                style="
                  width: 353px;
                  height: 170px;
                  filter: brightness(50%);
                  position: relative;
                "
              />

              <div
                style="
                  position: absolute;
                  top: 50%;
                  right: 0%;
                  transform: translate(-50%, -50%);
                "
              >
                <span style="font-size: 20px; color: white">못난이 상품</span
                ><br />

                <a
                  href="${contextPath}/goods/goodsList.do?category=motnan"
                  class="primary-btn"
                  style="margin-top: 12px"
                  >바로 가기</a
                >
              </div>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 col-sm-6">
            <img
              src="${contextPath}/img/product/main/meal-kit.jpg"
              alt=""
              style="
                width: 353px;
                height: 170px;
                filter: brightness(50%);
                position: relative;
              "
            />

            <div
              style="
                position: absolute;
                top: 50%;
                right: 0%;
                transform: translate(-50%, -50%);
              "
            >
              <span style="font-size: 20px; color: white">밀키트</span><br />
              <a
                href="${contextPath}/goods/goodsList.do?category=mealkit"
                class="primary-btn"
                style="margin-top: 12px"
                >바로 가기</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
    <section class="latest-product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
              <h4
                class="text-left"
                style="font-size: 18px; padding-bottom: 6px"
              >
                새 상품
              </h4>
              <div class="latest-product__slider owl-carousel">
                <c:forEach items="${newGoodsList}" varStatus="loop" step="3">
                  <!--아이템 슬라이더 하나.-->
                  <div class="latest-product__slider__item">
                    <c:forEach begin="0" end="2" var="i">
                      <c:set
                        var="item"
                        value="${newGoodsList[loop.index + i]}"
                      />
                      <a
                        href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}"
                        class="latest-product__item"
                      >
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                            style="width: 110px"
                            ;
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6 style="font-size: 14px">${item.name}<br /></h6>
                          <span>￦${item.price}</span>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                  <!--아이템 슬라이더 하나 끝-->
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
              <h4
                class="text-left"
                style="font-size: 18px; padding-bottom: 6px"
              >
                베스트 상품
              </h4>
              <div class="latest-product__slider owl-carousel">
                <c:forEach items="${bestGoodsList}" varStatus="loop" step="3">
                  <!--아이템 슬라이더 하나.-->
                  <div class="latest-product__slider__item">
                    <c:forEach begin="0" end="2" var="i">
                      <c:set
                        var="item"
                        value="${bestGoodsList[loop.index + i]}"
                      />
                      <a
                        href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}"
                        class="latest-product__item"
                      >
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                            style="width: 110px"
                            ;
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6 style="font-size: 14px">${item.name}<br /></h6>
                          <span>￦${item.price}</span>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                  <!--아이템 슬라이더 하나 끝-->
                </c:forEach>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
              <h4
                class="text-left"
                style="font-size: 18px; padding-bottom: 6px"
              >
                탑 리뷰 상품
              </h4>
              <div class="latest-product__slider owl-carousel">
                <c:forEach
                  items="${topReviewGoodsList}"
                  varStatus="loop"
                  step="3"
                >
                  <!--아이템 슬라이더 하나.-->
                  <div class="latest-product__slider__item">
                    <c:forEach begin="0" end="2" var="i">
                      <c:set
                        var="item"
                        value="${topReviewGoodsList[loop.index + i]}"
                      />
                      <a
                        href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}"
                        class="latest-product__item"
                      >
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                            style="width: 110px"
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6 style="font-size: 14px">${item.name}<br /></h6>
                          <span>￦${item.price}</span>
                        </div>
                      </a>
                    </c:forEach>
                  </div>
                  <!--아이템 슬라이더 하나 끝-->
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
    <section class="from-blog spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title from-blog__title">
              <h2>Recipe</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <c:forEach var="i" items="${newRecipeList }">
            <div class="col-lg-4 col-md-4 col-sm-6">
              <div
                class="blog__item"
                onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${i.recipeNo}'"
              >
                <div class="blog__item__pic">
                  <img
                    src="${contextPath}/download.do?imageFileName=${i.cookingImg}&path=recipeNo${i.recipeNo}"
                    height="265px"
                    alt=""
                  />
                </div>
                <div class="blog__item__text">
                  <ul>
                    <li><i class="fa fa-calendar-o"></i> ${i.creDate}</li>
                  </ul>
                  <h5><a href="#">${i.title}</a></h5>
                  <c:set var="des" value="${i.description}" />
                  <p>
                    <c:out
                      value='${fn:substring(des.replaceAll("\\\<.*?\\\>",""), 0, 20)}'
                    />
                  </p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>
  </body>
</html>
