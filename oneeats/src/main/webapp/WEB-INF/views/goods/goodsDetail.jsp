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

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <!-- Css Styles -->

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
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

    <style>
      .css-e6zlnr {
        display: flex;
        flex: 1 1 0%;
        flex-direction: row;
        align-items: flex-start;
        overflow: hidden;
        width: 100%;
        height: 40px;
        padding: 12px 0 12px;
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
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
      }
      .css-c02hqi {
        color: #333;
        font-weight: 400;
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        overflow: hidden;
      }
      .css-1bp09d0 {
        padding-bottom: 40px;
      }
      .css-2lvxh7 {
        border-bottom: 1px solid #f4f4f4;
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
        border-bottom: 1px solid #f4f4f4;
      }
      .css-1cb5lnc {
        display: flex;
        flex-direction: column;
        -webkit-box-pack: justify;
        justify-content: space-between;
        padding: 11px 10px 11px 15px;
        font-size: 12px;
        border-left: 1px solid #f4f4f4;
        border-top: 1px solid #f4f4f4;
        border-right: 1px solid #f4f4f4;
      }
      *,
      :after,
      :before {
        box-sizing: border-box;
        margin: 0;
      }
      .css-1foiu5e {
        font-weight: 700;
        font-size: 16px;
        color: #333;
        padding-right: 5px;
        margin: 24px 0 24px 0;
      }
      .margin4 {
        margin: 8px;
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
      .css-lay {
        display: flex;
        gap: 8px;
        margin-top: 20px;
      }
      .css-heartbtn {
        display: block;
        padding: 0 10px;
        text-align: center;
        overflow: hidden;
        width: 56px;
        height: 56px;
        border-radius: 3px;
        color: #333;
        background-color: #fff;
        border: 1px solid #ddd;
      }
      .css-let1 {
        display: inline-block;
        font-size: 22px;
        font-weight: 500;
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
        padding: 0 10px;
        text-align: center;
        overflow: hidden;
        width: 100%;
        height: 56px;
        border-radius: 3px;
        color: #fff;
        background-color: #a3d060;
        border: 0 none;
      }
      #product > .view > .review > .paging > .num > a.on {
        color: #fe434c;
        font-weight: 700;
      }
      #product > .view > .review > .paging {
        width: 100%;
        padding: 30px 0;
        text-align: center;
      }
      #product > .view > .review > .paging > span > a {
        color: #777;
        font-size: 11px;
        letter-spacing: -1px;
      }
      #product > .view > .review > .paging > .num > a {
        display: inline-block;
        min-width: 14px;
        margin: 0 2px;
        padding: 8px 9px;
        border: 1px solid #c4c4c4;
        color: #000;
        font-size: 12px;
        text-align: center;
        text-decoration: none;
      }
      #product > .view > .review > .paging > .num > a.on {
        color: #fe434c;
        font-weight: 700;
      }
      .css-169773r {
        display: flex;
        padding: 30px 0 19px 20px;
        border-bottom: 1px solid #f4f4f4;
        font-size: 14px;
        font-weight: 400;
        line-height: 19px;
      }
      .css-107htc6 {
        flex: 0 0 225px;
      }
      .css-1qo6qeh {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        margin: -1px 0 7px;
      }
      .css-f3vz0n {
        font-weight: 500;
      }
      .css-inxa61 {
        flex: 1 1 0%;
        overflow: hidden;
      }
      .css-18pn4xv {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        gap: 5px;
        height: 19px;
        padding-right: 20px;
      }
      .css-11q4ylb {
        font-size: 14px;
        font-weight: 400;
        line-height: 19px;
        color: #999;
        display: -webkit-box;
        overflow: hidden;
        word-break: break-all;
        white-space: normal;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      .css-1fkegtf {
        display: flex;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        width: 100%;
        padding-top: 19px;
        padding-right: 20px;
      }
      .css-14kcwq8 {
        color: #999;
      }
      .css-g3a39p {
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        min-width: 88px;
        height: 32px;
        padding: 0 13px 0 11px;
        border: 1px solid #e2e2e2;
        border-radius: 20px;
        font-size: 12px;
        line-height: 20px;
        color: #999;
      }
      .css-xdee1z {
        width: 15px;
        height: 15px;
        margin-right: 4px;
        background: url(data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIKICAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxwYXRoCiAgICBkPSJNNC4wNDgzNyAxMi45OTk4SDIuMjE5MzVDMS41NDU5MiAxMi45OTk4IDEgMTIuNDYyNiAxIDExLjc5OTlWNy41OTk5MkMxIDYuOTM3MTggMS41NDU5MiA2LjM5OTkzIDIuMjE5MzUgNi4zOTk5M0g0LjA0ODM3TTguMzE2MDggNS4xOTk5NVYyLjc5OTk4QzguMzE2MDggMS44MDU4OCA3LjQ5NzIgMSA2LjQ4NzA2IDFMNC4wNDgzNyA2LjM5OTkzVjEyLjk5OTlIMTAuOTI1NUMxMS41MzM1IDEzLjAwNjYgMTIuMDUzNyAxMi41NzE1IDEyLjE0NDggMTEuOTc5OUwxMi45ODYyIDYuNTc5OTNDMTMuMDM5OSA2LjIzMTg1IDEyLjkzNTUgNS44NzgxMiAxMi43MDA4IDUuNjEyNDVDMTIuNDY2IDUuMzQ2NzggMTIuMTI0NiA1LjE5NTk2IDExLjc2NjggNS4xOTk5NUg4LjMxNjA4WiIKICAgIHN0cm9rZT0iIzk5OTk5OSIgc3Ryb2tlLXdpZHRoPSIxLjEiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIKICAgIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPC9zdmc+Cg==)
          center center no-repeat;
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
                  src="${contextPath}/img/product/review/star.jpg"
                  alt="리뷰 별"
                />

                <span style="color: #dd2222">(3 reviews)</span>
                <div class="product__details__price" style="color: #dd2222">
                  ￦900
                </div>
                <section>
                  <div>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">배송</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">택배 배송(기본 3일)</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">판매자</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">김씨</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">포장타입</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">상온(종이 포장)</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">원산지</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">논산</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">무게 / 용량</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">300g</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">수확시기</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">8월</p>
                      </dd>
                    </dl>
                    <dl class="css-e6zlnr">
                      <dt class="css-lytdfk textbold">배송</dt>
                      <dd class="css-1k8t52o">
                        <p class="css-c02hqi">택배 배송(기본 3일)</p>
                      </dd>
                    </dl>

                    <!--수정-->
                    <div class="css-1bp09d0" style="margin-bottom: -40px">
                      <div class="css-2lvxh7">
                        <dl class="css-e6zlnr" style="height: 170px">
                          <dt
                            class="css-lytdfk textbold"
                            style="margin-top: 16px"
                          >
                            상품선택
                          </dt>
                          <dd class="css-1k8t52o">
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
                          class="cart-option-item css-1cb5lnc"
                          style="width: 525px"
                        >
                          <dl
                            class="css-e6zlnr"
                            style="height: 150px; border-top: none; margin: 0"
                          >
                            <dt class="css-lytdfk">
                              <div
                                class="css-1foiu5e font-bold"
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
                            class="css-1foiu5e text-right"
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
                            class="css-1foiu5e text-right"
                            style="font-size: 22px; margin-bottom: -10px"
                            >900원</span
                          >
                        </div>
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
                          class="cart-button css-cartbtn e4nu7ef3"
                          type="button"
                          radius="3"
                        >
                          <span class="css-nytqmg textbold">바로 구매</span>
                        </button>
                      </div>

                      <!--중간부분-->
                      <div class="css-lay2">
                        <button
                          class="cart-button css-cartbtn"
                          type="button"
                          radius="3"
                        >
                          <span class="css-nytqmg textbold">장바구니 담기</span>
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
                  <h6
                    class="text-left textbold"
                    style="padding-left: 20px; font-size: 24px"
                  >
                    상품 후기
                  </h6>
                  <div class="text-left" style="margin-bottom: 30px">
                    <img
                      style="padding-top: 8px"
                      src="${contextPath}/img/product/review/carrot.jpg"
                      alt="리뷰 별"
                    />
                  </div>
                  <h6 class="text-left" style="padding-left: 20px">총 2개</h6>

                  <!--상품 후기-->
                  <div
                    class="css-169773r"
                    style="border-top: 1px solid rgb(244, 244, 244)"
                  >
                    <div class="css-107htc6">
                      <div class="css-1qo6qeh">
                        <span class="css-f3vz0n">강**</span>
                      </div>
                      <div class="css-1qo6qeh">
                        <span class="css-f3vz0n" style="padding-top: 11px"
                          ><img
                            src="${contextPath}/img/product/review/star.jpg"
                            alt="리뷰 별"
                        /></span>
                      </div>
                    </div>
                    <article class="css-inxa61">
                      <div>
                        <div class="css-18pn4xv">
                          <h3 class="css-11q4ylb">[못난이 당근]</h3>
                        </div>
                        <p class="text-left" style="padding: 15px 0 0 0">
                          생긴것과 다르게 맛있어요!!
                        </p>
                        <footer class="css-1fkegtf">
                          <div>
                            <span class="css-14kcwq8">2023.08.12</span>
                          </div>
                          <button class="css-g3a39p">
                            <span class="ico css-xdee1z"></span
                            ><span>도움돼요</span>
                          </button>
                        </footer>
                      </div>
                    </article>
                  </div>
                  <div class="css-169773r">
                    <div class="css-107htc6">
                      <div class="css-1qo6qeh">
                        <span class="css-f3vz0n">최**</span>
                      </div>
                      <div class="css-1qo6qeh">
                        <span class="css-f3vz0n" style="padding-top: 11px"
                          ><img
                            src="${contextPath}/img/product/review/star.jpg"
                            alt="리뷰 별"
                        /></span>
                      </div>
                    </div>
                    <article class="css-inxa61">
                      <div>
                        <div class="css-18pn4xv">
                          <h3 class="css-11q4ylb">[못난이 당근]</h3>
                        </div>
                        <p class="text-left" style="padding: 15px 0 0 0">
                          아주 맛있어요 믿고 사요!!
                          <br />
                          <img
                            style="padding-top: 8px; width: 60px; height: 60px"
                            src="${contextPath}/img/product/review/carrot.jpg"
                            alt="리뷰 별"
                          />
                        </p>
                        <footer class="css-1fkegtf">
                          <div>
                            <span class="css-14kcwq8">2023.08.12</span>
                          </div>
                          <button class="css-g3a39p">
                            <span class="ico css-xdee1z"></span
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
            <div class="section-title related__product__title">
              <h2>관련 상품</h2>
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
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 복숭아</a></h6>
                <h5>￦3200</h5>
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
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 감자</a></h6>
                <h5>￦1300</h5>
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
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 수박</a></h6>
                <h5>￦5400</h5>
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
                    <a href="#"><i class="fa fa-shopping-cart"></i></a>
                  </li>
                </ul>
              </div>
              <div class="product__item__text">
                <h6><a href="#">못난이 가지</a></h6>
                <h5>￦1200</h5>
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
