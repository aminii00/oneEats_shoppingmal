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
        width: 9em;
        justify-content: center;
      }

      .star-rating input {
        display: none;
      }

      .review-star {
        color: gold;
      }

      span.review-star-0 {
        width: 2em;
      }
      span.review-star-6 {
        width: 2em;
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

    <script>
      $(document).ready(function () {
        $(".review-star-0").click(function () {
          fn_changeEachReviewStar(0);
          $(".h_star_rating").val(0);
        });
        $(".review-star-6").click(function () {
          fn_changeEachReviewStar(6);
          $(".h_star_rating").val(5);
        });

        $(".review-star").click(function (event) {
          var element = $(this);
          var elementOffset = element.offset();
          var elementWidth = element.width();
          var clickX = event.pageX - elementOffset.left;
          var star = parseInt(element.attr("star"));
          if (clickX < elementWidth / 2) {
            var curStar = parseFloat($(".h_star_rating").val());
            if (curStar == 0.5 && star == 1) {
              star = 0;
              fn_changeEachReviewStar(star);
              $(".h_star_rating").val(0);
            } else {
              $(this).removeClass("bi-star");
              $(this).removeClass("bi-star-fill");
              $(this).addClass("bi-star-half");
              fn_changeEachReviewStar(star);
              $(".h_star_rating").val(star - 0.5);
            }
          } else {
            $(this).removeClass("bi-star");
            $(this).removeClass("bi-star-half");
            $(this).addClass("bi-star-fill");
            fn_changeEachReviewStar(star);
            $(".h_star_rating").val(star);
          }
        });
      });

      function fn_changeEachReviewStar(currentStar) {
        $(".review-star").each(function () {
          var starRating = parseInt($(this).attr("star"));
          if (starRating < currentStar) {
            $(this).removeClass("bi-star");
            $(this).removeClass("bi-star-half");
            $(this).addClass("bi-star-fill");
          } else if (starRating > currentStar) {
            $(this).removeClass("bi-star-fill");
            $(this).removeClass("bi-star-half");
            $(this).addClass("bi-star");
          }
        });
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
            <span class="review-star-0">&nbsp;</span>
            <i class="bi bi-star review-star" star="1"></i>
            <i class="bi bi-star review-star" star="2"></i>
            <i class="bi bi-star review-star" star="3"></i>
            <i class="bi bi-star review-star" star="4"></i>
            <i class="bi bi-star review-star" star="5"></i>
            <span class="review-star-6">&nbsp;</span>
          </div>
          <input type="hidden" class="h_star_rating" name="star" value="0" />
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
              style="margin-top: 5px"
              name="reviewImg"
              onchange="readURL(this)"
            /><br />

            <input type="hidden" value="5" name="star" />
            <p class="textsize-1" style="text-align: left">
              상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다.
              사진첨부 시 개인정보가 노출되지 않도록 유의해주세요.
            </p>
          </div>
          <p
            class="profile-edit-box textsize-3 textbold"
            style="text-align: left; margin-top: 5px"
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
      </div>
    </form>
  </body>
</html>
