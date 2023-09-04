<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/css/list.css" />
  </head>
  <body>
    <form method="post" action="#">
      <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">핫딜목록</p>
        <div class="div-sib textsize-1">
          <form action="${contextPath}/seller/hotdeal/sellerHotDealList.do">
            <select name="hotdeal_search_type">
              <option value="">전체</option>
              <option value="creDate">등록일</option>
              <option value="name">핫딜상품명</option>
            </select>
            <input
              type="text"
              name="hotdeal_search_word"
              placeholder="search.."
            />
            <button
              class="btn-1 bg-lightgreen textcolor-white border-0"
              type="button"
            >
              검색
            </button>
          </form>
        </div>
      </div>
      <table border="0" class="textcolor-black textsize-1">
        <tr>
          <th>핫딜번호</th>
          <th>핫딜등록일</th>
          <th>핫딜상품명</th>
          <th style="text-align: right">수정</th>
          <th style="text-align: right">삭제</th>
        </tr>
        <c:forEach var="hotdeal" items="${HotdealList}">
          <c:choose>
            <c:when test="${hotdeal.hotdealNo != preHotdealNo}">
              <tr>
                <td>${hotdeal.hotdealNo}</td>
                <td>${hotdeal.creDate}</td>
                <td>${hotdeal.name}</td>
                <td style="text-align: right">
                  <a
                    href="${contextPath}/seller/hotdeal/sellerHotDealModForm.do"
                    >수정</a
                  >
                </td>
                <td style="text-align: right">
                  <a
                    href="javascript:void(0)"
                    onclick='fn_openalert("핫딜을 삭제하시겠습니까?","${contextPath}/seller/hotdeal/sellerHotDealList.do")'
                    >삭제</a
                  >
                </td>
              </tr>
            </c:when>
          </c:choose>
          <c:set var="prehotdealNo" value="${hotdeal.hotdealNo}" />
        </c:forEach>
      </table>

      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/seller/hotdeal/sellerHotdealList.do?&category=${category}&section=${section-1}&pageNum=1'"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/prev.png"
                  alt="prev"
                />
              </button>
            </li>
          </c:if>
          <!-- 페이징을 위한 변수. 페이지 버튼이 어디서 끝나야 하는지. -->
          <c:set var="endPage" value="1" />
          <c:if test="${not empty searchHotdealNum && searchHotdealNum>0}">
            <!-- 레시피는 한 페이지당 6개, 섹션당 60개이므로 이런 식이 된다.-->
            <c:set
              var="result"
              value="${(searchHotdealNum - (section-1)*100)/10}"
            />
            <c:set var="endPage" value="${Math.ceil(result)}" />
          </c:if>
          <c:forEach begin="1" end="${endPage}" var="i">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/seller/hotdeal/sellerHotdealList.do?category=${category}&section=${section}&pageNum=${i}'"
              >
                ${(section-1)*10+i}
              </button>
            </li>
          </c:forEach>
          <c:if test="${searchHotdealNum > (section)*100}">
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
          </c:if>
        </ul>
      </div>
    </form>
  </body>
</html>
