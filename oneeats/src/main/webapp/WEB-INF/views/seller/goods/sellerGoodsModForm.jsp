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
    <link href="${contextPath}/css/cyform.css" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/community.js"></script>

    <style>
      .property_title1 {
        width: 200px;
        height: 100%;
        color: #666;
        font-weight: 400;
        line-height: 19px;
      }
      .property-flex1 {
        display: flex;
        flex: 1 1 0%;
        flex-direction: column;
      }
      .property-font1 {
        color: #333;
        font-weight: 400;
        line-height: 19px;
        white-space: pre-line;
        word-break: break-all;
        /* overflow: hidden;*/
      }
      .property-margin1 {
        border-bottom: 1px solid #f4f4f4;
      }
      .property-flex2 {
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
        /*overflow: hidden;*/
        width: 100%;
        padding: 17px 0 18px;
        border-top: 1px solid #f4f4f4;
        font-size: 14px;
        letter-spacing: -0.5px;
      }
      .property_title1 {
        width: 200px;
        height: 100%;
        color: #666;
        font-weight: 400;
        line-height: 19px;
      }
      .property-flex1 {
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
      *,
      :after,
      :before {
        box-sizing: border-box;
        margin: 0;
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
      .option {
        padding: 4px;
        font-size: 14px;
        color: #fff;
      }
      .css-cartbtn {
        display: block;
        padding: 0 10px;
        text-align: center;
        /* overflow: hidden;*/
        width: 100%;
        height: 56px;
        border-radius: 3px;
        color: #fff;
        background-color: #a3d060;
        border: 0 none;
      }
      .goodsinfo {
        -webkit-tap-highlight-color: transparent;
        background-color: #fff;
        border-radius: 5px;
        border: solid 1px #e8e8e8;
        box-sizing: border-box;
        clear: both;
        cursor: pointer;
        display: block;
        float: left;
        font-family: inherit;
        font-size: 14px;
        font-weight: normal;

        outline: none;
        padding-left: 18px;
        padding-right: 30px;
        position: relative;
        text-align: left !important;
        -webkit-transition: all 0.2s ease-in-out;
        transition: all 0.2s ease-in-out;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
    </style>
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
                          <option value="채소">채소</option>
                          <option value="과일">과일</option>
                          <option value=" 못난이 주스 / 수제청">
                            못난이 주스 / 수제청
                          </option>
                          <option value="찌개 / 탕 /찜">찌개 / 탕 /찜</option>
                          <option value="식사 / 안주류">식사 / 안주류</option>
                          <option value="죽">죽</option>
                          <option value="식사 대용식">식사 대용식</option>
                          <option value="간편 한끼 반찬">간편 한끼 반찬</option>
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
                        name="name"
                        value="${goods.name}"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>
                </div>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    판매가격
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="price"
                      value="${goods.price}"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    판매자
                  </dt>
                  <dd class="property-flex1">
                    <input
                      value="김판매"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    포장타입
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="rapping"
                      value="${goods.rapping}"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    원산지
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="manufacturer"
                      value="${goods.manufacturer}"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    무게 / 용량
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="weight"
                      value="${goods.weight}"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    수확시기
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="${goods.harvest}"
                      type="text"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>
                <div class="row ingredient_grid">
                  <div class="col">
                    <div class="row">&nbsp;</div>
                    <div class="row ingredient_rows">
                      <div class="col-md-11 ingredient_col">
                        <div class="row ingredient_row head_row bg-lightgreen">
                          <div class="col-md">옵션의 이름</div>
                          <div class="col-md">옵션의 양</div>

                          <div class="col-md">가격</div>
                          <div class="col-md-1"></div>
                        </div>
                        <c:forEach items="${option}" var="goodsOption">
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="${goodsOption.name}"
                                class="form-control"
                                placeholder="상품명"
                                required
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="${goodsOption.option_qty}"
                                class="form-control"
                                placeholder="양"
                                required
                              />
                            </div>
                            <input type="hidden" name="optionNo" />

                            <div class="col-md">
                              <input
                                type="text"
                                name="${goodsOption.price}"
                                class="form-control"
                                placeholder="가격"
                                required
                              />
                            </div>
                            <div class="col-md-1"></div>
                          </div>
                        </c:forEach>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div
                    class="col-md-11"
                    style="width: 100%; text-align: center"
                  >
                    <img
                      id="plus_btn"
                      src="${contextPath}/img/icon/plus.png"
                      alt="더하기 버튼"
                      class="btn-smallsquare border"
                    />
                  </div>
                </div>
                <div class="row"></div>
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
                  >
                  일반 시중에서는 찾기 힘든 귀한 품종의 천도 복숭아입니다. 당도 측정시, 평균 14브릭스 이상 고당도의 천도 복숭아랍니다.
                  한번 맛보신 분들은 계속 찾아주시는 김판매 입니다.</textarea
                  >
                </p>

                <div style="display: inline-block; margin: 50px 145px 0 0">
                  <button
                    class="cart-button css-cartbtn e4nu7ef3"
                    type="submit"
                    radius="3"
                    style="width: 100px"
                  >
                    <span class="css-nytqmg textbold">다시 쓰기</span>
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
                    <span class="css-nytqmg textbold">상품 수정</span>
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
