<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title></title>

    <style>
      .cart_remove_btn {
        width: 20px;
        height: 20px;
      }
      .qty_box {
        width: 140px;
        height: 42px;
        display: inline-block;
        position: relative;
        text-align: center;
        background: #f5f5f5;
        margin-bottom: 8px;
        align-content: center;
        align-self: center;
      }
      .qty_box input {
        height: 100%;
        width: 100%;
        font-size: 16px;
        color: #6f6f6f;
        width: 50px;
        border: none;
        background: #f5f5f5;
        text-align: center;
      }

      .qty_box .qtybtn {
        width: 35px;
        font-size: 16px;
        color: #6f6f6f;
        cursor: pointer;
        display: inline-block;
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
      
      optionNo : 선택한 옵션.
      여러 개.

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
                      <th id="cart_all_check_th">
                        <input
                          class="form-check-input"
                          type="checkbox"
                          id="cart_all_checkbox"
                          checked
                        />
                        선택
                      </th>
                      <th class="shoping__product">상품명</th>
                      <th>원가</th>
                      <th>할인가격</th>
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
                            value="${payment_price + cart.goodsPrice * cart.optionQty * cart.goodsQty}"
                          />
                          <c:set
                            var="discount_price"
                            value="${discount_price + cart.discountPrice}"
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

                            <!-- form에는 들어가지 않는 참조용 input들 -->
                            <input
                              class="h_row_goods_price"
                              type="hidden"
                              value="${cart.goodsPrice}"
                            />
                            <input
                              class="h_row_option_price"
                              type="hidden"
                              value="${cart.optionPrice}"
                            />
                            <input
                              class="h_row_option_qty"
                              type="hidden"
                              value="${cart.optionQty}"
                            />
                            <input
                              class="h_row_discount_price"
                              type="hidden"
                              value="${cart.discountPrice}"
                            />
                            <input
                              type="hidden"
                              class="h_row_option_discount"
                              value="${cart.goodsPrice * cart.optionQty - cart.optionPrice}"
                            />
                            <input
                              class="h_row_payment_price"
                              type="hidden"
                              value="${cart.goodsPrice * cart.optionQty * cart.goodsQty}"
                            />
                            <input
                              class="h_row_total_price"
                              type="hidden"
                              value="${cart.optionPrice * cart.goodsQty}"
                            />
                            <td>
                              <input
                                type="checkbox"
                                class="cart_checkbox form-check-input"
                                checked
                              />
                            </td>
                            <td class="vertical-align">
                              <img
                                src="${contextPath}/download.do?imageFileName=${cart.goodsImg}&path=goodsNo${cart.goodsNo}"
                                width="100px"
                                height="100px"
                                alt=""
                              />
                              &nbsp; &nbsp;
                              <h5>${cart.optionName}</h5>
                            </td>
                            <td>
                              ￦<span class="row_payment_price">
                                ${cart.goodsPrice * cart.optionQty *
                                cart.goodsQty}
                              </span>
                            </td>

                            <td>
                              ￦<span class="row_discount_price"
                                >${cart.discountPrice}</span
                              >
                            </td>
                            <td>
                              <div class="quantity">
                                <div class="qty_box">
                                  <a class="goods_option_minus_btn">-</a>
                                  <input
                                    type="text"
                                    value="${cart.goodsQty}"
                                    name="goodsQty"
                                    class="goodsQty_input"
                                  />
                                  <a class="goods_option_plus_btn">+</a>
                                </div>
                              </div>
                            </td>
                            <td>
                              ￦<span class="row_total_price"
                                >${cart.optionPrice * cart.goodsQty}</span
                              >
                            </td>
                            <td>
                              <img
                                class="cart_remove_btn"
                                src="${contextPath}/img/cart/close.png"
                                alt=""
                              />
                            </td>
                          </tr>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <tr class="cart_goods_row">
                          <td colspan="6">카트에 담긴 상품이 없습니다.</td>
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
                  <input
                    class="h_shippingFee"
                    type="hidden"
                    name="shippingFee"
                    value="${shippingFee}"
                  />
                  <input
                    class="h_payment_price"
                    type="hidden"
                    name="payment_price"
                    value="${payment_price}"
                  />
                  <input
                    class="h_discount_price"
                    type="hidden"
                    name="discount_price"
                    value="${discount_price}"
                  />
                  <li class="text-left">
                    총 상품 금액
                    <span
                      >￦<span class="payment_price_text"
                        >${payment_price}</span
                      ></span
                    >
                  </li>
                  <li class="text-left">
                    할인 금액
                    <span
                      >￦<span class="discount_price_text"
                        >${discount_price}</span
                      ></span
                    >
                  </li>
                  <li class="text-left">
                    결제 금액
                    <span
                      >￦<span class="noshipping_price_text"
                        >${payment_price-discount_price}</span
                      ></span
                    >
                  </li>
                  <li class="text-left">
                    배송비
                    <span
                      >￦<span class="shippingFee_text"
                        >${shippingFee}</span
                      ></span
                    >
                  </li>
                  <li class="text-left" style="font-size: 28px">
                    합계
                    <span style="font-size: 28px; color: #dd2222"
                      >￦<span
                        class="total_price_text"
                        style="font-size: 28px; color: #dd2222"
                        >${payment_price-discount_price+shippingFee}</span
                      ></span
                    >
                  </li>
                </ul>
                <button
                  type="submit"
                  class="bg-lightgreen textcolor-white textsize-2 btn-long border-0"
                >
                  주문하기
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </section>
    <!-- Shoping Cart Section End -->

    <script>
      var removeValUrl = "${contextPath}/removeCartItem.do";

      var shippingFee = parseInt("${shippingFee}");
      var payment_price = parseInt("${payment_price}");
      var discount_price = parseInt("${discount_price}");
      var noshipping_price = "${payment_price-discount_price}";
      var total_price = "${payment_price-discount_price+shippingFee}";
    </script>
    <script src="${contextPath}/js/cart.js"></script>
  </body>
</html>
