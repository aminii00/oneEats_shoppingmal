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
    <script src="${contextPath}/js/recipe.js"></script>
    <script src="${contextPath}/js/textareaToInput.js"></script>
    <script type="text/javascript">
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#recipeimg_preview").attr("src", e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
  </head>
  <body>
    <section>
      <hr class="line-black" />
      <form
        action="${contextPath}/community/recipe/modRecipe.do"
        method="post"
        enctype="multipart/form-data"
      >
        <input type="hidden" name="recipeNo" value="${recipe.recipeNo}" />
        <div class="recipeDetail_grid">
          <div class="row vertical-align">
            <div class="col-md-2 text-left textbold textsize-2 textcolor-black">
              제목
            </div>
            <div class="col-md">
              <div class="textsize-3 text-left textbold textcolor-black">
                <input
                  name="title"
                  type="text"
                  class="form-control"
                  placeholder="제목을 입력해주세요"
                  value="${recipe.title}"
                  required
                />
              </div>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row vertical-align">
            <div class="col-md-2 text-left textbold textsize-2 textcolor-black">
              카테고리
            </div>
            <div class="col-md">
              <div class="recipe_category textsize-1 text-left textcolor-black">
                <select name="category" id="">
                  <option class="none" value="none">미분류</option>
                  <option value="">10분 간단 레시피</option>
                  <option value="">영양만점 건강 레시피</option>
                </select>
              </div>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">&nbsp;</div>
          <div class="row recipe_main_img_row">
            <div class="col">
              <div class="recipe_main_img_wrapper">
                <img
                  id="recipeimg_preview"
                  src="${contextPath}/download.do?imgFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                  alt=""
                />
                <input
                  type="file"
                  name="cookingImg"
                  id=""
                  onchange="readURL(this);"
                />
                ${recipe.cookingImg}
                <input
                  type="hidden"
                  name="originalFileName"
                  value="${recipe.cookingImg}"
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
                <div class="col">
                  <input
                    type="text"
                    name="cooking_time"
                    class="form-control"
                    value="${recipe.cooking_time}"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">&nbsp;</div>
          <div class="row ingredient_grid">
            <div class="col">
              <div class="row">
                <div class="col lightgreen_title">재료</div>
              </div>
              <div class="row">
                <div class="col-md-4 vertical-align">
                  <div class="input-group">
                    <input
                      type="text"
                      name="inbun"
                      class="form-control"
                      value="${recipe.inbun}"
                    />
                    <div class="input-group-append vertical-align">
                      &nbsp;인분
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row ingredient_rows">
                <div class="col-md-11 ingredient_col">
                  <div class="row ingredient_row head_row bg-lightgreen">
                    <div class="col-md">이름</div>
                    <div class="col-md">양</div>
                    <div class="col-md-1"></div>
                  </div>
                  <c:forEach
                    items="${ingredientList}"
                    var="ingredient"
                    varStatus="loop"
                  >
                    <div class="row ingredient_row">
                      <div class="col-md">
                        <input
                          type="text"
                          name="name"
                          class="form-control"
                          placeholder="이름"
                          value="${ingredient.name}"
                        />
                      </div>
                      <div class="col-md">
                        <input
                          type="text"
                          name="qty"
                          class="form-control"
                          placeholder="양"
                          value="${ingredient.qty}"
                        />
                      </div>
                      <div class="col-md-1">
                        <c:if test="${loop.index>0}">
                          <img
                            id="minus_btn"
                            class="btn-smallsquare border"
                            src="${contextPath}/img/icon/minus.png"
                            alt="빼기 버튼"
                          />
                        </c:if>
                      </div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col" style="width: 100%; text-align: center">
              <img
                id="plus_btn"
                src="${contextPath}/img/icon/plus.png"
                alt="더하기 버튼"
                class="btn-smallsquare border"
              />
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
                <div class="col howto_form">
                  <textarea
                    class="howto_recipe form-control s_textarea"
                    rows="10"
                  >
${recipe.description}</textarea
                  >
                  <input
                    type="hidden"
                    value="${recipe.description}"
                    id="h_input"
                    name="description"
                  />
                </div>
              </div>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md">&nbsp;</div>
            <div class="col-md-4">
              <button
                class="btn-cancel"
                onclick="location.href='${contextPath}/community/recipe/recipeList.do'"
                type="reset"
              >
                취소
              </button>
              &nbsp;
              <button class="btn-write" type="submit">작성</button>
            </div>
          </div>
        </div>
      </form>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
    </section>
  </body>
</html>
