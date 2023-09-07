<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
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
          <c:set
            var="typeListKr"
            value="${['상품명','상품번호','사업자아이디','작성자아이디','내용']}"
          />
          <c:set
            var="typeListEn"
            value="${['goodsName','goodsNo','sellerId','memberId','content']}"
          />
          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="filter_type">
              <c:forEach items="${typeListEn}" var="type" varStatus="loop">
                <c:choose>
                  <c:when test="${type==filter_type}">
                    <option value="${type}" selected>
                      ${typeListKr[loop.index]}
                    </option>
                  </c:when>
                  <c:otherwise>
                    <option value="${type}">${typeListKr[loop.index]}</option>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
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
          <div class="col-md-4">상품명</div>
          <div class="col-md-2">사업자아이디</div>
          <div class="col-md-2">작성자아이디</div>
          <div class="col-md-1">삭제</div>
        </div>
        <hr class="line-black" />

        <!--리뷰 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty reviewList}">
            <c:forEach var="review" items="${reviewList}" varStatus="loop">
              <div class="row reviewList-title">
                <div class="col-md-1">${review.reviewNo}</div>
                <div class="col-md-2">${review.goodsNo}</div>
                <div
                  class="col-md-8"
                  onClick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${review.goodsNo}'"
                >
                  <div class="row" style="border-bottom: gray">
                    <div class="col-md-6 text-left">${review.goodsName}</div>
                    <div class="col-md-3">${review.sellerId}</div>
                    <div class="col-md-3">${review.memberId}</div>
                  </div>
                  <div class="row">
                    <c:set var="temp" value="${Math.ceil(review.star)}" />
                    <div class="col text-left">
                      <c:forEach begin="1" end="${Math.floor(review.star)}"
                        >★</c:forEach
                      ><c:if test="${temp>review.star}">☆</c:if>
                      <br />
                      ${review.content}
                    </div>
                  </div>
                </div>
                <div class="col-md-1">
                  <a
                    onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/community/review/deleteReview.do?reviewNo=${review.reviewNo}');"
                  >
                    삭제
                  </a>
                </div>
              </div>
              <c:if test="${loop.index<reviewList.size()-1}">
                <hr class="line-gray" />
              </c:if>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--페이지 버튼-->
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/review/reviewList.do?section=${section-1}&pageNum=1&filter_type=${filter_type}&filter_word=${filter_word}"
                class="btn-2 btn-square bg-white btn-border"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/prev.png"
                  alt="prev"
                />
              </a>
            </li>
          </c:if>
          <c:set
            var="end"
            value="${Math.ceil((totalReviewNum - (section-1)*100) div 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/review/adminReviewList.do?section=${section}&pageNum=${i}&filter_type=${filter_type}&filter_word=${filter_word}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalReviewNum}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/review/adminReviewList.do?section=${section+1}&pageNum=1&filter_type=${filter_type}&filter_word=${filter_word}"
                class="btn-2 btn-square bg-white btn-border"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/next.png"
                  alt="next"
                />
              </a>
            </li>
          </c:if>
        </ul>
      </div>
    </section>
  </body>
</html>
