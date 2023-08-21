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
    <link rel="stylesheet" href="${contextPath}/resources/css/cyform.css" />
  </head>

  <body>
    <!-- Product Details Section Begin -->
    <section class="spad" style="padding-top: 28px !important">
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
              <section>
                <form
                  id="register-form"
                  method="post"
                  enctype="multipart/form-data"
                  action="${contextPath}/seller/goods/sellerGoodsForm.do"
                >
                  <div class="property-margin1">
                    <dl class="property-flex2" style="height: 66px">
                      <dt
                        class="property_title1 textbold"
                        style="margin-top: 16px"
                      >
                        카테고리
                      </dt>
                      <dd class="property-flex1">
                        <div style="align-content: center; margin-top: 4px">
                          <select name="select" class="opt">
                            <option value="category">
                              카테고리를 선택해주세요
                            </option>
                            <option value="vegetable">채소</option>
                            <option value="fruit">과일</option>
                            <option value="juiceAndJam">
                              못난이 주스 / 수제청
                            </option>
                            <option value="zzigae">찌개 / 탕 /찜</option>
                            <option value="meal">식사 / 안주류</option>
                            <option value="porridge">죽</option>
                            <option value="meal replacement">
                              식사 대용식
                            </option>
                            <option value="sidedish">간편 한끼 반찬</option>
                          </select>
                        </div>
                      </dd>
                    </dl>
                  </div>

                  <div class="property-margin1">
                    <dl class="property-flex2" style="height: 66px">
                      <dt
                        class="property_title1 textbold"
                        style="margin-top: 16px"
                      >
                        상품명
                      </dt>
                      <dd class="property-flex1">
                        <input
                          type="text"
                          name="name"
                          class="property-font1 nice-select"
                          style="width: 176px"
                        />
                      </dd>
                    </dl>
                  </div>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      판매가격
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="price"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      포장타입
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="rapping"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      원산지
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="manufacturer"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      무게 / 용량
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="weight"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      수확시기
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="expDate"
                        type="date"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <div class="property-flex2" style="height: 60px">
                    <div
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      상품 정보 기입
                    </div>
                  </div>
                  <p style="margin-top: 16px">
                    <textarea
                      name="description"
                      class="goodsinfo"
                      cols="50"
                      rows="8"
                      style="width: 350px"
                    ></textarea>
                  </p>
                </form>
                <div style="display: inline-block; margin: 50px 145px 0 0">
                  <button
                    class="cart-button css-cartbtn e4nu7ef3"
                    type="submit"
                    radius="3"
                    style="width: 100px"
                  >
                    <span class="btn textbold">다시 쓰기</span>
                  </button>
                </div>
                <!--중간부분-->
                <div style="display: inline-block">
                  <button
                    class="cart-button css-cartbtn e4nu7ef3"
                    type="submit"
                    radius="3"
                    style="width: 100px"
                  >
                    <span class="css-nytqmg textbold">상품 등록</span>
                  </button>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
