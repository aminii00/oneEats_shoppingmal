<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	
	isELIgnored="false"	%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 부분</title>
<style>
p{
font-size:20px;
text-align:center;
}
</style>
</head>
<body>
<p>e-mail:admin@test.com</p>
<p>회사 주소: 서울시 강동구</p>
<p>찾아 오는 길:<a href="#">약도</a></p>
</body>
</html>