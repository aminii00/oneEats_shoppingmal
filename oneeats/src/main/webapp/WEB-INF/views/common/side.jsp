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
    <title>사이드바</title>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div>
          <div class="bg-green" style="background-color: #a3d060">
            <img src="#" />
            <span>All departments</span>
          </div>
          <ul>
            <li><a href="#">Fresh Meat</a></li>
            <li><a href="#">Vegetables</a></li>
            <li><a href="#">Fruit & Nut Gifts</a></li>
            <li><a href="#">Fresh Berries</a></li>
            <li><a href="#">Ocean Foods</a></li>
            <li><a href="#">Butter & Eggs</a></li>
            <li><a href="#">Fastfood</a></li>
            <li><a href="#">Fresh Onion</a></li>
            <li><a href="#">Papayaya & Crisps</a></li>
            <li><a href="#">Oatmeal</a></li>
            <li><a href="#">Fresh Bananas</a></li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
