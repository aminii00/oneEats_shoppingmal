<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>헤더</title>

    <link rel="stylesheet" href="${contextPath}/css/header.css" />
    <style>
      div.row div.nice-select {
        width: 100%;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="bg-gray">
        <div style="float: right" class="textsize-1 textcolor-black">
          <c:if test="${isLogOn==true and memberInfo.type =='관리자'}">
            <a href="${contextPath}/admin/main/adminMain.do"
              >관리자메뉴&nbsp&nbsp</a
            >
          </c:if>

          <c:if test="${isLogOn==true and memberInfo.type =='사업자'}">
            <a href="${contextPath}/seller/main/sellerMain.do"
              >사업자메뉴&nbsp&nbsp</a
            >
          </c:if>
          <c:choose>
            <c:when test="${isLogOn==true and not empty memberInfo }">
              <a href="${contextPath}/member/logout.do">로그아웃</a>
              &nbsp;&nbsp;
              <a href="${contextPath}/community/notice/noticeList.do"
                >고객센터</a
              >
            </c:when>

            <c:otherwise>
              <a href="${contextPath}/member/registerTypeSelect.do">회원가입 </a
              >&nbsp; &nbsp;
              <a href="${contextPath}/member/loginForm.do">로그인</a>
              &nbsp;&nbsp;
              <a href="${contextPath}/community/notice/noticeList.do"
                >고객센터</a
              >
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <div class="col-3">
          <a href="${contextPath}/main/mainPage.do">
            <img
              src="${contextPath}/img/logo2.png"
              alt="Logo"
              style="width: 100%; height: auto"
            />
          </a>
        </div>
        <div class="col-1">&nbsp;</div>
        <div class="col-6">
          <div class="row">
            <div class="col-md">
              <form action="${contextPath}/goods/goodsList.do">
                <div class="row vertical-align">
                  <div class="col-md-2 p-0">
                    <select name="filter_type" id="">
                      <option value="all">전체</option>
                      <option value="베스트">베스트</option>
                      <option value="채소">채소</option>
                    </select>
                  </div>
                  <div class="col-md p-0">
                    <!-- Search bar content -->
                    <div class="input-group">
                      <input
                        type="text"
                        placeholder="Search..."
                        class="form-control"
                        name="filter_word"
                      />
                      <div class="input-group-append">
                        <button
                          style="background-color: #568203"
                          class="textcolor-white border-0"
                          type="submit"
                        >
                          Search
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md">
              <a href="${contextPath}/mainPage.do">Home</a>
            </div>
            <div class="col-md">
              <a href="${contextPath}/goods/goodsList.do?category=best"
                >베스트</a
              >
            </div>
            <div class="col-md">
              <a href="${contextPath}/goods/goodsList.do?category=hotdeal"
                >핫딜</a
              >
            </div>
            <div class="col-md">
              <a href="${contextPath}/community/recipe/recipeList.do">레시피</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <div class="row">
            <div class="col">
              <a href="${contextPath}/main/cart.do">
                <img
                  style="width: auto; height: 100%"
                  src="${contextPath}/img/icon/cart.png"
                  alt=""
                />
              </a>
            </div>
            <div class="col">
              <a href="${contextPath}/mypage/mypageBookmarkList.do">
                <img
                  style="width: auto; height: 100%"
                  src="${contextPath}/img/icon/bookmark.png"
                  alt=""
                />
              </a>
            </div>
            <div class="col">&nbsp;</div>
          </div>
          <div class="row">&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
