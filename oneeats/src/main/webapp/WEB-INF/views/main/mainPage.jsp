<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>one.eats</title>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link
      rel="stylesheet"
      href="/oneeats/resources/css/bootstrap.min.css"
      type="text/css"
    />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />

    <link rel="stylesheet" href="css/common.css" type="text/css" />
  </head>

  <body>
    <form action="${contextPath }/main/mainPage.do">
      <!-- Page Preloder -->
      <div id="preloder">
        <div class="loader"></div>
      </div>

      <!-- Hero Section Begin -->
      <section class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <div class="hero__categories"></div>
            </div>
            <div class="col-lg-9">
              <div class="hero__item set-bg" data-setbg="img/banner.jpg">
                <div class="hero__text">
                  <div class="textsize - 1 textcolor-white">야채</div>
                  <h2>못난이 야채 <br />100% 유기농</h2>
                  <p class="textcolor-white">저렴한 가격으로 구입하세요</p>
                  <a href="#" class="primary-btn">지금 구입하기</a>
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
                  <h5><a href="#">과일</a></h5>
                </div>
              </div>
              <div class="col-lg-3">
                <div
                  class="categories__item set-bg"
                  data-setbg="img/categories/cat-2.jpg"
                >
                  <h5><a href="#">야채</a></h5>
                </div>
              </div>
              <div class="col-lg-3">
                <div
                  class="categories__item set-bg"
                  data-setbg="img/categories/cat-3.jpg"
                >
                  <h5><a href="#">주스</a></h5>
                </div>
              </div>
              <div class="col-lg-3">
                <div
                  class="categories__item set-bg"
                  data-setbg="img/categories/cat-4.jpg"
                >
                  <h5><a href="#">나물</a></h5>
                </div>
              </div>
              <div class="col-lg-3">
                <div
                  class="categories__item set-bg"
                  data-setbg="img/categories/cat-5.jpg"
                >
                  <h5><a href="#">찌개/찜/탕</a></h5>
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
                <h2>Featured Product</h2>
              </div>
              <div class="featured__controls">
                <ul>
                  <li class="active" data-filter="*">All</li>
                  <li data-filter=".oranges">Oranges</li>
                  <li data-filter=".fresh-meat">Fresh Meat</li>
                  <li data-filter=".vegetables">Vegetables</li>
                  <li data-filter=".fastfood">Fastfood</li>
                </ul>
              </div>
            </div>
          </div>
          <div class="row featured__filter">
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-1.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-2.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-3.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-4.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-5.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-6.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-7.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
              <div class="featured__item">
                <div
                  class="featured__item__pic set-bg"
                  data-setbg="img/featured/feature-8.jpg"
                >
                  <ul class="featured__item__pic__hover">
                    <li>
                      <a href="#"><i class="fa fa-heart"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-retweet"></i></a>
                    </li>
                    <li>
                      <a href="#"><i class="fa fa-shopping-cart"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="featured__item__text">
                  <h6><a href="#">Crab Pool Security</a></h6>
                  <h5>$30.00</h5>
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
                <img src="img/banner/banner-1.jpg" alt="" />
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
              <div class="banner__pic">
                <img src="img/banner/banner-2.jpg" alt="" />
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
                <h4>Latest Products</h4>
                <div class="latest-product__slider owl-carousel">
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
            <div class="col-lg-4 col-md-6">
              <div class="latest-product__text">
                <h4>Top Rated Products</h4>
                <div class="latest-product__slider owl-carousel">
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
            <div class="col-lg-4 col-md-6">
              <div class="latest-product__text">
                <h4>Review Products</h4>
                <div class="latest-product__slider owl-carousel">
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
                <h2>From The Blog</h2>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
              <div class="blog__item">
                <div class="blog__item__pic">
                  <img src="img/blog/blog-1.jpg" alt="" />
                </div>
                <div class="blog__item__text">
                  <ul>
                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                    <li><i class="fa fa-comment-o"></i> 5</li>
                  </ul>
                  <h5><a href="#">Cooking tips make cooking simple</a></h5>
                  <p>
                    Sed quia non numquam modi tempora indunt ut labore et dolore
                    magnam aliquam quaerat
                  </p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
              <div class="blog__item">
                <div class="blog__item__pic">
                  <img src="img/blog/blog-2.jpg" alt="" />
                </div>
                <div class="blog__item__text">
                  <ul>
                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                    <li><i class="fa fa-comment-o"></i> 5</li>
                  </ul>
                  <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                  <p>
                    Sed quia non numquam modi tempora indunt ut labore et dolore
                    magnam aliquam quaerat
                  </p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
              <div class="blog__item">
                <div class="blog__item__pic">
                  <img src="img/blog/blog-3.jpg" alt="" />
                </div>
                <div class="blog__item__text">
                  <ul>
                    <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                    <li><i class="fa fa-comment-o"></i> 5</li>
                  </ul>
                  <h5><a href="#">Visit the clean farm in the US</a></h5>
                  <p>
                    Sed quia non numquam modi tempora indunt ut labore et dolore
                    magnam aliquam quaerat
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Blog Section End -->

      <!-- Footer Section Begin -->

      <!-- Footer Section End -->

      <!-- Js Plugins -->
      <script src="js/jquery-3.3.1.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/jquery.nice-select.min.js"></script>
      <script src="js/jquery-ui.min.js"></script>
      <script src="js/jquery.slicknav.js"></script>
      <script src="js/mixitup.min.js"></script>
      <script src="js/owl.carousel.min.js"></script>
      <script src="js/main.js"></script>
    </form>
  </body>
</html>
