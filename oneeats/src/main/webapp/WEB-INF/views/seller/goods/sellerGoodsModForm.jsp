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
        /* overflow: hidden;*/
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
        /*overflow: hidden;*/
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
                <div class="css-2lvxh7">
                  <dl class="css-e6zlnr" style="height: 66px">
                    <dt class="css-lytdfk textbold" style="margin-top: 16px">
                      카테고리
                    </dt>
                    <dd class="css-1k8t52o">
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

                <div class="css-2lvxh7">
                  <dl class="css-e6zlnr" style="height: 66px">
                    <dt class="css-lytdfk textbold" style="margin-top: 16px">
                      상품명
                    </dt>
                    <dd class="css-1k8t52o">
                      <input
                        name="name"
                        value="못난이 복숭아"
                        class="css-c02hqi nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>
                </div>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    판매가격
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      name="price"
                      value="3000"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    판매자
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      value="김판매"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    포장타입
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      name="rapping"
                      value="박스 포장"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    원산지
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      name="manufacturer"
                      value="조치원"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    무게 / 용량
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      name="weight"
                      value="800"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <dl class="css-e6zlnr" style="height: 60px">
                  <dt class="css-lytdfk textbold" style="margin-top: 16px">
                    유통기한
                  </dt>
                  <dd class="css-1k8t52o">
                    <input
                      name="expDate"
                      type="date"
                      class="css-c02hqi nice-select"
                      style="width: 176px"
                    />
                  </dd>
                </dl>

                <div class="css-e6zlnr" style="height: 60px">
                  <div class="css-lytdfk textbold" style="margin-top: 16px">
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
