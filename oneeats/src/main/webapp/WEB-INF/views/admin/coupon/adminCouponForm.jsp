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
    <title>관리자 쿠폰등록</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy2.css" />
  </head>
  <body>
    <!-- 쿠폰등록 -->
    <form method="post" action="#">
        <div class="div-p2">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">쿠폰등록</p>
        </div>

        <hr class="linebold" />

        <table class="textcolor-black textsize-2">
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
        
        <hr class="linebold" />

        <!-- 버튼 -->
        <div class="div-btn">
            <button class="btn-1 btn-regular bg-white textcolor-black btn-border" type="reset">다시쓰기</button>
            <button class="btn-1 btn-regular bg-lightgreen textcolor-white textbold border-0" type="button"
            onclick='fn_openalert("쿠폰을 등록하시겠습니까?","${contextPath}/admin/coupon/adminCouponList.do")'>쿠폰등록</button>
        </div>
    </form>
  </body>
</html>