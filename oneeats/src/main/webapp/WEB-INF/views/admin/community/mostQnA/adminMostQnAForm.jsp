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
    <title>자주하는 질문 작성</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>

  <body>
    <section>
      ${jave.key}
      <div class="textsize-3 text-left textbold textcolor-black">
        자주하는 질문
      </div>
      <hr class="line-black" />
      <form action="" method="post">
        <div class="mostQnAForm_grid">
          <div class="row mostQnAForm_title">
            <div class="col textcolor-black textbold text-left textsize-3">
              <div class="input-group">
                <input
                  name="title"
                  type="text"
                  class="form-control"
                  placeholder="제목을 입력해주세요."
                  required
                />
              </div>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row vertical-align">
            <div class="col-md-2 textcolor-black textbold text-left textsize-2">
              카테고리
            </div>
            <div class="col-md">
              <select name="category" id="">
                <option value="">결제</option>
                <option value="">배송</option>
                <option value="">주문</option>
              </select>
            </div>
          </div>

          <hr class="line-black" />
          <div class="row mostQnAForm_content">
            <div class="col textcolor-black text-left textsize-2">
              <textarea
                name="content"
                class="form-control"
                id=""
                rows="10"
                placeholder="내용을 입력해주세요."
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
                onclick="location.href='${contextPath}/admin/community/mostQnA/adminMostQnAList.do'"
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
