<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>

<style>
  .css-1fttcpj {
    display: flex;
    flex-direction: column;
  }
  .css-1bhm8h2 {
    display: flex;
    flex: 1 1 0%;
    -webkit-box-pack: justify;
    justify-content: space-between;
  }
  .css-iqoq9n {
    margin-top: 20px;
  }
  .css-e6zlnr {
    display: flex;
    flex: 1 1 0%;
    flex-direction: row;
    align-items: flex-start;
    overflow: hidden;
    width: 100%;
    height: 40px;
    padding: 12px 0px 12px;

    font-size: 14px;
    letter-spacing: -0.5px;
  }
  .css-lytdfk {
    width: 200px;
    height: 100%;
    color: rgb(102, 102, 102);
    font-weight: 400;
    line-height: 19px;
  }
  .css-1k8t52o {
    display: flex;
    flex: 1 1 0%;
    flex-direction: column;
  }
  .css-c02hqi {
    color: rgb(51, 51, 51);
    font-weight: 400;
    line-height: 19px;
    white-space: pre-line;
    word-break: break-all;
    overflow: hidden;
  }
  .css-uy94b2 {
    display: block;
    font-size: 12px;
    color: rgb(102, 102, 102);
    padding-top: 4px;
    line-height: 16px;
    white-space: pre-line;
  }

  /*
    장바구니부분
    */
  .css-1bp09d0 {
    padding-bottom: 40px;
  }
  .css-2lvxh7 {
    border-bottom: 1px solid rgb(244, 244, 244);
  }
  .css-e6zlnr {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-align-items: flex-start;
    -webkit-box-align: flex-start;
    -ms-flex-align: flex-start;
    align-items: flex-start;
    overflow: hidden;
    width: 100%;
    padding: 17px 0 18px;
    border-top: 1px solid #f4f4f4;
    font-size: 14px;
    letter-spacing: -0.5px;
  }
  .css-lytdfk {
    width: 200px;
    height: 100%;
    color: #666;
    font-weight: 400;
    line-height: 19px;
  }
  .css-1k8t52o {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
  }
  .css-1cb5lnc:last-of-type {
    border-bottom: 1px solid rgb(244, 244, 244);
  }
  .css-1cb5lnc {
    display: flex;
    flex-direction: column;
    -webkit-box-pack: justify;
    justify-content: space-between;
    padding: 11px 10px 11px 15px;
    font-size: 12px;
    border-left: 1px solid rgb(244, 244, 244);
    border-top: 1px solid rgb(244, 244, 244);
    border-right: 1px solid rgb(244, 244, 244);
  }
  .css-1qdyvok {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    align-items: flex-start;
  }
  *,
  :after,
  :before {
    box-sizing: border-box;
    margin: 0;
  }
  .css-100vshh {
    line-height: 16px;
    width: 320px;
    color: rgb(51, 51, 51);
    overflow-wrap: break-word;
  }
  .css-1fnacti {
    line-height: 16px;
    width: 320px;
    overflow-wrap: break-word;
    font-size: 12px;
    color: rgb(102, 102, 102);
    margin-top: 4px;
  }
  .css-1liqj4s {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    padding-top: 12px;
  }
  .css-16dy8wz {
    display: inline-flex;
    flex-direction: row;
    -webkit-box-align: center;
    align-items: center;
    border: 1px solid rgb(221, 223, 225);
    width: 88px;
    border-radius: 3px;
  }
  .css-1e90glc {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yMCAxNHYySDEwdi0yeiIgZmlsbD0iI0RERCIgZmlsbC1ydWxlPSJub256ZXJvIi8+Cjwvc3ZnPgo=);
    vertical-align: top;
  }
  .css-16dy8wz .count {
    font-weight: 400;
  }

  .css-6m57y0 {
    display: inline-flex;
    overflow: hidden;
    white-space: nowrap;
    -webkit-box-pack: center;
    justify-content: center;
    font-size: 14px;
    font-weight: 600;
    color: rgb(51, 51, 51);
    text-align: center;
    width: 31px;
    height: 28px;
    line-height: 28px;
  }

  .css-18y6jr4 {
    display: inline-flex;
    width: 28px;
    height: 28px;
    border: none;
    font-size: 1px;
    color: transparent;
    background-size: cover;
    background-color: transparent;
    background-image: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHZpZXdCb3g9IjAgMCAzMCAzMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0xNiAxMHY0aDR2MmgtNHY0aC0ydi00aC00di0yaDR2LTRoMnoiIGZpbGw9IiMzMzMiIGZpbGwtcnVsZT0ibm9uemVybyIvPgo8L3N2Zz4K);
    vertical-align: top;
  }
  .css-1foiu5e {
    font-weight: bold;
    font-size: 16px;
    color: rgb(51, 51, 51);
    padding-right: 5px;
    margin: 24px 0 24px 0;
  }
  .margin4 {
    margin: 8px;
  }
  .material-symbols-outlined {
    font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 48;
  }

  .select {
    box-sizing: border-box;
    width: 100px;
    padding: 4px;
    font-size: 14px;
    border-radius: 6px;
  }
  .border6 {
    border-radius: 6px;
  }
  .option {
    padding: 4px;
    font-size: 14px;
    color: #fff;
  }
  /*장바구니*/
  .css-lay {
    display: flex;
    gap: 8px;
    margin-top: 20px;
  }
  .css-heartbtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 56px;
    height: 56px;
    border-radius: 3px;
    color: rgb(51, 51, 51);
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(221, 221, 221);
  }
  .css-let1 {
    display: inline-block;
    font-size: 22px;
    font-weight: 500;
  }
  .css-sthcolor:disabled {
    border-color: rgb(221, 221, 221);
    color: rgb(221, 221, 221);
  }
  .css-lay2 {
    -webkit-box-flex: 1;
    flex-grow: 1;
  }
  .css-lay2 .cart-button {
    font-weight: 500;
  }
  .css-cartbtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    height: 56px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: #a3d060;
    border: 0px none;
  }
</style>

<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <title>goodsDetail</title>

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
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
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
              <h2>못난이 상품</h2>
              <div class="breadcrumb__option">
                <a href="./index.html">Home</a>
                <a href="./index.html">못난이 상품</a>
                <span>채소</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
              <div class="product__details__pic__item">
                <img
                  class="product__details__pic__item--large"
                  src="${contextPath}/img/product/details/product-details-1.jpg"
                  alt=""
                />
              </div>
              <div class="product__details__pic__slider owl-carousel">
                <img
                  data-imgbigurl="img/product/details/product-details-2.jpg"
                  src="${contextPath}/img/product/details/product-details-1.jpg"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-3.jpg"
                  src="${contextPath}/img/product/details/product-details-1.jpg"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-5.jpg"
                  src="${contextPath}/img/product/details/product-details-1.jpg"
                  alt=""
                />
                <img
                  data-imgbigurl="img/product/details/product-details-4.jpg"
                  src="${contextPath}/img/product/details/product-details-1.jpg"
                  alt=""
                />
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-left">
            <div class="product__details__text">
              <h3>못난이 당근</h3>
              <div class="product__details__rating">
                <img
                  src="${contextPath}/img/product/review/star.png"
                  alt="리뷰 별"
                />
                <img
                  src="${contextPath}/img/product/review/star.png"
                  alt="리뷰 별"
                />
                <img
                  src="${contextPath}/img/product/review/star.png"
                  alt="리뷰 별"
                />
                <img
                  src="${contextPath}/img/product/review/star.png"
                  alt="리뷰 별"
                />
                <img
                  src="${contextPath}/img/product/review/half-star.png"
                  alt="리뷰 별"
                />

                <span>(3 reviews)</span>
                <div class="product__details__price">￦900</div>
                <section class="css-1ua1wyk e17iylht2">
                  <div class="css-iqoq9n e6qx2kx2">
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">배송</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">택배 배송(기본 3일)</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">판매자</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">김씨</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">포장타입</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">상온(종이 포장)</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">원산지</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">논산</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">무게 / 용량</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">300g</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">수확시기</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">8월</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr epzddad2">
                      <dt class="css-lytdfk epzddad1 textbold">배송</dt>
                      <dd class="css-1k8t52o epzddad0">
                        <p class="css-c02hqi e6qx2kx1">택배 배송(기본 3일)</p>
                      </dd>
                    </dl>

                    <!--수정-->
                    <div
                      class="css-1bp09d0 e17iylht1"
                      style="margin-bottom: -40px"
                    >
                      <div class="css-2lvxh7 e1qy0s5w0">
                        <dl class="css-e6zlnr epzddad2" style="height: 170px">
                          <dt
                            class="css-lytdfk epzddad1 textbold"
                            style="margin-top: 16px"
                          >
                            상품선택
                          </dt>
                          <dd class="css-1k8t52o epzddad0">
                            <div
                              style="align-content: center"
                              style="overflow-y: scrol"
                            >
                              <select name="select" class="margin4 opt">
                                <option value="옵션을 선택해주세요">
                                  옵션을 선택해주세요
                                </option>
                                <option value="900">
                                  못난이 당근 단품 900원
                                </option>
                                <option value="2500">
                                  못난이 당근 3개묶음 2500원
                                </option>
                                <option value="4300">
                                  못난이 당근 5개묶음 4300원
                                </option>
                              </select>
                            </div>
                          </dd>
                        </dl>
                        <div
                          class="cart-option-item css-1cb5lnc e1bjklo17"
                          style="width: 525px"
                        >
                          <dl
                            class="css-e6zlnr epzddad2"
                            style="height: 150px; border-top: none; margin: 0"
                          >
                            <dt class="css-lytdfk epzddad1">
                              <div
                                class="css-1foiu5e e1bjklo10 font-bold"
                                style="margin-bottom: 24px; font-size: 22px"
                              >
                                못난이 당근 단품
                              </div>
                              <div class="product__details__quantity">
                                <div class="quantity text-left">
                                  <div class="pro-qty border6">
                                    <input type="text" value="1" />
                                  </div>
                                </div>
                              </div>
                            </dt>
                          </dl>
                          <span
                            class="css-1foiu5e e1bjklo10 text-right"
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
                            class="css-1foiu5e e1bjklo10 text-right"
                            style="font-size: 22px; margin-bottom: -10px"
                            >900원</span
                          >
                        </div>
                      </div>
                      <div class="css-9y0nwt e17iylht0">
                        <div class="css-ixlb9s eebc7rx8">
                          <div class="css-yhijln eebc7rx7">
                            <span
                              class="css-x4cdgl eebc7rx5"
                              id="sum"
                              value="0"
                            ></span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="css-lay e10vtr1i2">
                      <button
                        class="css-heartbtn e4nu7ef3 btn-regular"
                        type="button"
                        width="56"
                        height="56"
                        radius="3"
                      >
                        <span class="css-let1 e4nu7ef1"
                          ><img
                            src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yNS44MDcgNy44NjNhNS43NzcgNS43NzcgMCAwIDAtOC4xNzIgMEwxNiA5LjQ5N2wtMS42MzUtMS42MzRhNS43NzkgNS43NzkgMCAxIDAtOC4xNzMgOC4xNzJsMS42MzQgMS42MzQgNy40NjYgNy40NjdhMSAxIDAgMCAwIDEuNDE1IDBzMCAwIDAgMGw3LjQ2Ni03LjQ2N2gwbDEuNjM0LTEuNjM0YTUuNzc3IDUuNzc3IDAgMCAwIDAtOC4xNzJ6IiBzdHJva2U9IiM1RjAwODAiIHN0cm9rZS13aWR0aD0iMS42IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K"
                            alt=""
                            class="css-0"
                        /></span>
                      </button>
                      <div class="css-lay2 e10vtr1i0">
                        <button
                          class="cart-button css-cartbtn e4nu7ef3"
                          type="button"
                          radius="3"
                        >
                          <span class="css-nytqmg e4nu7ef1 textbold"
                            >바로 구매</span
                          >
                        </button>
                      </div>

                      <!--중간부분-->
                      <div class="css-lay2 e10vtr1i0">
                        <button
                          class="cart-button css-cartbtn e4nu7ef3"
                          type="button"
                          radius="3"
                        >
                          <span class="css-nytqmg e4nu7ef1 textbold"
                            >장바구니 담기</span
                          >
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
                  >Reviews <span>(3)</span></a
                >
              </li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tabs-1" role="tabpanel">
                <div class="product__details__tab__desc">
                  <h6>Products Infomation</h6>
                  <p>
                    자연이 주는 그대로, 수분감 가득한 무농약 못난이 햇
                    양파입니다.<br />
                    비교적 작게 자랐지만, 껍질이 단단하고 겹갯수가 적어 수분이
                    가득하고 식감은 아삭합니다.<br />
                    단지 조금 작다는 이유만으로 버려질 위기에 처한 무농약 햇
                    양파 무농약 햇 양파가 버려질 위기에 처했다는 제보를 받고
                    전북 군산으로 달려갔습니다. <br />약 1,700평에 달하는 광활한
                    양파밭에는 변화무쌍한 올해 날씨탓인지 비교적 작게 자란
                    양파들이 수확을 기다리고 있었습니다. <br />날씨탓에 비교적
                    작게 자랐지만, 박진규 농부님은 무농약 농법으로 재배한 만큼
                    관심과 정성은 듬뿍 담았다고 자부하셨는데요. <br />기존
                    납품처에는 크기가 작다는 이유로 납품을 거부해 양파들이
                    버려질 위기라고 말하는 박진규 농부님의 얼굴에는 근심이
                    가득했습니다. <br />농부님의 정성이 담긴 햇 양파들이
                    버려지게 둘순 없어 일단 수확했습니다. 그렇게 모우고 보니
                    하루만에 약 1톤이 넘는 못난이 양파들이 쌓이네요.<br />
                    작게 자라 판로를 잃어 버려질 위기에 처한 작아서 남지 않아
                    오히려 좋은 무농약 햇 양파 구조에 동참해주세요! 여러분의
                    도움이 농가와 지구를 살리는데 큰 힘이 됩니다<br />
                  </p>
                </div>
              </div>
              <div class="tab-pane" id="tabs-3" role="tabpanel">
                <div class="product__details__tab__desc">
                  <h6>상품 후기</h6>
                  <p></p>
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
            <div class="section-title related__product__title">
              <h2>Related Product</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-4 col-sm-6">
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
                    <a href="#"><i class="fa fa-retweet"></i></a>
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
          <div class="col-lg-3 col-md-4 col-sm-6">
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
                    <a href="#"><i class="fa fa-retweet"></i></a>
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
          <div class="col-lg-3 col-md-4 col-sm-6">
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
                    <a href="#"><i class="fa fa-retweet"></i></a>
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
          <div class="col-lg-3 col-md-4 col-sm-6">
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
                    <a href="#"><i class="fa fa-retweet"></i></a>
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
      </div>
    </section>
    <!-- Related Product Section End -->

    <!-- Js Plugins -->
  </body>
</html>
