<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <!--bootstrap-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    <!-- Css Styles -->
    <link
      rel="stylesheet"
      href="${contextPath}/css/bootstrap.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/font-awesome.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/elegant-icons.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/nice-select.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/jquery-ui.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/owl.carousel.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/slicknav.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/style.css"
      type="text/css"
    />

    <!--추가한 css-->
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
    <link rel="stylesheet" href="${contextPath}/css/font.css" />
    <link rel="stylesheet" href="${contetPath}/css/notice-window.css" />

    <title><tiles:insertAttribute name="title"/></title>
  </head>
  <body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
      <div class="loader"></div>
    </div> -->

    <div id="container">
      <div id="header" class="container-md">
        <tiles:insertAttribute name="header" />
      </div>
      <div class="container-md">
        <div id="">
          <tiles:insertAttribute name="body" />
        </div>
      </div>
    </div>
    <div id="footer">
      <tiles:insertAttribute name="footer" />
    </div>
    <!-- Js Plugins -->
    <script src="${contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${contextPath}/js/jquery-ui.min.js"></script>
    <script src="${contextPath}/js/jquery.slicknav.js"></script>
    <script src="${contextPath}/js/mixitup.min.js"></script>
    <script src="${contextPath}/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/js/main.js"></script>
    <script src="${contextPath}/js/jQueryRotate.js"></script>

    <!--추가한 js-->
    <script src="${contextPath}/js/common.js"></script>
  </body>
</html>
