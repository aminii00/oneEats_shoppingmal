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

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>

  <body>
    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12" style="padding-left: 44px">
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
                        transform: translate3d(-1942px, 0px, 0px);
                        transition: all 1.2s ease 0s;
                        width: 3330px;
                      "
                    >
                      <c:forEach var="item" items="${newHotDealList }">
                        <div class="owl-item cloned" style="width: 277.5px">
                          <div class="col-lg-4">
                            <div
                              class="product__discount__item"
                              onclick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${item.hotdealNo}'"
                            >
                              <div
                                class="product__discount__item__pic set-bg"
                                data-setbg="${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}"
                                style="
                                  background-image: url('${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goods');
                                "
                              >
                                <!-- <div class="product__discount__percent">
                                <input type="hidden" id="showResult" value="" />
                              </div> -->
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
                                <span>${item.category}</span>
                                <h5><a href="#">${item.name}</a></h5>
                                <div class="product__item__price">
                                  <div>
                                    ${item.goods_qty}개
                                    ￦${item.discounted_price}
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
                </div>
              </div>
            </div>
            <div class="filter__item">
              <div class="row" style="justify-content: space-around">
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found">
                    <h6><span>${totalGoodsNum}</span> Products found</h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <c:forEach var="item" items="${goodsList }">
                <div class="col-lg-4 col-md-6 col-sm-6">
                  <div class="product__item">
                    <div
                      class="product__item__pic set-bg"
                      data-setbg="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                    >
                      <ul class="product__item__pic__hover">
                        <li onclick="fn_bookmark('${item.goodsNo}')">
                          <a><i class="fa fa-heart"></i></a>
                        </li>

                        <li>
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
                        </li>
                      </ul>
                    </div>
                    <div class="product__item__text">
                      <h6>
                        <a
                          href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}"
                          >${item.name}</a
                        >
                      </h6>
                      <h5>￦${item.price}</h5>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
            <div class="product__pagination">
              <a
                href="${contextPath}/goods/goodsList.do?category=${category}&section=${section}&pageNum=1"
                >1</a
              >
              <a href="#">2</a>
              <a href="#">3</a>
              <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Section End -->
    <script>
      function fn_bookmark(goodsNo) {
        $.ajax({
          type: "POST",
          url: "/goods/bookmark.do",
          data: {
            num: goodsNo,
          },
          success: function (response) {
            if (response == "success") {
              alert("찜 했습니다.");
            } else {
              fn_openalert(
                "로그인이 필요합니다. <br> 로그인 페이지로 이동하시겠습니까?",
                "/member/loginForm.do"
              );
            }
          },
          error: function (response) {
            alert("원인불명의 에러");
            console.log(response);
          },
        });
      }
    </script>
    <!-- Js Plugins -->
  </body>
</html>
