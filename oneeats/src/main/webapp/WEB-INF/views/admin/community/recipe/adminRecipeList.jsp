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
      <form
        action="${contextPath}/admin/community/recipe/adminRecipeList.do"
        method="post"
      >
        <div class="row vertical-align">
          <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
            레시피
          </div>
          <div class="col-md"></div>

          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="recipe_search_type">
              <option value="all">전체</option>
              <option value="title">제목</option>
              <option value="memberId">작성자아이디</option>
              <option value="ingredient">재료</option>
              <option value="description">내용</option>
            </select>
          </div>
          <div class="col-md-4 p-0">
            <div class="input-group">
              <input
                type="text"
                name="recipe_search_word"
                class="form-control"
              />
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
        </div>
      </form>
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

        <!--레시피 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty recipeList}">
            <c:forEach var="recipe" items="${recipeList}">
              <div class="row recipeList-title">
                <div class="col-md-1">${recipe.recipeNo}</div>
                <div class="col-md text-left">
                  <a
                    href="${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}"
                    >${recipe.title}</a
                  >
                </div>
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
              <c:if test="${loop.index!=recipeList.size()-1}">
                <hr class="line-gray" />
              </c:if>
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

      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/recipe/recipeList.do?section=${section-1}&pageNum=1"
                class="btn-2 btn-square bg-white btn-border"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/prev.png"
                  alt="prev"
                />
              </a>
            </li>
          </c:if>
          <c:set
            var="end"
            value="${Math.ceil((totalRecipeNum - (section-1)*100) div 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/recipe/recipeList.do?section=${section}&pageNum=${i}"
                class="btn-2 btn-square bg-white btn-border"
              >
                ${((section-1)*10)+i}
              </a>
            </li>
          </c:forEach>
          <c:if test="${section*100<totalRecipeNum}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/recipe/recipeList.do?section=${section+1}&pageNum=1"
                class="btn-2 btn-square bg-white btn-border"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/next.png"
                  alt="next"
                />
              </a>
            </li>
          </c:if>
        </ul>
      </div>
    </section>
  </body>
</html>
