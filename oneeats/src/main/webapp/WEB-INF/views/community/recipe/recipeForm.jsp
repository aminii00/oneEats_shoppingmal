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
      <form action="" method="post" enctype="multipart/form-data">
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
                  <option value="none">미분류</option>
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
                <img id="recipeimg_preview" src="" alt="" />
                <input
                  type="file"
                  name="cookingImg"
                  id=""
                  onchange="readURL(this);"
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
                  <input type="text" name="cooking_time" class="form-control" />
                </div>
              </div>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">&nbsp;</div>
          <div class="row indegredient_grid">
            <div class="col">
              <div class="row">
                <div class="col lightgreen_title">재료</div>
              </div>
              <div class="row">
                <div class="col-md-4 vertical-align">
                  <div class="input-group">
                    <input type="text" name="inbun" class="form-control" />
                    <div class="input-group-append vertical-align">
                      &nbsp;인분
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row indegredient_rows">
                <div class="col-md-11 indegredient_col">
                  <div class="row indegredient_row head_row bg-lightgreen">
                    <div class="col-md">이름</div>
                    <div class="col-md">양</div>
                    <div class="col-md-1"></div>
                  </div>
                  <div class="row indegredient_row">
                    <div class="col-md">
                      <input
                        type="text"
                        name="name"
                        class="form-control"
                        placeholder="이름"
                        required
                      />
                    </div>
                    <div class="col-md">
                      <input
                        type="text"
                        name="qty"
                        class="form-control"
                        placeholder="양"
                        required
                      />
                    </div>
                    <div class="col-md-1"></div>
                  </div>
                  <div class="row indegredient_row">
                    <div class="col-md">
                      <input
                        type="text"
                        name="name"
                        class="form-control"
                        placeholder="이름"
                      />
                    </div>
                    <div class="col-md">
                      <input
                        type="text"
                        name="qty"
                        class="form-control"
                        placeholder="양"
                      />
                    </div>
                    <div class="col-md-1">
                      <img
                        id="minus_btn"
                        class="btn-smallsquare border"
                        src="${contextPath}/img/icon/minus.png"
                        alt="빼기 버튼"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-11" style="width: 100%; text-align: center">
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
                    class="howto_recipe form-control"
                    name="description"
                    id=""
                    rows="10"
                    placeholder="입력..."
                  ></textarea>
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
