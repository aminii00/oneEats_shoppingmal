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
    <title>레시피 목록</title>

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="row vertical-align">
        <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
          레시피
        </div>
        <div class="col-md"></div>

        <form action="">
          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="filter_type">
              <option value="title">제목</option>
              <option value="memberId">작성자아이디</option>
              <option value="ingredient">재료</option>
              <option value="description">내용</option>
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
        </form>
      </div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="recipeList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-1">번호</div>
          <div class="col-md">제목</div>
          <div class="col-md-2">작성자id</div>
          <div class="col-md-2">작성일</div>
          <div class="col-md-1">삭제</div>
        </div>
        <hr class="line-black" />
        <div class="row recipeList-title">
          <div class="col-md-1">120</div>
          <div class="col-md text-left">단호박죽</div>
          <div class="col-md-2">qwer</div>
          <div class="col-md-2">2023/08/11</div>
          <div class="col-md-1">
            <a
              onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/communtiy/recipe/deleteRecipe.do?recipeNo=120');"
            >
              삭제
            </a>
          </div>
        </div>
        <hr class="line-gray" />

        <div class="row recipeList-title">
          <div class="col-md-1">121</div>
          <div class="col-md text-left">단호박죽</div>
          <div class="col-md-2">qwer</div>
          <div class="col-md-2">2023/08/11</div>
          <div class="col-md-1">
            <a
              onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/communtiy/recipe/deleteRecipe.do?recipeNo=123');"
            >
              삭제
            </a>
          </div>
        </div>

        <!--레시피 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty recipeList}">
            <c:forEach var="recipe" items="${recipeList}">
              <hr class="line-gray" />
              <div class="row recipeList-title">
                <div class="col-md-1">${recipe.recipeNo}</div>
                <div class="col-md text-left">${recipe.title}</div>
                <div class="col-md-2">${recipe.memberId}</div>
                <div class="col-md-2">${recipe.creDate}</div>

                <div class="col-md-1">
                  <a
                    onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/communtiy/recipe/deleteRecipe.do?recipeNo=${recipe.recipeNo}');"
                  >
                    삭제
                  </a>
                </div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--작성 버튼-->
      <div class="row">
        <div class="col">
          <div style="float: right">
            <button
              class="btn-toform"
              onclick="location.href='${contextPath}/community/recipe/recipeForm.do'"
            >
              작성
            </button>
          </div>
        </div>
      </div>

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
