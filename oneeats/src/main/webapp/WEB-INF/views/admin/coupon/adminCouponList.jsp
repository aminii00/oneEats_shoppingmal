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
    .cart > form {}

    .cart > form > table {
            width: 100%;
            border-bottom: 1px solid #d3d3d3;
            border-collapse: collapse;
            border-spacing: 0;
        }

    .cart > form > table tr { border-bottom: 1px solid #d3d3d3 ;}

    .cart > form > table th:first-child {width: 60px;}

    .cart > form > table th {
            padding: 12px 0;
            border-top: 2px solid #000;
            border-bottom: 1px solid #d3d3d3;
            background: #fff;
            color: #383838;
            font-size: 0.95em;
            text-align: center;
            letter-spacing: -0.1em;
        }

    .cart > form > table .empty { display: none ;}

    .cart > form > table td { text-align: center;}

    .cart > form > table td:last-child {
            color: #ff006c;
            font-weight: bold;
        }

    .cart > form > table th > input {}

        

    .cart > form > table tr > td > input {}

    .cart > form > input[name=del] {
            border-color: #bdbdbd;
            border-bottom-color: #828282;
            background: #fafafa;
            color: #4d4d4d;
            padding: 6px 11px;
            border-width: 1px;
            margin-top: 6px;
        }

    .cart > form > .total {
            float: right;
            width: 360px;
            height: 412px;
            padding: 20px;
            margin-top: 12px;
            background: #fff;
            border: 1px solid #d3d3d3;
            box-sizing: border-box;
        }

    .cart > form > .total > h2 {
            width: 100%;
            font-weight: bold;
            font-size: 16px;
            border-bottom: 1px solid #111;
            margin-bottom: 10px;
            padding-bottom: 10px;
            box-sizing: border-box;
            color: #1e1e1e;
        }

    .cart > form > .total > table { width: 100%; }

    .cart > form > .total > table tr:nth-last-child(1) td {
            font-size: 20px;
        }

    .cart > form > .total > table tr:nth-last-child(1) td:last-child {
            color: #ff006c;
            font-size: 20px;
            font-weight: bold;
        }

    .cart > form > .total > table td {
            padding: 10px 0;
            font-size: 14px;
            color: #555;
        }

    .cart > form > .total > table td:last-child { text-align: right; }

    .cart > form > .total > input[type=submit] {
            width: 100%;
            height: 56px;
            font-size: 26px;
            border-width: 1px;
            border-color: #d81818;
            border-bottom-color: #9e1212;
            background: #ed2f2f;
            background-image: -webkit-linear-gradient(#ed2f2f, #dd0e0e);
            color: #fff;
            box-sizing: border-box;
            margin-top: 10px;
        }
    </style>
</head>
<body>
        <section class="cart">
            <nav>
                <p class="textsize-2">쿠폰목록</p>
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
                    <tr class="empty">
                        <td colspan="5">등록한 쿠폰이 없습니다.</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="couponNo"></td>
                        <td><input type="text" name="creDate"></td>
                        <td><input type="text" name="name"></td>
                        <td><input type="text" name="condition"></td>
                        <td><a href="#">삭제</td>
                    </tr>
                </table>
    </form>
    </section>
</body>
</html>