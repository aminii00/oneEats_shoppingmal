<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>리뷰 목록</title>

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <form action="">
        <div class="row vertical-align">
          <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
            리뷰
          </div>
          <div class="col-md"></div>
          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="filter_type">
              <option value="goodsName">상품명</option>
              <option value="goodsNo">상품번호</option>
              <option value="memberId">작성자아이디</option>
              <option value="content">내용</option>
            </select>
          </div>
          <div class="col-md-4 p-0">
            <div class="input-group">
              <input type="text" name="filter_word" class="form-control" />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen textcolor-white border-0 textsize-2"
                  style="width: 60px"
                  type="submit"
                >
                  검색
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="reviewList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-1">번호</div>
          <div class="col-md-2">상품번호</div>
          <div class="col-md-6">상품명</div>
          <div class="col-md-2">작성자아이디</div>
          <div class="col-md-1">삭제</div>
        </div>
        <hr class="line-black" />
        <div class="row reviewList-title">
          <div class="col-md-1">121</div>
          <div class="col-md-2">48</div>
          <div
            class="col-md-8"
            onClick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=48'"
          >
            <div class="row">
              <div class="col-md-9 text-left">못난이 복숭아</div>
              <div class="col-md-3">hanyeji</div>
            </div>
            <div class="row">
              <div class="col text-left">
                ★★★★☆ <br />
                생긴 것과 다르게 아주 맛있습니다.
              </div>
            </div>
          </div>
          <div class="col-md-1">
            <a
              onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/seller/communtiy/review/deleteReview.do?reviewNo=121');"
              >삭제</a
            >
          </div>
        </div>
        <hr class="line-gray" />

        <div class="row reviewList-title">
          <div class="col-md-1">122</div>
          <div class="col-md-2">48</div>
          <div
            class="col-md-8"
            onClick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=48'"
          >
            <div class="row">
              <div class="col-md-9 text-left">못난이 복숭아</div>
              <div class="col-md-3">hanyeji</div>
            </div>
            <div class="row">
              <div class="col text-left">
                ★★★★☆ <br />
                생긴 것과 다르게 아주 맛있습니다.
              </div>
            </div>
          </div>
          <div class="col-md-1">
            <a
              onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/seller/communtiy/review/deleteReview.do?reviewNo=121');"
              >삭제</a
            >
          </div>
        </div>

        <!--리뷰 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty reviewList}">
            <c:forEach var="review" items="${reviewList}">
              <hr class="line-gray" />
              <div class="row reviewList-title">
                <div class="col-md-1">${review.reviewNo}</div>
                <div class="col-md-2">${review.goodsNo}</div>
                <div
                  class="col-md-8"
                  onClick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${review.goodsNo}'"
                >
                  <div class="row" style="border-bottom: gray">
                    <div class="col-md-9 text-left">${review.goodsName}</div>
                    <div class="col-md-3">${review.memberId}</div>
                  </div>
                  <div class="row">
                    <div class="col text-left">
                      ${review.star} <br />
                      ${review.content}
                    </div>
                  </div>
                </div>
                <div class="col-md-1">
                  <a
                    onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/seller/communtiy/review/deleteReview.do?reviewNo=${review.reviewNo}');"
                    >삭제</a
                  >
                </div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--페이지 버튼-->
      <div>
        <ul class="ul-li">
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">1</button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </button>
          </li>
        </ul>
      </div>
    </section>
  </body>
</html>
