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
            <div class="col-lg-6 col-md-6 text-left">
              <div class="product__details__text">
                <section>
                  <input name="type" type="hidden" value="사업자" />

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
                          <select name="category" class="opt">
                            <option value="category">
                              카테고리를 선택해주세요
                            </option>
                            <option value="채소">채소</option>
                            <option value="과일">과일</option>
                            <option value="주스 / 잼">
                              못난이주스/수제청
                            </option>
                            <option value="찌개/탕/찜">
                              찌개 / 탕 /찜
                            </option>
                            <option value="식사/안주류">식사/안주류</option>
                            <option value="죽">죽</option>
                            <option value="식사 대용식">식사 대용식</option>
                            <option value="간편 한끼 반찬">
                              간편 한끼 반찬
                            </option>
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
                          name="goodsname"
                          readonly
                          value="${goods.name}"
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
                        readonly
                        value="${goods.price}"
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
                      판매자
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        value="${memberInfo.name}"
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
                        readonly
                        name="rapping"
                        value="${goods.rapping}"
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
                        readonly
                        name="manufacturer"
                        value="${goods.manufacturer}"
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
                        readonly
                        name="weight"
                        value="${goods.weight}"
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
                        readonly
                        value="${goods.harvest}"
                        type="text"
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
                      핫딜 종료일
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="finishDate"
                        value="${hotdeal.finishDate}"
                        class="property-font1 nice-select"
                        style="width: 176px"
                        type="datel"
                      />
                    </dd>
                  </dl>
                  <div class="row ingredient_grid">
                    <div class="col">
                      <div class="row">&nbsp;</div>
                      <div class="row ingredient_rows">
                        <div class="col-md-11 ingredient_col">
                          <div
                            class="row ingredient_row head_row bg-lightgreen"
                          >
                            <div class="col-md">핫딜 상품명</div>
                            <div class="col-md">핫딜 수량</div>

                            <div class="col-md">할인가격</div>
                            <div class="col-md-1"></div>
                          </div>
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="name"
                                value="${hotdeal.name}"
                                class="form-control"
                                placeholder=" 상품명"
                                required
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="goods_qty"
                                value="${hotdeal.goods_qty}"
                                class="form-control"
                                placeholder="숫자만 입력해주세요"
                                required
                              />
                            </div>
                            <input type="hidden" name="optionNo" />

                            <div class="col-md">
                              <input
                                type="text"
                                name="discounted_price"
                                value="${hotdeal.discounted_price}"
                                class="form-control"
                                placeholder="가격"
                                required
                              />
                            </div>
                            <div class="col-md-1"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="property-flex2" style="height: 60px">
                    <div
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      핫딜 정보 기입
                    </div>
                  </div>
                  <p style="margin-top: 16px">
                    <textarea
                      class="goodsinfo description_textarea"
                      cols="50"
                      rows="8"
                      style="width: 350px"
                    ></textarea>

                    <input
                      type="hidden"
                      name="description"
                      id="goods_description"
                      value="${hotdeal.description}"
                    />
                  </p>

                  <div style="display: inline-block; margin: 50px 145px 0 0">
                    <button
                      class="cart-button css-cartbtn e4nu7ef3"
                      type="reset"
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
                      <span class="css-nytqmg textbold">핫딜 수정</span>
                    </button>
                  </div>
                </section>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-left">
            <div class="product__details__text">
              <section>
                <div class="property-margin1">
                  <dl class="property-flex2" style="height: 66px">
                    <dt class="property_title1 textbold" style="margin-top: 16px">
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
                          <option value="meal replacement">식사 대용식</option>
                          <option value="sidedish">간편 한끼 반찬</option>
                        </select>
                      </div>
                    </dd>
                  </dl>
                </div>

                <div class="property-margin1">
                  <dl class="property-flex2" style="height: 66px">
                    <dt class="property_title1 textbold" style="margin-top: 16px">
                      상품명
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="name"
                        value="못난이 복숭아"
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
                      value="7000"
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
                      value="박스 포장"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    수확 시기
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="manufacturer"
                      value="조치원"
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
                      value="800"
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
                      name="expDate"
                      type="date"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    핫딜 상품명
                  </dt>
                  <dd class="property-flex1">
                    <input
                      value="못난이 복숭아 마지막 특가!!"
                      name="name"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    할인가
                  </dt>
                  <dd class="property-flex1">
                    <input
                      value="3900"
                      name="discounted_price"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    수량
                  </dt>
                  <dd class="property-flex1">
                    <input
                      value="1"
                      name="goods_qty"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="property-flex2" style="height: 60px">
                  <dt class="property_title1 textbold" style="margin-top: 16px">
                    핫딜 종료일
                  </dt>
                  <dd class="property-flex1">
                    <input
                      name="finishDate"
                      type="date"
                      class="property-font1 nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <div class="property-flex2" style="height: 60px">
                  <div class="property_title1 textbold" style="margin-top: 16px">
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
[여름 시즌 핫딜]
                  못난이 복숭아 마지막 특가 할인합니다.
                  맛도 좋고 피부에도 좋은 복숭아 얼른 먹어보세요~!!</textarea
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
                    <span class="css-nytqmg textbold">핫딜 수정</span>
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
