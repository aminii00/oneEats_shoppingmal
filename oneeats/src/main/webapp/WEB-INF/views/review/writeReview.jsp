<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
    <link rel="stylesheet" href="${contextPath}/css/star.css" />
    <meta charset="UTF-8" />
    <title>프로필 편집</title>
    <style>
     
      .star-rating {
        display: flex;
    font-size: 2.25rem;
    line-height: 2.5rem;
    padding: 0 0.3em;
    text-align: center;
    width: 5em;
    flex-direction: row-reverse;
    justify-content: flex-end;
      }

      .star-rating input {
        display: none;
      }

      .star-rating label {
        -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
        -webkit-text-stroke-width: 2.3px;
        -webkit-text-stroke-color: #2b2a29;
        cursor: pointer;
      }

      .star-rating :checked ~ label {
        -webkit-text-fill-color: gold;
      }

      .star-rating label:hover,
      .star-rating label:hover ~ label {
        -webkit-text-fill-color: #fff58c;
      }
    </style>
    <script>
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#review_preview").attr("src", e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
  </head>
  <body>
    <form
      action="${contextPath}/review/reviewInsert.do"
      method="post"
      enctype="multipart/form-data"
    >
      <input type="hidden" name="goodsNo" value="${order.goodsNo}" />
      <input type="hidden" name="orderNo" value="${order.orderNo}" />
      <div class="content-area">
        <div class="profile-edit-box">
          <div class="profile-edit-header">
            <span class="textsize-3 text-left textbold">리뷰작성</span>
            <hr class="line-black" />
            <br />
          </div>
          <div class="profile-edit-main">
            <div class="text-center" style="padding: 0 0 0 10px">
              <c:choose>
                <c:when test="${order.img1==null}">
                  <img
                    src="${contextPath}/img/icon/profile.png"
                    class="brd-lightgray btn-round imgsize-square2"
                    style="width: 130px; height: 130px"
                  />
                </c:when>
                <c:otherwise>
                  <img
                    src="${contextPath}/download.do?imageFileName=${order.img1}&path=goods/${order.goodsNo}"
                    style="width: 130px; height: 130px"
                    class="brd-lightgray btn-round"
                  />
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
        <div class="" style="text-align: center">
          <p class="textsize-2 textbold">
            ${memberInfo.id}님<br />
            주문하신 상품이 마음에 드셨나요?
            <br />
            <span class="textsize-1"
              >${order.name}에 대한 리뷰를 작성해주세요.</span
            >
          </p>

        <div class="star-rating space-x-4 mx-auto">
          <input
            type="radio"
            id="5-stars"
            name="star"
            value="5"
            v-model="ratings"
          />
          <label for="5-stars" class="star pr-4">★</label>
          <input
            type="radio"
            id="4-stars"
            name="star"
            value="4"
            v-model="ratings"
          />
          <label for="4-stars" class="star">★</label>
          <input
            type="radio"
            id="3-stars"
            name="star"
            value="3"
            v-model="ratings"
          />
          <label for="3-stars" class="star">★</label>
          <input
            type="radio"
            id="2-stars"
            name="star"
            value="2"
            v-model="ratings"
          />
          <label for="2-stars" class="star">★</label>
          <input
            type="radio"
            id="1-star"
            name="star"
            value="1"
            v-model="ratings"
          />
          <label for="1-star" class="star">★</label>
        </div>

        <div
          class="profile-edit-box textsize-3 textbold"
          style="text-align: left"
        >
          사진을 올려주세요.(선택)

          <img
            src="${contextPath}/img/product/review/noImage.jpg"
            class="brd-lightgray btn-round imgsize-square2"
            style="width: 110px; height: 100px"
            id="review_preview"
          />
          <input
            class="textsize-2"
            type="file"
            style="margin-top:5px;"
            name="reviewImg"
            onchange="readURL(this)"
          /><br />

          <input type="hidden" value="5" name="star" />
          <p class="textsize-1" style="text-align: left">
            상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다. 사진첨부
            시 개인정보가 노출되지 않도록 유의해주세요.
          </p>
        </div>
        <p
          class="profile-edit-box textsize-3 textbold"
          style="text-align: left; margin-top:5px;"
        >
          상세한 후기를 써주세요.
        </p>
        <textarea
          style="width: 530px; height: 400px"
          class="brd-lightgray btn-round textsize-2"
          name="content"
          value=""
          cols="30"
          rows="5"
        ></textarea>
        <br /><br /><br />
        <div style="text-align: center">
          <button
            type="reset"
            class="btn-midlong_2 textsize-1 textbold input btn-round border-0"
          >
            취소
          </button>
          <button
            type="submit"
            class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0"
          >
            저장
          </button>
        </div>
      </div>
    </form>
  </body>
</html>
