<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>헤더</title>

    <link rel="stylesheet" href="${contextPath}/css/header.css">
  </head>
  <body>
    <div class="container">
      <div class="row bg-gray">
        <div class="col-9"></div>
        <div class="col-3 textsize-1 textcolor-black"><a href="#">회원가입</a> &nbsp;<a href="#">로그인</a> &nbsp;<a href="#">고객센터</a></div>
      </div>
      <div class="row">
        &nbsp;
      </div>
      <div class="row">
        <div class="col-3">
          <img
            src="${contextPath}/img/logo.png"
            alt="Logo"
            style="width: 100%; height: auto"
          />
        </div>
        <div class="col-1">&nbsp;</div>
        <div class="col-6">
          <div class="row">
            <div class="col-md">
              <form action="">
                <!-- Search bar content -->
                <div class="input-group">
                  <input
                    type="text"
                    placeholder="Search..."
                    class="form-control"
                  />
                  <div class="input-group-append">
                    <button class="bg-lightgreen textcolor-white border-0" type="submit">Search</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md">
              <a href="#">Home</a>
            </div>
            <div class="col-md">
              <a href="#">베스트</a>
            </div>
            <div class="col-md">
              <a href="#">핫딜</a>
            </div>
            <div class="col-md">
              <a href="#">레시피</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <div class="row">
            <div class="col">
              <a href="#">
                <img
<<<<<<< HEAD
                  style="width: 100%; height: 100%"
=======
                  style="width: auto; height: 100%"
>>>>>>> refs/heads/hanyeji
                  src="${contextPath}/img/icon/cart.png"
                  alt=""
                />
              </a>
            </div>
            <div class="col">
              <a>
                <img
<<<<<<< HEAD
                  style="width: 100%; height: 100%"
=======
                  style="width: auto; height: 100%"
>>>>>>> refs/heads/hanyeji
                  src="${contextPath}/img/icon/bookmark.png"
                  alt=""
                />
              </a>
            </div>
            <div class="col">&nbsp;</div>
          </div>
          <div class="row">&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
