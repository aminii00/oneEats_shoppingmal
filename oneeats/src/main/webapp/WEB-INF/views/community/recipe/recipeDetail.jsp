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
    <title>레시피 상세</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/recipe.js"></script>
  </head>
  <body>
    ${result}
    <section>
      <div class="recipeDetail_grid">
        <div class="row">
          <div class="col">
            <div class="textsize-3 text-left textbold textcolor-black">
              ${recipe.title}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="recipe_creDate textsize-1 text-left textcolor-black">
              ${recipe.creDate}
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <button
              class="btn-remove"
              style="float: right"
              onclick="fn_openalert('레시피를 삭제하시겠습니까?','${contextPath}/community/recipe/deleteRecipe.do?recipeNo=${recipe.recipeNo}')"
            >
              삭제
            </button>
            <button
              class="btn-modify"
              style="float: right"
              onclick="location.href='${contextPath}/community/recipe/recipeModForm.do?recipeNo=${recipe.recipeNo}'"
            >
              수정
            </button>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row recipe_main_img_row">
          <div class="col">
            <div class="recipe_main_img_wrapper">
              <img
                src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                alt="레시피 메인 이미지"
              />
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">소요시간</div>
            </div>
            <div class="row">
              <div class="col">${recipe.cooking_time}</div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row ingredient_grid">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">재료(${recipe.inbun}인분)</div>
            </div>
            <div class="row ingredient_rows">
              <div class="col">
                <c:forEach items="${ingredientList}" var="ingredient">
                  <div class="row ingredient_row">
                    <div class="col">${ingredient.name}</div>
                    <div class="col">${ingredient.qty}</div>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row howto_row">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">만드는 법</div>
            </div>
            <div class="row">
              <div class="col howto_content">${recipe.description}</div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row recipe_footer">
          <div class="col-md-2"></div>
          <div class="col-md-2 writer_profile_img">
            <div class="profile_img_wrapper">
              <img
                class="imgsize-square1"
                src="${contextPath}/download.do?imageFileName=${writer.profileImg}&path=member/${writer.memberNo}"
                alt="프로필 이미지"
              />
            </div>
          </div>
          <div class="col-md-6">
            <div class="row text-left textsize-2 textbold writer_name">
              ${writer.name}
            </div>
            <div class="row textsize-1 writer_description">${writer.intro}</div>
          </div>
          <div class="col-md-2"></div>
        </div>
      </div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
    </section>
  </body>
</html>
