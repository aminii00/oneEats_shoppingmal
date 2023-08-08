<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <style>
      .no-underline {
        text-decoration: none;
      }
    </style>
    <meta charset="UTF-8" />
    <title>�궗�씠�뱶 硫붾돱</title>
  </head>
  <body>
    <h1>사이드 메뉴</h1>

    <h1>
      <a href="${contextPath}/member/listMembers.do" class="no-underline"
        >내 정보 보기</a
      ><br />
    </h1>
  </body>
</html>
