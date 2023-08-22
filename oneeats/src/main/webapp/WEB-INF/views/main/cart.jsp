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

    <link
      rel="stylesheet"
      href="${contextPath}/css/font-awesome.min.css"
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
    <!--이 페이지에 있는 input칸들의 name  -->
    <!--
      goodsNo : 장바구니에 담긴 상품의 상품 번호
      여러 개 있음.
      String[] goodsNos = request.getParameterValues("goodsNo");
      로 가져올 것.
      
      goodsQty : 장바구니에 담긴 상품의 수량
      여러 개 있음.

      goodsInbun : 상품의 인분
      여러 개 있음.

      shippingFee : 배송비
      하나 있음.
      String shippingFee = request.getParameter("shippingFee");
      로 가져올 수 있음.

      payment_price : 모든 상품의 금액
      
      discount_price : 상품을 퍼센테이지로 할인한 금액의 총합
      -->
    <!-- Shoping Cart Section Begin -->

    <!--값들 초기화-->
    <c:set var="payment_price" value="0" />
    <c:set var="discount_price" value="0" />
    <c:set var="shippingFee" value="0" />

    <section class="shoping-cart spad">
      <form action="${contextPath}/mypage/orderConfirm.do" method="post">
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
                  <tbody class="cart_goods_rows">
                    <!--행 반복-->
                    <c:choose>
                      <c:when test="${not empty cartList}">
                        <c:forEach items="${cartList}" var="cart">
                          <!--반복할 때마다 추가-->
                          <c:set
                            var="payment_price"
                            value="${payment_price+cart.goodsPrice*cart.goodsQty}"
                          />
                          <c:set
                            var="discount_price"
                            value="${discount_price+cart.discountPrice}"
                          />
                          <!--상품 행-->
                          <tr class="cart_goods_row">
                            <input
                              class="h_goods_no"
                              type="hidden"
                              name="goodsNo"
                              value="${cart.goodsNo}"
                            />
                            <input
                              class="h_goods_qty"
                              type="hidden"
                              name="goodsQty"
                              value="${cart.goodsQty}"
                            />
                            <input
                              class="h_option_no"
                              type="hidden"
                              name="optionNo"
                              value="${cart.optionNo}"
                            />
                            <input
                              class="h_goods_inbun"
                              type="hidden"
                              name="goodsInbun"
                              value="${cart.optionInbun}"
                            />
                            <td class="shoping__cart__item">
                              <img
                                src="${contextPath}/download.do?imgFileName=${goodsImg}&path=goods"
                                width="100px"
                                height="100px"
                                alt=""
                              />
                              <h5>${cart.goodsName}</h5>
                            </td>
                            <td class="shoping__cart__price">
                              ￦${cart.goodsPrice}
                            </td>
                            <td class="shoping__cart__quantity">
                              <div class="quantity">
                                <div class="pro-qty">
                                  <input type="text" value="2" />
                                </div>
                              </div>
                            </td>
                            <td class="shoping__cart__total">
                              ￦${cart.goodsPrice * cart.goodsQty}
                            </td>
                            <td class="shoping__cart__item__close">
                              <img
                                src="${contextPath}/img/cart/close.png"
                                alt=""
                              />
                            </td>
                          </tr>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <tr class="cart_goods_row">
                          카트에 담긴 상품이 없습니다.
                        </tr>
                      </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12 flex2">
              <div class="shoping__cart__btns">
                <a
                  href="${previousPage}"
                  class="primary-btn cart-btn"
                  style="margin-right: 780px"
                  >쇼핑 계속하기</a
                >
              </div>
            </div>
            <div class="col-lg-6"></div>
            <div class="col-lg-6">
              <div class="shoping__checkout">
                <h5>총 상품 금액</h5>
                <ul>
                  <input type="hidden" name="shippingFee" value="2500" />
                  <input type="hidden" name="payment_price" value="12000" />
                  <input type="hidden" name="discount_price" value="3000" />

                  <li class="text-left">결제 금액 <span>￦9500</span></li>
                  <li class="text-left">배송비 <span>￦2500</span></li>
                  <li class="text-left" style="font-size: 28px">
                    합계
                    <span style="font-size: 28px; color: #dd2222">￦12000</span>
                  </li>
                </ul>
                <button type="submit" class="primary-btn">주문하기</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </section>
    <!-- Shoping Cart Section End -->
  </body>
</html>
