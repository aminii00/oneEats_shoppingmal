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
    <script src="${contextPath}/js/community.js"></script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        전체 레시피
      </div>
      <div class="clear">&nbsp;</div>
      <div class="recipeList_grid">
        <div class="row recipe_row">
          <div
            class="col-md recipe_col hoverexpand"
            onclick="location.href='${contextPath}/community/recipe/recipeDetail.do'"
          >
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/1.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
          <div class="col-md recipe_col hoverexpand">
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/2.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>

            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
        </div>
        <!--레시피 한 줄 끝-->
        <div class="row recipe_row">
          <div class="col-md recipe_col hoverexpand">
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/3.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
          <div class="col-md recipe_col hoverexpand">
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/4.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
        </div>
        <!--레시피 한 줄 끝-->
        <div class="row recipe_row">
          <div class="col-md recipe_col hoverexpand">
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/5.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
          <div class="col-md recipe_col hoverexpand">
            <div class="row">
              <div class="col img_wrapper">
                <img
                  src="${contextPath}/img/recipe/6.jpg"
                  alt="레시피 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_creDate"
              >
                2023년 07월 12일
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-2 recipe_title"
              >
                레시피 제목1
              </div>
            </div>
            <div class="row">
              <div
                class="col text-left textcolor-black textsize-1 recipe_preview"
              >
                레시피 내용1 <br />
                레시피 내용2
              </div>
            </div>
          </div>
        </div>
        <!--레시피 한 줄 끝-->
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
