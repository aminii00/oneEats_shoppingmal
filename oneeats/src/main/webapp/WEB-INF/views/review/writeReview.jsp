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
      .myform fieldset {
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0; /* 필드셋 테두리 제거 */
      }
      .myform input[type="radio"] {
        display: none; /* 라디오박스 감춤 */
      }
      .myform label {
        font-size: 2em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 yellow; /* 새 이모지 색상 부여 */
      }
      .myform label:hover {
        text-shadow: 0 0 0 yellow; /* 마우스 호버 */
      }
      .myform label:hover ~ label {
        text-shadow: 0 0 0 yellow; /* 마우스 호버 뒤에오는 이모지들 */
      }
      .myform fieldset {
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
      }
      .myform fieldset legend {
        text-align: left;
      }
      .myform input[type="radio"]:checked + label {
        text-shadow: 0 0 0 orange; /* 마우스 클릭 체크 */
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
                <c:when test="${goods.img1==null}">
                  <img
                    src="${contextPath}/img/icon/profile.png"
                    class="brd-lightgray btn-round imgsize-square2"
                    style="width: 130px; height: 130px"
                  />
                </c:when>
                <c:otherwise>
                  <img
                    src="${contextPath}/download.do?imageFileName=${goods.img1}&path=goodsNo${goods.goodsNo}"
                    style="width: 130px; height: 130px"
                    class="brd-lightgray btn-round"
                  />
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
        <div class="" style="text-align: center; padding: 15px 90px 0 0">
          <p class="textsize-2 textbold">
            ${memberInfo.id}님<br />
            주문하신 상품이 마음에 드셨나요?
          </p>
          <p class="textsize-1">${order.name}에 대한 리뷰를 작성해주세요.</p>

          <fieldset class="myform">
            <legend class="textsize-1">별점을 선택해주세요</legend>
            <input type="radio" name="star" value="1" id="rate1" /><label
              for="rate1"
              >⭐</label
            >
            <input type="radio" name="star" value="2" id="rate2" /><label
              for="rate2"
              >⭐</label
            >
            <input type="radio" name="star" value="3" id="rate3" /><label
              for="rate3"
              >⭐</label
            >
            <input type="radio" name="star" value="4" id="rate4" /><label
              for="rate4"
              >⭐</label
            >
            <input type="radio" name="star" value="5" id="rate5" /><label
              for="rate5"
              >⭐</label
            >
          </fieldset>
        </div>

        <br />
        <br />
        <br />

        <p class="textsize-3 textbold" style="text-align: left">
          사진을 올려주세요.(선택)
        </p>

        <img
          src="${contextPath}/img/product/review/noImage.jpg"
          class="brd-lightgray btn-round imgsize-square2"
          style="width: 110px; height: 100px"
          id="review_preview"
        />
        <input type="file" name="reviewImg" onchange="readURL(this)" /><br />

        <input type="hidden" value="5" name="star" />

        <br />
        <p class="textsize-1" style="text-align: left">
          상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다. 사진첨부
          시 개인정보가 노출되지 않도록 유의해주세요.
        </p>
        <br />
        <p class="textsize-3 textbold" style="text-align: left">
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
