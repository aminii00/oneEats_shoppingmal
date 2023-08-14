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
  </head>
  <body>
    <div class="container-md recipe_recommand_grid">
      <div
        class="row"
        style="border-bottom: 2px solid black; text-align: center"
      >
        <div class="textcolor-black textsize-4 textbold">
          이런 레시피는 어떠세요?
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row recipe_recommand_rows">
        <div class="col recipe_recommand_col hoverexpand">
          <div class="row">
            <div class="img_wrapper">
              <img src="${contextPath}/img/recipe/1.jpg" alt="레시피 이미지" />
            </div>
          </div>
          <div class="row">
            <div class="text-left textsize-1">2023년 8월 2일</div>
          </div>
          <div class="row">
            <div class="text-left textbold textsize-2">제목1</div>
          </div>
          <div class="row">
            <div class="text-left textsize-1">
              본문1
              <br />
              본문2
            </div>
          </div>
        </div>
        <div class="col recipe_recommand_col hoverexpand">
          <div class="row">
            <div class="img_wrapper">
              <img src="${contextPath}/img/recipe/2.jpg" alt="레시피 이미지" />
            </div>
          </div>
          <div class="row">
            <div class="text-left textsize-1">2023년 8월 2일</div>
          </div>
          <div class="row">
            <div class="text-left textbold textsize-2">제목1</div>
          </div>
          <div class="row">
            <div class="text-left textsize-1">
              본문1
              <br />
              본문2
            </div>
          </div>
        </div>
        <div class="col recipe_recommand_col hoverexpand">
          <div class="row">
            <div class="img_wrapper">
              <img src="${contextPath}/img/recipe/3.jpg" alt="레시피 이미지" />
            </div>
          </div>
          <div class="row"></div>
          <div class="row">
            <div class="text-left textsize-1">2023년 8월 2일</div>
          </div>
          <div class="row">
            <div class="text-left textbold textsize-2">제목1</div>
          </div>
          <div class="row">
            <div class="text-left textsize-1">
              본문1
              <br />
              본문2
            </div>
          </div>
        </div>
      </div>
    </div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
  </body>
</html>
