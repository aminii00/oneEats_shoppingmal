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
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
    <script src="js/common.js"></script>

    <!--bootstrap-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css" />
    <title><tiles:insertAttribute name="title"/></title>
  </head>
  <body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
      <div class="loader"></div>
    </div> -->

    <div id="container">
      <div id="header">
        <tiles:insertAttribute name="header" />
      </div>
      <div id="sidebar-left">
        <tiles:insertAttribute name="side" />
      </div>
      <div id="content">
        <tiles:insertAttribute name="body" />
      </div>
      <div id="footer">
        <tiles:insertAttribute name="footer" />
      </div>
    </div>

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
