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
    <style>
    form > table {
        border-top: 2px solid #000; 
        border-bottom: 2px solid #000;
    }

    form > table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
    }

    form > table th { 
        text-align: left;
        padding: 12px 0;
    }

    form > table tr th td input {
        padding: 6px 11px;
        border-color: #B3B3B3;
    }

    form > table td { 
        text-align: left;
        padding: 12px 0;
    }

    form > table .empty { 
        display: none ;
    }
    </style>
</head>
<body>
<form method="post" action="${contextPath}/admin/coupon/adminCouponForm.do">
    <p class="textsize-2 text-left textcolor-black textbold">쿠폰등록</p>
    <table border="0" class="textcolor-black textsize-2">
        <tr>
            <th>쿠폰명</th>
            <td><input type="text" name="name" size="50"></td>
        </tr>
        <tr>
            <th>할인금액</th>
            <td><input type="text" name="discount_price" size="50"></td>
        </tr>
        <tr>
            <th>사용조건</th>
            <td><select name="condition" width="80">
                <option value="회원가입시">회원가입시</option>
                <option value="30000원 이상 구매시">30000원 이상 구매시</option>
                <option value="50000원 이상 구매시">50000원 이상 구매시</option>
            </select>
            </td>
        </tr>
        <tr>
            <th>사용처</th>
            <td><input type="text" name="seller_memberNo" size="50"></td>
        </tr>
        <tr>
            <th>유효기간</th>
            <td><input type="text" name="expDate" size="50"></td>
        </tr>
    </table>
    <br>
    <button type="reset" class="btn-regular bg-white textcolor-black btn-border textbold text-kr textsize-2">다시쓰기</button>
    <button type="submit" href="#" class="btn-regular bg-lightgreen textcolor-black border-0 textbold text-kr textsize-2">쿠폰등록</button>
</form>
</body>
</html>