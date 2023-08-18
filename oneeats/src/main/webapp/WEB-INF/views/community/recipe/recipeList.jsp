<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>레시피 목록</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/community.js"></script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        전체 레시피
      </div>
      <div class="clear">&nbsp;</div>
      <div class="recipeList_grid">
        <c:forEach items="${recipeList}" varStatus="loop" step="2">
          <div class="row recipe_row">
            <c:set var="recipe" value="${recipeList[loop.index]}" />
            <div
              class="col-md recipe_col hoverexpand"
              onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
            >
              <div class="row">
                <div class="col img_wrapper">
                  <c:if test="${not empty recipe.cookingImg}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipe"
                      alt="레시피 이미지"
                    />
                  </c:if>
                </div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_creDate"
                >
                  ${recipe.creDate}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-2 recipe_title"
                >
                  ${recipe.title}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_preview"
                >
                  ${fn:substring(recipe.description,0,20)}
                </div>
              </div>
            </div>
            <c:set var="recipe" value="${recipeList[loop.index+1]}" />
            <div
              class="col-md recipe_col hoverexpand"
              onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
            >
              <div class="row">
                <div class="col img_wrapper">
                  <c:if test="${not empty recipe.cookingImg}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipe"
                      alt="레시피 이미지"
                    />
                  </c:if>
                </div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_creDate"
                >
                  ${recipe.creDate}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-2 recipe_title"
                >
                  ${recipe.title}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_preview"
                >
                  ${fn:substring(recipe.description,0,20)}
                </div>
              </div>
            </div>
          </div>
          <!--레시피 한 줄 끝-->
        </c:forEach>
      </div>
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
        <div style="float: right">
          <button
            class="btn-write"
            onclick="location.href='${contextPath}/community/recipe/recipeForm.do'"
          >
            레시피 작성
          </button>
        </div>
      </div>
    </section>
  </body>
</html>
