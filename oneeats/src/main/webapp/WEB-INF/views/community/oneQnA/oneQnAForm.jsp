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
    <title>1:1문의 작성</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">1:1문의</div>
      <hr class="line-black" />
      <form action="" method="post">
        <div class="oneQnAForm_grid">
          <div class="row oneQnAForm_title">
            <div class="col textcolor-black textbold text-left textsize-3">
              <div class="input-group">
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

          <div class="row oneQnAForm_content">
            <div class="col textcolor-black text-left textsize-2">
              <textarea
                name="content"
                class="form-control"
                id=""
                placeholder="무엇을 도와드릴까요?"
                style="width: 100%; height: 100%"
                required
              ></textarea>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row">
            <div class="col-md"></div>
            <div class="col-md-4">
              <button
                class="btn-cancel"
                onclick="location.href='${contextPath}/community/oneQnA/oneQnAList.do'"
                type="reset"
              >
                취소
              </button>
              &nbsp;
              <button class="btn-write" onclick="" type="submit">작성</button>
            </div>
          </div>
        </div>
      </form>
    </section>
  </body>
</html>
