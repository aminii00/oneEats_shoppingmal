<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="zxx">
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
      dl.goods_option_row > dt > div.goods_option_x_btn {
      }
    </style>
  </head>

  <body>
    <!-- Breadcrumb Section Begin -->
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
                  src="${contextPath}/download.do?imgFileName=${goods.img1}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
              </div>
              <div class="product__details__pic__slider owl-carousel">
                <img
                  data-imgbigurl="img/product/details/product-details-2.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img2}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-3.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img3}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-5.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img4}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-4.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img5}&path=goodsNo${goods.goodsNo}"
                  alt=""
                />
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-left">
            <div class="product__details__text">
              <h3>${goods.name}</h3>
              <div class="product__details__rating">
                <img
                  src="${contextPath}/img/product/review/star.jpg"
                  alt="리뷰 별"
                />
                <span>평균 ${reviewAvg} 점 </span>
                <span>(${totalReviewsNum} reviews)</span>
                <div class="product__details__price">${goods.price}</div>
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
                                  <option
                                    value="옵션을 선택해주세요"
                                    selected
                                  ></option>
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
                            <input
                              type="hidden"
                              name="shippingFee"
                              value="2500"
                            />
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
      </div>
    </section>
    <!-- Product Details Section End -->

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
