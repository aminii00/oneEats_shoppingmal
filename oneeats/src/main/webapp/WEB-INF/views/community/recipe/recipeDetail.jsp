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

    <style>
      .lightgreen_title {
        color: #a3d060;
        font-weight: 600;
        font-size: 22px;
      }
      .indegredient_row {
        margin-left: 12px;
        margin-right: 12px;
        width: 600px;
        border-bottom: 1px solid #b3b3b3;
        text-align: left;
      }
      .recipeDetail_grid {
        margin-left: 12px;
        margin-right: 12px;
        text-align: left;
      }
    </style>
  </head>
  <body>
    <section>
      <div class="recipeDetail_grid">
        <div class="row">
          <div class="col">
            <div class="textsize-3 text-left textbold textcolor-black">
              몽글몽글 단호박 죽
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="recipe_creDate textsize-1 text-left textcolor-black">
              2023년 3월 23일
            </div>
          </div>
        </div>

        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row recipe_main_img_row">
          <div class="col">
            <div class="recipe_main_img_wrapper">
              <img src="${contextPath}/img/recipe/1.jpg" alt="" />
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
              <div class="col">10분</div>
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
            <div class="row indegredient_rows">
              <div class="col">
                <div class="row indegredient_row">
                  <div class="col">단호박</div>
                  <div class="col">1개</div>
                </div>
                <div class="row indegredient_row">
                  <div class="col">설탕</div>
                  <div class="col">1큰술</div>
                </div>
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
              <div class="col howto_content">
                1 단호박의 속을 파냅니다. <br />
                2 설탕과 함께 끓입니다. <br />
                3 완성!
              </div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row recipe_footer">
          <div class="col-md-2"></div>
          <div class="col-md-2 writer_profile_img">
            <div class="profile_img_wrapper">
              <img src="" alt="프로필 이미지" />
            </div>
          </div>
          <div class="col-md-6">
            <div class="row text-left textsize-2 textbold writer_name">
              맛도사
            </div>
            <div class="row textsize-1 writer_description">
              여러분께 간편하고 맛있는 레시피를 알려드립니다!
            </div>
          </div>
          <div class="col-md-2"></div>
        </div>
      </div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
    </section>
  </body>
</html>
