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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link
      rel="stylesheet"
      href="${contextPath}/css/common.css"
      type="text/css"
    />

    <style>
      @font-face {
        font-family: "LINESeedKR-Bd";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2")
          format("woff2");
        font-weight: 700;
        font-style: normal;
      }
    </style>
  </head>

  <body>
    <!-- Page Preloder -->

    <!-- Hero Section Begin -->
    <section class="hero">
      <div class="container">
        <div class="row">
          <div class="col-lg-9">
            <div
              class="hero__item set-bg"
              style="width: 812px; height: 431"
              data-setbg="${contextPath}/img/product/main/mainPage.JPG"
            >
              <div class="hero__text">
                <span
                  class="text-left;"
                  style="text-align: left; margin-left: -68px"
                  >신선한 제품 One.eats와 함께하세요</span
                >
                <h2 style="margin: 24px 0 12px -68px">못난이 <br />상품</h2>
                <p class="text-left" style="color: #fff">
                  도매시장을 거치지 않는 산지 직송 못난이 농산물로<br />
                  시세 대비 20% 이상 저렴한 가격에 판매합니다.
                </p>
                <a href="#" style="background-color:  #A6CD48;" class="primary-btn">상품 보기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Hero Section End -->

    <!-- Categories Section Begin -->
    <section class="categories">
      <div class="container">
        <div class="row">
          <div class="categories__slider owl-carousel">
            <div class="col-lg-3">
              <div
                class="categories__item set-bg"
                data-setbg="img/categories/cat-1.jpg"
              >
                <h5><a href="#">Fresh Fruit</a></h5>
              </div>
            </div>
            <div class="col-lg-3">
              <div
                class="categories__item set-bg"
                data-setbg="img/categories/cat-2.jpg"
              >
                <h5><a href="#">Dried Fruit</a></h5>
              </div>
            </div>
            <div class="col-lg-3">
              <div
                class="categories__item set-bg"
                data-setbg="img/categories/cat-3.jpg"
              >
                <h5><a href="#">Vegetables</a></h5>
              </div>
            </div>
            <div class="col-lg-3">
              <div
                class="categories__item set-bg"
                data-setbg="img/categories/cat-4.jpg"
              >
                <h5><a href="#">drink fruits</a></h5>
              </div>
            </div>
            <div class="col-lg-3">
              <div
                class="categories__item set-bg"
                data-setbg="img/categories/cat-5.jpg"
              >
                <h5><a href="#">drink fruits</a></h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
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
            <div class="featured__item">
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
            <div class="featured__item">
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
                <h6><a href="#">못난이 복숭아</a></h6>
                <h5>￦2000</h5>
              </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
            <div class="featured__item">
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
            <div class="featured__item">
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
            <div class="featured__item">
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
            <div class="featured__item">
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
