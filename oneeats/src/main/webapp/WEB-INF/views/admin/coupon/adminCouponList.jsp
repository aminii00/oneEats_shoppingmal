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

    form > table tr { 
        border-bottom: 1px solid #B3B3B3;
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
        <section class="cart">
            <nav>
                <p class="textsize-2 text-left textbold textcolor-black">쿠폰목록</p>
            </nav>
           <form method="post" action="${contextPath}/admin/coupon/adminCouponList.do">
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>쿠폰등록일</th>
                        <th>쿠폰명</th>
                        <th>사용처</th>
                        <th>삭제</th>
                    </tr>
                    <tr>
                        <td>couponNo</td>
                        <td>creDate</td>
                        <td>namesize</td>
                        <td>condition</td>
                        <td><a href="#" >삭제</td>
                    </tr>
                </table>
    </form>
    </section>
</body>
</html>