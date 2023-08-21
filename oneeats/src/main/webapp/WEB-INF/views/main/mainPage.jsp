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
    <!-- 예지의 취미 : ${price} -->

    <!-- <div>${product}</div>
    <div>${product.name}</div>
    <div>${apple}</div>

    <c:forEach var="i" items="${apple}"> ${i} <br /> </c:forEach> -->
    <!-- <div style="background-color: red">
      <c:forEach var="i" items="${goodsList}">
        <div>이름: ${i.name}</div>
        <div>가격:${i.price} <br /></div>
        <div>포장타입:${i.rapping} <br /></div>
        <div><img src="${contextPath}/download.do?imageFileName=${i.img1}&path=prop" alt=""></div>
      </c:forEach>
    </div> -->

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
              <c:forEach var="item" items="${goodsList }">
                <div class="owl-item cloned" style="width: 277.5px">
                  <div class="col-lg-4">
                    <div class="product__discount__item">
                      <div
                        class="product__discount__item__pic set-bg"
                        data-setbg="${contextPath}/download.do?imageFileName=${item.img1}&path=prop"
                        style="
                          background-image: url('${contextPath}/download.do?imageFileName=${item.img1}&path=prop');
                        "
                      >
                        <div class="product__discount__percent">
                          <input
                            type="hidden"
                            id="showResult"
                            value="${item.price}"
                          />
                        </div>
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
                        <span>${item.category}</span>
                        <h5><a href="#">${item.name}</a></h5>
                        <div class="product__item__price">
                          <div>￦2490</div>
                          <input type="hidden" id="savePrice" value="2490" />
                          <span>￦${item.price}</span>
                          <input
                            type="hidden"
                            id="oPrice"
                            value="${item.price}"
                          />
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

    <!-- Featured Section Begin -->

    <!-- Featured Section End -->

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

                <a href="#" class="primary-btn" style="margin-top: 12px"
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
                  <c:forEach begin="1" end="3" var="i" items="${newGoodsList }">
                    <a
                      href="${contextPage}/goods/goodsDetail.do?goodsNo=${i.goodsNo}"
                      class="latest-product__item"
                    >
                      <div class="latest-product__item__pic">
                        <img
                          src="${contextPath}/download.do?imageFileName=${i.img1}&path=prop"
                          style="width: 110px"
                          ;
                        />
                      </div>
                      <div class="latest-product__item__text">
                        <h6 style="font-size: 14px">${i.name}</h6>
                        <span>￦${i.price}</span>
                      </div>
                    </a>
                  </c:forEach>
                </div>
                <div class="latest-prdouct__slider__item">
                  <c:forEach begin="4" end="6" var="i" items="${newGoodsList }">
                    <a
                      href="${contextPage}/goods/goodsDetail.do?goodsNo=${i.goodsNo}"
                      class="latest-product__item"
                    >
                      <div class="latest-product__item__pic">
                        <img
                          src="${contextPath}/download.do?imageFileName=${i.img1}&path=prop"
                          style="width: 110px"
                          ;
                        />
                      </div>
                      <div class="latest-product__item__text">
                        <h6 style="font-size: 14px">${i.name}</h6>
                        <span>${i.price}</span>
                      </div>
                    </a>
                  </c:forEach>
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
          <c:forEach var="i" items="${newRecipeList }">
            <div class="col-lg-4 col-md-4 col-sm-6">
              <div class="blog__item">
                <div class="blog__item__pic">
                  <img
                    src="${contextPath}/download.do?imageFileName=${i.cookingImg}&path=recipe"
                    height="265px"
                    alt=""
                  />
                </div>
                <div class="blog__item__text">
                  <ul>
                    <li><i class="fa fa-calendar-o"></i> ${i.creDate}</li>
                    <li><i class="fa fa-comment-o"></i> 2</li>
                  </ul>
                  <h5><a href="#">${i.title}</a></h5>
                  <p>${i.description}</p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>
    <script>
      $(document).ready(function () {
        var originPrice = document.querySelector("#oPrice").value; //1000원
        var savePrice = document.querySelector("#savePrice").value; //100원에 살 수 있음 할인율이 90%여야함하ㅡ
        console.log(originPrice);
        console.log(savePrice);

        document.querySelector("#showResult").innerHTML =
          ((originalPrice - savePrice) / originalPrice) * 100;
        console.log(showResult);
      });
    </script>
  </body>
</html>
