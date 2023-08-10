<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post" action="${contextPath}/admin/coupon/adminCouponList.do">
        <div>
            <h3>쿠폰등록</h3></div>
        <ul>
            <li>
                <span>쿠폰명</span>
                <span><input type="text" name="name"></span>
            </li>
            <li>
                <span>보내는 분</span>
                <span>강민지</span>
            </li>
            <li>
                <span>결제일시</span>
                <span>2023-08-08 23:33:29</span>
            </li>
        </ul>
    
        <div>
        <div><p class="textsize-2">쿠폰등록</p></div>
        <hr class="linebold">
        <div class="textsize-2 textcolor-black">
            <tr>
                <td>쿠폰명</td>
                <td><input type="text" name="name"></td>
            </tr><br>
            <tr>
                <td>할인금액</td>
                <td><input type="text" name="discount_price"></td>
            </tr><br>
            <tr>
                <td>사용조건</td>
                <td><input type="text" name="condition"></td>
            </tr><br>
            <tr>
                <td>사용처</td>
                <td><input type="text" name="seller_memberNo"></td>
            </tr><br>
            <tr>
                <td>유효기간</td>
                <td><input type="text" name="expDate"></td>
            </tr>
         </div>
        <div>
        <button class="bg-white btn-regular textcolor-black" type="button">다시쓰기</button>
        <button class="bg-lightgreen btn-regular textcolor-white border-0" type="button">쿠폰등록</button>
        </div>
    </div>
    </form>
</body>
</html>