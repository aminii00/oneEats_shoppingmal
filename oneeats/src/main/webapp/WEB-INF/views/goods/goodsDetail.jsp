<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>goodsDetail</title>

    <link href="${contextPath}/css/goodsDetail.css" rel="stylesheet" />
    <style>
      dl.goods_option_row > dt {
        width: 100%;
      }
      dl.goods_option_row > dt > div.option_price {
        text-align: right;
        font-size: 16px;
        float: right;
        font-weight: 600;
      }

      i.review-star {
        color: gold;
      }
    </style>
    <!--리뷰 비동기 로드-->
    <script>
      var section_num = parseInt("${section}");
      function fn_loadReviews(prev_next, pageNum, goodsNo) {
        console.log(section_num);
        $.ajax({
          type: "POST",
          url: "/goods/nextReviews.do",
          dataType: "html",
          data: {
            section: section_num + parseInt(prev_next),
            pageNum: pageNum,
            goodsNo: goodsNo,
          },
          success: function (response) {
            console.log(response);
            $("#reviews-grid").html(response);
            section_num = section_num + parseInt(prev_next);
            $("html, body").animate(
              {
                scrollTop: $("#reviews-grid").offset().top,
              },
              500
            );
          },
          error: function (response) {
            alert("원인불명의 에러");
            console.log(response);
          },
        });
      }
    </script>
  </head>

  <body>
    <section
      class="breadcrumb-section set-bg"
      data-setbg="${contextPath}/img/breadcrumb.jpg"
    >
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <div class="breadcrumb__text">
              <h2>${goods.category}</h2>
              <div class="breadcrumb__option">
                <span></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="product-details spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
              <div class="product__details__pic__item">
                <img
                  class="product__details__pic__item--large"
                  src="${contextPath}/download.do?imageFileName=${goods.img1}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
              </div>
              <div class="product__details__pic__slider owl-carousel">
                <img
                  data-imgbigurl="${contextPath}/download.do?imageFileName=${goods.img2}&path=goodsNo${goods.goodsNo}"
                  src="${contextPath}/download.do?imageFileName=${goods.img2}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="${contextPath}/download.do?imageFileName=${goods.img3}&path=goodsNo${goods.goodsNo}"
                  src="${contextPath}/download.do?imageFileName=${goods.img3}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="${contextPath}/download.do?imageFileName=${goods.img4}&path=goodsNo${goods.goodsNo}"
                  src="${contextPath}/download.do?imageFileName=${goods.img4}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="${contextPath}/download.do?imageFileName=${goods.img5}&path=goodsNo${goods.goodsNo}"
                  src="${contextPath}/download.do?imageFileName=${goods.img5}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-left">
            <div class="product__details__text">
              <h3>${goods.name}</h3>
              <div class="product__details__rating">
                <c:set var="temp" value="${Math.ceil(reviewAvg)}" />
                <c:forEach begin="1" end="${Math.floor(reviewAvg)}">★</c:forEach
                ><c:if test="${temp>reviewAvg}">☆</c:if>
                <span>평균 ${reviewAvg} 점 </span>
                <span>(${totalReviewsNum} reviews)</span>
                <div class="product__details__price">￦${goods.price}</div>
                <section class="css-1ua1wyk">
                  <div class="css-iqoq9n">
                    <c:choose>
                      <c:when test="${goods.type=='사업자'}">
                        <div class="goods_detail_description">
                          <dl class="property-flex2">
                            <dt class="property-input-gd">판매자</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.sellerName}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">포장타입</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.rapping}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">원산지</dt>
                            <dd class="property-flex4">
                              ${goods.manufacturer}
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">무게 / 용량</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.weight}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">수확시기</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.harvest}</span
                              >
                            </dd>
                          </dl>
                        </div>
                      </c:when>
                      <c:otherwise>
                        <div class="goods_detail_description">
                          <dl class="property-flex2">
                            <dt class="property-input-gd">판매자</dt>
                            <dd class="property-flex4">
                              <span class="property-input">원이츠</span>
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">포장타입</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.rapping}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">제조원</dt>
                            <dd class="property-flex4">
                              <span class="property-input">
                                ${goods.manufacturer}
                              </span>
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">무게 / 용량</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.weight}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">유통기한</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.expDate}</span
                              >
                            </dd>
                          </dl>
                        </div>
                      </c:otherwise>
                    </c:choose>
                    <form
                      id="optionForm"
                      action="${contextPath}/orderNow.do"
                      method="post"
                    >
                      <!--수정-->
                      <div class="property-margin" style="margin-bottom: -40px">
                        <div class="property-margin1">
                          <dl class="property-flex2" style="height: 170px">
                            <dt
                              class="property-input-gd"
                              style="margin-top: 16px"
                            >
                              상품선택
                            </dt>
                            <dd class="property-flex4">
                              <div
                                style="align-content: center"
                                style="overflow-y: scrol"
                              >
                                <select
                                  name="select"
                                  id="select_option"
                                  class="margin4 opt"
                                >
                                  <option value="0" selected>
                                    옵션을 선택해주세요
                                  </option>
                                  <c:forEach
                                    items="${goodsOptionList}"
                                    var="goodsOption"
                                  >
                                    <option value="${goodsOption.optionNo}">
                                      ${goodsOption.optionName}
                                      ${goodsOption.optionPrice}
                                    </option>
                                  </c:forEach>
                                </select>
                              </div>
                              <c:forEach
                                items="${goodsOptionList}"
                                var="goodsOption"
                              >
                                <input
                                  type="hidden"
                                  class="h_option_qty_${goodsOption.optionNo}"
                                  value="${goodsOption.optionQty}"
                                />
                                <input
                                  type="hidden"
                                  class="h_option_price_${goodsOption.optionNo}"
                                  value="${goodsOption.optionPrice}"
                                />
                                <input
                                  type="hidden"
                                  class="h_option_name_${goodsOption.optionNo}"
                                  value="${goodsOption.optionName}"
                                />
                              </c:forEach>
                            </dd>
                          </dl>

                          <div
                            class="cart-option-item property-flex5 goods_option_grid"
                            style="width: 525px"
                          >
                            <!--선택한 상품 옵션이 나타나는 구역 -->
                            <div class="goods_option_rows"></div>
                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              총 상품금액
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="payment_price"
                              >0</span
                            >
                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              할인 금액
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="discount_price"
                              >0</span
                            >

                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              결제 금액
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="t_price"
                              >0</span
                            >
                            <!--배송비와 상품금액 hidden-->
                            <input type="hidden" name="shippingFee" value="0" />
                            <input
                              type="hidden"
                              id="h_payment_price"
                              name="payment_price"
                              value="0"
                            />
                            <input
                              type="hidden"
                              id="h_discount_price"
                              name="discount_price"
                              value="0"
                            />
                            <input type="hidden" id="total_price" value="0" />
                          </div>
                        </div>

                        <div class="css-9y0nwt">
                          <div class="css-ixlb9s">
                            <div class="css-yhijln">
                              <span
                                class="css-x4cdgl"
                                id="sum"
                                value="0"
                              ></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="css-lay goods_detail_buttons">
                        <button
                          class="css-heartbtn btn-regular"
                          type="button"
                          width="56"
                          height="56"
                          radius="3"
                          onclick="fn_bookmark('${contextPath}','${goods.goodsNo}')"
                        >
                          <span class="css-let1"
                            ><img
                              src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yNS44MDcgNy44NjNhNS43NzcgNS43NzcgMCAwIDAtOC4xNzIgMEwxNiA5LjQ5N2wtMS42MzUtMS42MzRhNS43NzkgNS43NzkgMCAxIDAtOC4xNzMgOC4xNzJsMS42MzQgMS42MzQgNy40NjYgNy40NjdhMSAxIDAgMCAwIDEuNDE1IDBzMCAwIDAgMGw3LjQ2Ni03LjQ2N2gwbDEuNjM0LTEuNjM0YTUuNzc3IDUuNzc3IDAgMCAwIDAtOC4xNzJ6IiBzdHJva2U9IiM1RjAwODAiIHN0cm9rZS13aWR0aD0iMS42IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K"
                              alt=""
                              class="css-0"
                          /></span>
                        </button>
                        <div class="css-lay2">
                          <button
                            class="cart-button css-cartbtn"
                            type="submit"
                            radius="3"
                          >
                            <div class="css-nytqmg textbold btn-hover">
                              바로 구매
                            </div>
                          </button>
                        </div>

                        <div class="css-lay2">
                          <button
                            class="cart-button css-cartbtn"
                            type="button"
                            radius="3"
                            onclick="fn_toCart()"
                          >
                            <div class="css-nytqmg textbold btn-hover">
                              장바구니 담기
                            </div>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="product__details__tab">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a
                  class="nav-link active"
                  data-toggle="tab"
                  href="#tabs-1"
                  role="tab"
                  aria-selected="true"
                  >정보</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  data-toggle="tab"
                  href="#tabs-3"
                  role="tab"
                  aria-selected="false"
                  >리뷰 <span>(${totalReviewsNum})</span></a
                >
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tabs-1" role="tabpanel">
                <div class="product__details__tab__desc">
                  <h6>상품 소개</h6>
                  <p>${goods.description}</p>
                </div>
              </div>
              <div class="tab-pane" id="tabs-3" role="tabpanel">
                <div class="product__details__tab__desc">
                  <h6
                    class="text-left textbold"
                    style="padding-left: 20px; font-size: 24px"
                  >
                    상품 후기
                  </h6>

                  <h6 class="text-left" style="padding-left: 20px">
                    총 ${totalReviewsNum}개
                  </h6>

                  <!--상품 후기-->
                  <div id="reviews-grid">
                    <c:forEach var="review" items="${newReviewList}">
                      <div class="property-input1">
                        <div class="property-gdtail-flex">
                          <div class="property-gdtail-flex1">
                            <span class="property-gdtail-font"
                              >&nbsp&nbsp${review.memberId}</span
                            >
                          </div>
                          <div class="property-gdtail-flex1">
                            <span
                              class="property-gdtail-font"
                              style="padding-top: 11px"
                            >
                              <c:set
                                var="temp"
                                value="${Math.ceil(review.star)}"
                              />
                              <c:forEach
                                begin="1"
                                end="${Math.floor(review.star)}"
                              >
                                <i class="bi bi-star-fill review-star"></i>
                              </c:forEach>
                              <c:if test="${temp>review.star}">
                                <i class="bi bi-star-half review-star"></i>
                              </c:if>
                            </span>
                          </div>
                        </div>
                        <article class="property-gdtail-flex2">
                          <div>
                            <div class="property-gdtail-flex3">
                              <h3 class="property-gdtail-font1">
                                [${review.goodsName}]
                              </h3>
                            </div>
                            <p class="text-left" style="padding: 15px 0 0 0">
                              ${review.content}
                              <br />
                              <c:if test="${not empty review.reviewImg}">
                                <img
                                  src="${contextPath}/download.do?imageFileName=${review.reviewImg}&path=reviewNo${review.reviewNo}"
                                  class="expand_img"
                                  alt="리뷰 사진"
                                />
                              </c:if>
                            </p>
                            <footer class="css-1fkegtf">
                              <div>
                                <span class="css-14kcwq8"
                                  >${review.creDate}</span
                                >
                              </div>
                              <!-- <button class="property-btn1">
                                <span class="ico property-img"></span
                                ><span>도움돼요</span>
                              </button> -->
                            </footer>
                          </div>
                        </article>
                      </div>
                    </c:forEach>

                    <!--페이징-->
                    <div>
                      <ul class="ul-li">
                        <c:if test="${section>1}">
                          <li class="li-btn">
                            <button
                              class="btn-2 btn-square bg-white btn-border"
                              onclick="fn_loadReviews('-1','1','${goods.goodsNo}')"
                            >
                              <i class="bi bi-arrow-left"></i>
                            </button>
                          </li>
                        </c:if>
                        <c:set
                          var="end"
                          value="${Math.ceil((totalReviewsNum - (section-1)*numForPage*10) div numForPage)}"
                        />
                        <c:if test="${end>10}">
                          <c:set var="end" value="10" />
                        </c:if>
                        <c:forEach begin="1" end="${end}" var="i">
                          <li class="li-btn">
                            <button
                              class="btn-2 btn-square bg-white btn-border"
                              onclick="fn_loadReviews('0','${i}','${goods.goodsNo}')"
                            >
                              ${((section-1)*10)+i}
                            </button>
                          </li>
                        </c:forEach>
                        <c:if test="${section*numForPage*10<totalReviewsNum}">
                          <li class="li-btn">
                            <button
                              class="btn-2 btn-square bg-white btn-border"
                              onclick="fn_loadReviews('1','1','${goods.goodsNo}')"
                            >
                              <i class="bi bi-arrow-right"></i>
                            </button>
                          </li>
                        </c:if>
                      </ul>
                    </div>
                  </div>

                  <!--여기까지 상품후기-->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title product__discount__title">
              <h2 style="text-align: center">관련 상품</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="product__item">
              <div
                class="product__item__pic set-bg"
                data-setbg="${contextPath}/img/product/main/peach.jpg"
              >
                <ul class="product__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 복숭아 1개입</a></h6>
                <h5>￦2000</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="product__item">
              <div
                class="product__item__pic set-bg"
                data-setbg="${contextPath}/img/product/main/watermelon.jpg"
              >
                <ul class="product__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 수박 1kg</a></h6>
                <h5>￦27900</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="product__item">
              <div
                class="product__item__pic set-bg"
                data-setbg="${contextPath}/img/product/main/potato.jpg"
              >
                <ul class="product__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 감자 1개입</a></h6>
                <h5>￦1300</h5>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="product__item">
              <div
                class="product__item__pic set-bg"
                data-setbg="${contextPath}/img/product/main/nyoki.jpg"
              >
                <ul class="product__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">포르치니버섯 크림 뇨끼</a></h6>
                <h5>￦8800</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Related Product Section End -->

    <!--옵션을 선택할 때마다 행이 추가됨-->
    <script>
      var storeValueUrl = "${contextPath}" + "/addCartToListValue.do";
      var goodsPrice = "${goods.price}";
      goodsPrice = parseInt(goodsPrice);
      var cartPage = "${contextPath}/main/cart.do";
    </script>
    <script src="${contextPath}/js/goodsDetail.js"></script>

    <!-- Js Plugins -->
  </body>
</html>
