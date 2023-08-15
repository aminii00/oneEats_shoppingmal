<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <script
      type="text/javascript"
      src="${contextPath}/js/bootstrap.min.js"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <link
      rel="stylesheet"
      href="${contextPath}/css/bootstrap.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/font-awesome.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/elegant-icons.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/nice-select.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/jquery-ui.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/owl.carousel.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/slicknav.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/style.css"
      type="text/css"
    />
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
              <h2>One.eats</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">못난이 과일</a>
                <span>채소</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 col-md-5">
            <div class="sidebar">
              <div class="sidebar__item">
                <div
                  style="background-color: #a3d060; width: 212px; height: 50px"
                >
                  <h4 style="color: #fff; padding-top: 12px">카테고리</h4>
                </div>

                <ul style="width: 212px">
                  <li><a href="#">채소</a></li>
                  <li><a href="#">과일</a></li>
                  <li><a href="#">못난이 주스 / 수제청</a></li>
                  <li><a href="#">찌개 / 탕 / 찜</a></li>
                  <li><a href="#">식사 / 안주류</a></li>
                  <li><a href="#">죽</a></li>
                  <li><a href="#">식사 대용식</a></li>
                  <li><a href="#">간편 한끼 반찬</a></li>
                </ul>
              </div>

              <div class="sidebar__item">
                <h4>Price</h4>
                <div class="price-range-wrap">
                  <div
                    class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                    data-min="0"
                    data-max="10000"
                  >
                    <div
                      class="ui-slider-range ui-corner-all ui-widget-header"
                    ></div>
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
                      <input type="text" id="minamount" />
                      <input type="text" id="maxamount" class="text-right" />
                    </div>
                  </div>
                </div>
              </div>

              <div class="sidebar__item">
                <div class="latest-product__text">
                  <div class="section-title">
                    <h2
                      class="text-left"
                      style="font-size: 18px; padding-bottom: 6px"
                    >
                      최근 본 상품
                    </h2>
                  </div>
                  <div class="latest-product__slider owl-carousel">
                    <div class="latest-prdouct__slider__item">
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-1.jpg"
                            alt=""
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-2.jpg"
                            alt=""
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-3.jpg"
                            alt=""
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                    </div>
                    <div class="latest-prdouct__slider__item">
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-1.jpg"
                            alt=""
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-2.jpg"
                            alt=""
                          />
                        </div>
                        <div class="latest-product__item__text">
                          <h6>Crab Pool Security</h6>
                          <span>$30.00</span>
                        </div>
                      </a>
                      <a href="#" class="latest-product__item">
                        <div class="latest-product__item__pic">
                          <img
                            src="${contextPath}/img/latest-product/lp-3.jpg"
                            alt=""
                          />
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
            </div>
          </div>
          <div class="col-lg-9 col-md-7">
            <div class="product__discount">
              <div class="section-title product__discount__title">
                <h2 style="text-align: center">Hot Deals</h2>
              </div>
              <div class="row">
                <div
                  class="product__discount__slider owl-carousel owl-loaded owl-drag"
                >
                  <div class="owl-stage-outer">
                    <div
                      class="owl-stage"
                      style="
                        transform: translate3d(-1328px, 0px, 0px);
                        transition: all 1.2s ease 0s;
                        width: 5314px;
                      "
                    >
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/carrot.jpg"
                              style="
                                background-image: url('/img/product/main/carrot.jpg');
                              "
                            >
                              <div class="product__discount__percent">-20%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>채소</span>
                              <h5><a href="#">흙당근 1kg</a></h5>
                              <div class="product__item__price">
                                ￦3912 <span>￦4890</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/grape.jpg"
                              style="
                                background-image: url('/img/product/main/grape.jpg');
                              "
                            >
                              <div class="product__discount__percent">-20%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>과일</span>
                              <h5><a href="#">못난이 포도 1kg</a></h5>
                              <div class="product__item__price">
                                ￦17520 <span>￦21900</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/lettuce.jpg"
                              style="
                                background-image: url('/img/product/main/lettuce.jpg');
                              "
                            >
                              <div class="product__discount__percent">-15%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>채소</span>
                              <h5><a href="#">못난이 상추 150g</a></h5>
                              <div class="product__item__price">
                                ￦3613 <span>￦4250</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/peach.jpg"
                              style="
                                background-image: url('/img/product/main/peach.jpg');
                              "
                            >
                              <div class="product__discount__percent">-10%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>과일 </span>
                              <h5><a href="#">못난이 복숭아 1개입</a></h5>
                              <div class="product__item__price">
                                ￦1800 <span>￦2000</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/sweetpotato.jpg"
                              style="
                                background-image: url('/img/product/main/sweetpotato.jpg');
                              "
                            >
                              <div class="product__discount__percent">-13%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>채소</span>
                              <h5><a href="#">못난이 호박고구마 800g</a></h5>
                              <div class="product__item__price">
                                ￦5133 <span>￦5900</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="owl-item active" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/nyoki.jpg"
                              style="
                                background-image: url('/img/product/main/nyoki.jpg');
                              "
                            >
                              <div class="product__discount__percent">-5%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>밀키트</span>
                              <h5><a href="#">포르치니버섯 크림 뇨끼</a></h5>
                              <div class="product__item__price">
                                ￦8360 <span>￦8800</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item active" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/aspiragus.jpg"
                              style="
                                background-image: url('/img/product/main/aspiragus.jpg');
                              "
                            >
                              <div class="product__discount__percent">-20%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>채소</span>
                              <h5><a href="#">아스파라거스 100g</a></h5>
                              <div class="product__item__price">
                                ￦4152 <span>￦5190</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item active" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/walnam.jpg"
                              style="
                                background-image: url('/img/product/main/walnam.jpg');
                              "
                            >
                              <div class="product__discount__percent">-10%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>밀키트</span>
                              <h5><a href="#">월남쌈 밀키트</a></h5>
                              <div class="product__item__price">
                                ￦18810 <span>￦20900</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/guel.jpg"
                              style="
                                background-image: url('/img/product/main/guel.jpg');
                              "
                            >
                              <div class="product__discount__percent">-17%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>과일</span>
                              <h5><a href="#">못난이 감귤 500g</a></h5>
                              <div class="product__item__price">
                                ￦2490<span>￦3000</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/watermelon.jpg"
                              style="
                                background-image: url('/img/product/main/watermelon.jpg');
                              "
                            >
                              <div class="product__discount__percent">-10%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>과일</span>
                              <h5><a href="#">수박 5kg</a></h5>
                              <div class="product__item__price">
                                ￦25110<span>￦27900</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/aspiragus.jpg"
                              style="
                                background-image: url('/img/product/main/aspiragus.jpg');
                              "
                            >
                              <div class="product__discount__percent">-20%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>채소</span>
                              <h5><a href="#">아스파라거스 100g</a></h5>
                              <div class="product__item__price">
                                ￦4152 <span>￦5190</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="owl-item cloned" style="width: 265.667px">
                        <div class="col-lg-4">
                          <div class="product__discount__item">
                            <div
                              class="product__discount__item__pic set-bg"
                              data-setbg="/img/product/main/walnam.jpg"
                              style="
                                background-image: url('/img/product/main/walnam.jpg');
                              "
                            >
                              <div class="product__discount__percent">-10%</div>
                              <ul class="product__item__pic__hover">
                                <li>
                                  <a href="#"><i class="fa fa-heart"></i></a>
                                </li>

                                <li>
                                  <a href="#"
                                    ><i class="fa fa-shopping-cart"></i
                                  ></a>
                                </li>
                              </ul>
                            </div>
                            <div class="product__discount__item__text">
                              <span>밀키트</span>
                              <h5><a href="#">월남쌈 밀키트</a></h5>
                              <div class="product__item__price">
                                ￦18810 <span>￦20900</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="filter__item">
              <div class="row" style="justify-content: space-around">
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found">
                    <h6><span>16</span> Products found</h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-1.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-2.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-3.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-4.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-5.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-6.jpg"
                  >
                    <ul class="product__item__pic__hover">
                      <li>
                        <a href="#"><i class="fa fa-heart"></i></a>
                      </li>
                      <li>
                        <a href="#"><i class="fa fa-retweet"></i></a>
                      </li>
                    </ul>
                  </div>
                  <div class="product__item__text">
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-7.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-8.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-9.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-10.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-11.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="product__item">
                  <div
                    class="product__item__pic set-bg"
                    data-setbg="${contextPath}/img/product/product-12.jpg"
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
                    <h6><a href="#">Crab Pool Security</a></h6>
                    <h5>$30.00</h5>
                  </div>
                </div>
              </div>
            </div>
            <div class="product__pagination">
              <a href="#">1</a>
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->

    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${contextPath}/js/jquery-ui.min.js"></script>
    <script src="${contextPath}/js/jquery.slicknav.js"></script>
    <script src="${contextPath}/js/mixitup.min.js"></script>
    <script src="${contextPath}/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/js/main.js"></script>
  </body>
</html>
