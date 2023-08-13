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
        form {
            padding-left: 40px;
            padding-top: 10px;
        }
        .div-p {
            padding: 0 12px;
        }
        p {
            padding-top: 10px;
        }
        table {
            border-top: 2px solid #2C3333; 
            border-bottom: 2px solid #2C3333;
            padding-bottom: 10px;
            line-height: 17px;
            border-collapse: collapse;
            border-spacing: 0;
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }
        th {
            text-align: left;
            padding: 12px;
        }
        td {
            text-align: left;
            padding: 12px;
        }
        input {
            width: 100%;
            height: 40px;
            padding: 0px 11px 1px 15px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            color: rgb(51, 51, 51);
            outline: none;
            box-sizing: border-box;
        }
        input::placeholder {
            font-size: 0.9em;
        }
        select {
            width: 100%;
            height: 40px;
            padding: 0px 11px 1px 15px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            color: rgb(51, 51, 51);
            outline: none;
            box-sizing: border-box;
        }
        div.nice-select{
            width: 100%;
        }
        .list {
            width: 100%;
        }
        .div-btn {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            padding: 20px;
        }
        .btn-1 {
            display: block;
            text-align: center;
            overflow: hidden;
            border-radius: 3px;
            margin-right: 30px;
        }
        </style>
</head>
<body>
    <form method="post" action="#">
        <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">쿠폰등록</p>
        </div>
        <table border="0" class="textcolor-black textsize-2">
            <tr>
                <th>쿠폰명</th>
                <td><input type="text" name="name" placeholder="쿠폰명을 입력하세요"></td>
            </tr>
            <tr>
                <th>할인금액</th>
                <td><input type="text" name="discount_price" placeholder="할인금액을 입력하세요"></td>
            </tr>
            <tr>
                <th>사용조건</th>
                <td><select name="condition" >
                    <option value="사용조건을 선택하세요">사용조건을 선택하세요</option>
                    <option value="회원가입시">회원가입시</option>
                    <option value="30000원 이상 구매시">30000원 이상 구매시</option>
                    <option value="50000원 이상 구매시">50000원 이상 구매시</option>
                </select>
                </td>
            </tr>
            <tr>
                <th>사용처</th>
                <td><input type="text" name="seller_memberNo" placeholder="사용처를 입력하세요"></td>
            </tr>
            <tr>
                <th>유효기간</th>
                <td><input type="text" name="expDate" placeholder="유효기간을 입력하세요"></td>
            </tr>
        </table>
        <br>
        <div class="div-btn">
            <button class="btn-1 btn-regular bg-white textcolor-black btn-border" type="reset">다시쓰기</button>
            <button class="btn-1 btn-regular bg-lightgreen textcolor-white border-0" type="submit" href="#">쿠폰등록</button>
        </div>
    </form>
</body>
</html>