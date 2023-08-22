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
    </style>
  </head>

  <body>
    <!--이 페이지에 있는 input칸들의 name  -->
    <!--
      goodsNO : 장바구니에 담긴 상품의 상품 번호
      여러 개 있음.
      String[] goodsNos = request.getParameterValues("goodsNo");
      로 가져올 것.

      goodsQty : 장바구니에 담긴 상품의 수량
      여러 개 있음.

      goodsInbun : 장바구니에 담긴 상품이 몇 인분인지
      여러 개 있음.


      shippingFee : 배송비
      하나 있음.
      String shippingFee = request.getParameter("shippingFee");
      로 가져올 수 있음.

      totalPrice : 모든 상품의 금액에 배송비까지 더한 합계 금액.
      하나 있음.

      -->

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
                  src="${contextPath}/download.do?imgFileName=${goods.img1}&path=goods"
                  alt=""
                />
              </div>
              <div class="product__details__pic__slider owl-carousel">
                <img
                  data-imgbigurl="img/product/details/product-details-2.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img2}&path=goods"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-3.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img3}&path=goods"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-5.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img4}&path=goods"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-4.jpg"
                  src="${contextPath}/download.do?imgFileName=${goods.img5}&path=goods"
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
                                  <option
                                    value="${goodsOption.name}"
                                  >
                                    ${goodsOption.name} ${goodsOption.price}
                                  </option>
                                </c:forEach>
                              </select>
                            </div>
                            <c:forEach items="${goodsOptionList}" var="goodsOption">
                              <input id="h_option_price_${goodsOption.name}" type="hidden" value="${goodsOption.price}">
                              <input id="h_option_price_${goodsOption.name}" type="hidden" value="${goodsOption.inbun}">
                            </c:forEach>
                          </dd>
                        </dl>

                        <form
                          action="${contextPath}/mypage/orderConfirm.do"
                          method="post"
                        >
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
                              >900원</span
                            >
                            <!--배송비와 상품금액 hidden-->
                            <input
                              type="hidden"
                              name="shippingFee"
                              value="2500"
                            />
                            <input
                              type="hidden"
                              value="12000"
                              name="totalPrice"
                            />
                          </div>
                        </form>
                      </div>
                      <div class="css-9y0nwt">
                        <div class="css-ixlb9s">
                          <div class="css-yhijln">
                            <span class="css-x4cdgl" id="sum" value="0"></span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="css-lay">
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
                          type="button"
                          radius="3"
                        >
                          <div class="css-nytqmg textbold btn-hover">
                            바로 구매
                          </div>
                        </button>
                      </div>

                      <!--중간부분-->
                      <div class="css-lay2">
                        <button
                          class="cart-button css-cartbtn"
                          type="button"
                          radius="3"
                          onclick="fn_openalert('장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?', '${contextPath}/cart.do')"
                        >
                          <div class="css-nytqmg textbold btn-hover">
                            장바구니 담기
                          </div>
                        </button>
                      </div>
                    </div>

                    <!--수정-->
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
                  >Information</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  data-toggle="tab"
                  href="#tabs-3"
                  role="tab"
                  aria-selected="false"
                  >Reviews <span>(2)</span></a
                >
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tabs-1" role="tabpanel">
                <div class="product__details__tab__desc">
                  <h6>Products Infomation</h6>
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
                  <div class="text-left" style="margin-bottom: 30px">
                    <img
                      style="padding-top: 8px"
                      class="expand_img"
                      src="${contextPath}/img/product/review/carrot.jpg"
                      alt="리뷰 별"
                    />
                  </div>
                  <h6 class="text-left" style="padding-left: 20px">총 2개</h6>

                  <!--상품 후기-->
                  <div
                    class="property-input1"
                    style="border-top: 1px solid rgb(244, 244, 244)"
                  >
                    <div class="property-gdtail-flex">
                      <div class="property-gdtail-flex1">
                        <span class="property-gdtail-font">강**</span>
                      </div>
                      <div class="property-gdtail-flex1">
                        <span
                          class="property-gdtail-font"
                          style="padding-top: 11px"
                          ><img
                            src="${contextPath}/img/product/review/star.jpg"
                            alt="리뷰 별"
                        /></span>
                      </div>
                    </div>
                    <article class="property-gdtail-flex2">
                      <div>
                        <div class="property-gdtail-flex3">
                          <h3 class="property-gdtail-font1">[못난이 당근]</h3>
                        </div>
                        <p class="text-left" style="padding: 15px 0 0 0">
                          생긴것과 다르게 맛있어요!!
                        </p>
                        <footer class="css-1fkegtf">
                          <div>
                            <span class="css-14kcwq8">2023.08.12</span>
                          </div>
                          <button class="property-btn1">
                            <span class="ico property-img"></span
                            ><span>도움돼요</span>
                          </button>
                        </footer>
                      </div>
                    </article>
                  </div>
                  <div class="property-input1">
                    <div class="property-gdtail-flex">
                      <div class="property-gdtail-flex1">
                        <span class="property-gdtail-font">최**</span>
                      </div>
                      <div class="property-gdtail-flex1">
                        <span
                          class="property-gdtail-font"
                          style="padding-top: 11px"
                          ><img
                            src="${contextPath}/img/product/review/star.jpg"
                            alt="리뷰 별"
                        /></span>
                      </div>
                    </div>
                    <article class="property-gdtail-flex2">
                      <div>
                        <div class="property-gdtail-flex3">
                          <h3 class="property-gdtail-font1">[못난이 당근]</h3>
                        </div>
                        <p class="text-left" style="padding: 15px 0 0 0">
                          아주 맛있어요 믿고 사요!!
                          <br />
                          <img
                            style="padding-top: 8px; width: 60px; height: 60px"
                            src="${contextPath}/img/product/review/carrot.jpg"
                            class="expand_img"
                            alt="리뷰 별"
                          />
                        </p>
                        <footer class="css-1fkegtf">
                          <div>
                            <span class="css-14kcwq8">2023.08.12</span>
                          </div>
                          <button class="property-btn1">
                            <span class="ico property-img"></span
                            ><span>도움돼요</span>
                          </button>
                        </footer>
                      </div>
                    </article>
                  </div>

                  <!--페이징-->
                  <div id="wrapper">
                    <main id="product">
                      <section class="view">
                        <article class="review">
                          <div class="paging">
                            <span class="prev">
                              <a href="#">< 이전</a>
                            </span>
                            <span class="num">
                              <a href="#" class="on">1</a>
                              <a href="#">2</a>
                              <a href="#">3</a>
                              <a href="#">4</a>
                              <a href="#">5</a>
                              <a href="#">6</a>
                              <a href="#">7</a>
                            </span>
                            <span class="next">
                              <a href="#">다음 ></a>
                            </span>
                          </div>
                        </article>
                      </section>
                    </main>
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
      $(document).ready(function () {
        // Select the select tag
        var selectTag = $("#select_option");

        // Select the div.rows
        var rowsDiv = $("div.goods_option_rows");

        // Attach the change event handler to the select tag
        selectTag.on("change", function () {
          // Get the selected value
          var selectedValue = $(this).val();
          var selectedOptionPrice = 1000;
          var newRow =
            `<dl class="property-flex2 goods_option_row">
                              <dt class="property-font2 epzddad1">
                                <div
                                  class="property-font3 font-bold"
                                  style="margin-bottom: 24px; font-size: 22px"
                                  id="goods_option_name"
                                >` +
            selectedValue +
            `</div><input type="hidden" value=` +
            selectedValue +
            ` name="goodsName" />
                                <div class="product__details__quantity">
                                  <div class="quantity text-left">
                                    <div class="pro-qty border6">
                                      <span class="goods_option_minus_btn">-</span>
                                      <input type="text" value="1" name="goodsQty" class="goodsQty_input" />
                                      <span class="goods_option_plus_btn">+</span>
                                    </div>
                                  </div>
                                </div>
                                <div class="option_price">+`;
          selectedOptionPrice`+</div>
                              </dt>
                            </dl>
                        `;
          rowsDiv.append(newRow);
        });

        $(".goods_option_plus_btn").on("click", function () {
          var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
          var changedVar = parseInt(goodsOptionVar) + 1;
          if (changedVar < 100) {
            $(this).parent().find(".goodsQty_input").val(changedVar);
          }
        });

        $(".goods_option_minus_btn").on("click", function () {
          var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
          var changedVar = parseInt(goodsOptionVar) - 1;
          if (changedVar > 0) {
            $(this).parent().find(".goodsQty_input").val(changedVar);
          }
          console.log(goodsOptionVar);
        });
      });
    </script>
    <!-- Js Plugins -->
  </body>
</html>
