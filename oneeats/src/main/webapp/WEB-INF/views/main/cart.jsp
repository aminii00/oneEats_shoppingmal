<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

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
      .flex2 {
        display: flex;
        align-items: stretch;
        align-content: stretch;
        text-align: center;
      }
    </style>
  </head>

  <body>
    <!-- Page Preloder -->
    <div id="preloder">
      <div class="loader"></div>
    </div>

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="shoping__cart__table">
              <table>
                <thead>
                  <tr>
                    <th class="shoping__product">상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="shoping__cart__item">
                      <img
                        src="${contextPath}/img/product/main/carrot.jpg"
                        width="100px"
                        height="100px"
                        alt=""
                      />
                      <h5>못난이 당근</h5>
                    </td>
                    <td class="shoping__cart__price">￦900</td>
                    <td class="shoping__cart__quantity">
                      <div class="quantity">
                        <div class="pro-qty">
                          <input type="text" value="2" />
                        </div>
                      </div>
                    </td>
                    <td class="shoping__cart__total">￦1800</td>
                    <td class="shoping__cart__item__close">
                      <img src="${contextPath}/img/cart/close.png" alt="" />
                    </td>
                  </tr>

                  <tr>
                    <td class="shoping__cart__item">
                      <img
                        src="${contextPath}/img/cart/peach.jpg"
                        width="100px"
                        height="100px"
                        alt=""
                      />
                      <h5>못난이 복숭아</h5>
                    </td>
                    <td class="shoping__cart__price">￦4500</td>
                    <td class="shoping__cart__quantity">
                      <div class="quantity">
                        <div class="pro-qty">
                          <input type="text" value="1" />
                        </div>
                      </div>
                    </td>
                    <td class="shoping__cart__total">￦4500</td>
                    <td class="shoping__cart__item__close">
                      <img src="${contextPath}/img/cart/close.png" alt="" />
                    </td>
                  </tr>
                  <tr>
                    <td class="shoping__cart__item">
                      <img
                        src="${contextPath}/img/cart/potato.jpg"
                        alt=""
                        width="100px"
                        height="100px"
                      />
                      <h5>못난이 감자</h5>
                    </td>
                    <td class="shoping__cart__price">￦2700</td>
                    <td class="shoping__cart__quantity">
                      <div class="quantity">
                        <div class="pro-qty">
                          <input type="text" value="1" />
                        </div>
                      </div>
                    </td>
                    <td class="shoping__cart__total">￦5000</td>
                    <td class="shoping__cart__item__close">
                      <img src="${contextPath}/img/cart/close.png" alt="" />
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12 flex2">
            <div class="shoping__cart__btns">
              <a
                href="#"
                class="primary-btn cart-btn"
                style="margin-right: 780px"
                >쇼핑 계속하기</a
              >
              <a href="#" class="primary-btn cart-btn cart-btn-right"
                ><span></span> Upadate</a
              >
            </div>
          </div>
          <div class="col-lg-6"></div>
          <div class="col-lg-6">
            <div class="shoping__checkout">
              <h5>총 상품 금액</h5>
              <ul>
                <li class="text-left">결제 금액 <span>￦9500</span></li>
                <li class="text-left">배송비 <span>￦2500</span></li>
                <li class="text-left" style="font-size: 28px">
                  합계
                  <span style="font-size: 28px; color: #dd2222">￦12000</span>
                </li>
              </ul>
              <a href="#" class="primary-btn">결제하기</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Shoping Cart Section End -->
  </body>
</html>
