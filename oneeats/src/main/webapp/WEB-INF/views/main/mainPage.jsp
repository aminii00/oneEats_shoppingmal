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
    <title>One.eats</title>

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
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
                <a href="#" class="primary-btn" style="margin-right: 60px"
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
              <div class="owl-item cloned" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item cloned" style="width: 277.5px">
                <div class="col-lg-4">
                  <div class="product__discount__item">
                    <div
                      class="product__discount__item__pic set-bg"
                      data-setbg="/img/product/main/watermelon.jpg"
                      style="
                        background-image: url('s/img/product/main/watermelon.jpg');
                      "
                    >
                      <div class="product__discount__percent">-10%</div>
                      <ul class="product__item__pic__hover">
                        <li>
                          <a href="#"><i class="fa fa-heart"></i></a>
                        </li>

                        <li>
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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

              <div class="owl-item" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item active" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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

              <div class="owl-item cloned active" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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
              <div class="owl-item cloned" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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

              <div class="owl-item cloned" style="width: 277.5px">
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
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
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

    <!-- Featured Section Begin -->
    <section class="featured spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title">
              <h2>Product</h2>
            </div>
            <div class="featured__controls">
              <ul>
                <li class="active" data-filter="*">All</li>
                <li data-filter=".oranges">못난이 상품</li>
                <li data-filter=".fresh-meat">밀키트</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row featured__filter">
          <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/pumpkin.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 호박</a></h6>
                <h5>￦1300</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/peach.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 복숭아 1개입</a></h6>
                <h5>￦2000</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/guel.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 감귤 500g</a></h6>
                <h5>￦3000</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/apple.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 사과 3개</a></h6>
                <h5>￦3000</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/kongbul.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>
                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">산더미 소고기 콩불</a></h6>
                <h5>￦8300</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
            <div
              class="featured__item"
              onclick="location.href='${contextPath}/goods/goodsDetail.do'"
            >
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/shabu.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">소고기 샤브샤브</a></h6>
                <h5>￦8900</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
            <div class="featured__item">
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/juice.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 오렌지 주스 1L</a></h6>
                <h5>￦5300</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
            <div class="featured__item">
              <div
                class="featured__item__pic set-bg"
                data-setbg="img/product/main/jam.jpg"
              >
                <ul class="featured__item__pic__hover">
                  <li>
                    <a href="#"><i class="fa fa-heart"></i></a>
                  </li>

                  <li>
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="featured__item__text">
                <h6><a href="#">못난이 딸기 수제청</a></h6>
                <h5>￦6500</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6">
            <div class="banner__pic">
              <img
                src="img/product/main/sm-banner.jpg"
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

                  font-family: LINESeedKR-Bd;
                "
              >
                <span style="font-size: 20px; color: white">못난이 상품</span
                ><br />

                <a href="#" class="primary-btn" style="margin-top: 12px"
                  >바로 가기</a
                >
              </div>
            </div>
          </div>

          <div class="col-lg-6 col-md-6 col-sm-6">
            <img
              src="img/product/main/meal-kit.jpg"
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
                font-family: LINESeedKR-Bd;
              "
            >
              <span style="font-size: 20px; color: white">밀키트</span><br />
              <a href="#" class="primary-btn" style="margin-top: 12px"
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
                New Products
              </h4>
              <div class="latest-product__slider owl-carousel">
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/apple.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">아오리 사과<br />1.5kg</h6>
                      <span>￦15900</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/nyoki.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">포르치니버섯 크림 뇨끼</h6>
                      <span>￦8800</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/shabu.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        샤브샤브 밀키트<br />
                        2인
                      </h6>
                      <span>￦15900</span>
                    </div>
                  </a>
                </div>
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/jam.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">딸기잼 500g</h6>
                      <span>￦7800</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/watermelon.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">수박 <br />5kg이상</h6>
                      <span>￦27900</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/corn.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">찰옥수수 <br />2입</h6>
                      <span>￦3250</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
              <h4
                class="text-left"
                style="font-size: 18px; padding-bottom: 6px"
              >
                Best Products
              </h4>
              <div class="latest-product__slider owl-carousel">
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/pattai.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">팟타이 밀키트</h6>
                      <span>￦3250</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/grape.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        못난이 포도<br />
                        1kg
                      </h6>
                      <span>￦21900</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/aspiragus.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        아스파라거스<br />
                        100g
                      </h6>
                      <span>￦5190</span>
                    </div>
                  </a>
                </div>
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/walnam.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">월남쌈 밀키트</h6>
                      <span>￦20900</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/corn.jpg"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        찰옥수수<br />
                        2입
                      </h6>
                      <span>￦3250</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/sweetpotato.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        못난이 호박 고구마<br />
                        800g
                      </h6>
                      <span>￦5900</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="latest-product__text">
              <h4
                class="text-left"
                style="font-size: 18px; padding-bottom: 6px"
              >
                Top Reviews
              </h4>
              <div class="latest-product__slider owl-carousel">
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/soup.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        크림 스프 <br />
                        4종
                      </h6>
                      <span>￦3480</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/lettuce.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">
                        못난이 상추<br />
                        150g
                      </h6>
                      <span>￦4250</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/juice.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">과일 주스 <br />260ml 3종</h6>
                      <span>￦4900</span>
                    </div>
                  </a>
                </div>
                <div class="latest-prdouct__slider__item">
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/watermelon.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">못난이 수박 <br />6kg</h6>
                      <span>￦37000</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/tteokbboki.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">진짜 부산 떡볶이</h6>
                      <span>￦11000</span>
                    </div>
                  </a>
                  <a href="#" class="latest-product__item">
                    <div class="latest-product__item__pic">
                      <img
                        src="img/product/main/egg.JPG"
                        style="width: 110px"
                        ;
                      />
                    </div>
                    <div class="latest-product__item__text">
                      <h6 style="font-size: 14px">계란찜 밀키트</h6>
                      <span>￦4500</span>
                    </div>
                  </a>
                </div>
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
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="blog__item">
              <div class="blog__item__pic">
                <img src="img/blog/carrot-soup.JPG" height="265px" alt="" />
              </div>
              <div class="blog__item__text">
                <ul>
                  <li><i class="fa fa-calendar-o"></i> 2023. 8. 12</li>
                  <li><i class="fa fa-comment-o"></i> 2</li>
                </ul>
                <h5><a href="#">감기 걸렸을때 먹기 좋은 당근 수프</a></h5>
                <p>
                  기운도 입맛도 없어서 부드럽게 넘어가는 음식을 찾게 될 때 있지
                  않나요? 그런 날엔 당근스프를 드셔 보세요.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="blog__item">
              <div class="blog__item__pic">
                <img src="img/blog/mattang.JPG" alt="" height="265px" />
              </div>
              <div class="blog__item__text">
                <ul>
                  <li><i class="fa fa-calendar-o"></i> 2023. 8. 10</li>
                  <li><i class="fa fa-comment-o"></i> 1</li>
                </ul>
                <h5><a href="#">토달토달해보아요 토마토 달걀 볶음</a></h5>
                <p>
                  한 번도 안 먹어본 사람은 있어도, 한 번만 먹어본 사람은 없다는!
                  토마토달걀볶음
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-4 col-sm-6">
            <div class="blog__item">
              <div class="blog__item__pic">
                <img src="img/blog/todal.JPG" alt="" height="265px" />
              </div>
              <div class="blog__item__text">
                <ul>
                  <li><i class="fa fa-calendar-o"></i> 2023. 8. 8</li>
                  <li><i class="fa fa-comment-o"></i> 3</li>
                </ul>
                <h5><a href="#">고구마 요리의 근본, 고구마 맛탕</a></h5>
                <p>
                  튀기지 않고 구워서 담백하게 즐기는 국민 간식 고구마
                  맛탕입니다.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Blog Section End -->

    <!-- Js Plugins -->
  </body>
</html>
