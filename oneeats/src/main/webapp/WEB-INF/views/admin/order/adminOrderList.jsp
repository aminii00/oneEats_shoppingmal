<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      form {
        padding-left: 40px;
        padding-top: 10px;
      }
      .div-p {
        display: flex;
        padding: 0 12px;
      }
      p {
        padding-top: 10px;
        padding-right: 20px;
      }
      .div-sib {
        margin-left: auto;
        margin-top: 10px;
      }
      select {
        height: 30px;
        border-radius: 4px;
        border: 1px solid rgb(221, 221, 221);
        line-height: 1.5;
        color: rgb(51, 51, 51);
        outline: none;
        box-sizing: border-box;
      }
      .div-sib div.nice-select {
        height: 30px;
        width: 70px;
        font-size: 0.9em;
        text-align: center;
        line-height: 30px;
      }
      .list {
        width: 100%;
        text-align: center;
      }
      input {
        width: 250px;
        height: 30px;
        padding-left: 10;
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
      .btn-1 {
        height: 30px;
        width: 70px;
        text-align: center;
        overflow: hidden;
        border-radius: 3px;
      }
      table {
        border-top: 2px solid #2c3333;
        border-bottom: 2px solid #2c3333;
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
        border-bottom: 1px solid #b3b3b3;
      }
      td {
        text-align: left;
        padding: 12px;
        margin-left: auto;
      }
      a {
        text-decoration: none;
        color: #2c3333;
      }
      .ul-li {
        margin-top: 60px;
        list-style: none;
        display: flex;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
      }
      .li-btn {
        padding-left: 10px;
      }
      .btn-2 {
        display: flex;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        color: rgb(51, 51, 51);
        line-height: 34px;
      }
      .btn-3 {
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        border-radius: 3px;
        width: 50px;
        height: 30px;
      }
    </style>
  </head>
  <body>
    <form method="post" action="#">
      <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">주문/배송</p>
        <div class="div-sib textsize-1">
          <select name="search-1">
            <option value="전체">전체</option>
            <option value="주문번호">주문번호</option>
            <option value="주문자명">주문자명</option>
            <option value="아이디">아이디</option>
          </select>
          <input type="text" name="search-2" placeholder="search.." />
          <button
            class="btn-1 bg-lightgreen textcolor-white border-0"
            type="button"
          >
            검색
          </button>
        </div>
      </div>
      <table border="0" class="textcolor-black textsize-1">
        <tr>
          <th>주문번호</th>
          <th>결제일시</th>
          <th>주문자명</th>
          <th>아이디</th>
          <th>주문내역</th>
          <th>주문상태</th>
          <th>취소</th>
        </tr>
        <tr>
          <td>20230811001</td>
          <td>2023-08-11 12:36</td>
          <td>강민지</td>
          <td>minzy03</td>
          <td>케일주스 외 6건</td>
          <td>주문완료</td>
          <td>
            <a
              href="javascript:void(0)"
              onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/admin/order/adminOrderList.do")'
              >취소</a
            >
          </td>
        </tr>
      </table>
      <%--
      <!--    <div> 페이징처리
        <c:if test="${totArticles != null}"
            <c:choose>
            <c:when test="${totArticles > 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <c:if test="${section > 1 && page == 1}">
                    <a href="#">&nbsp:prev</a>
                    </c:if>
                    <a href="#"></a>
                    <c:if test="${page == 10}">
                    <a href="#">&nbsp:next</a>
                    </c:if>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles == 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <a href="#">${page}</a>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles < 100}">
                <c:foreach var="page" begin="1" end="${totArticles/10+1}" step="1">
                <c:choose>
                    <c:when test="${page == pageNum}">
                    <a href="#">${page}</a>
                    </c:when>
                    <c:otherwise>
                    <a href="#">${page}</a>
                    </c:otherwise>
                </c:choose>
                </c:foreach>
            </c:when>
            </c:choose>
        </c:if>
        </div> 
-->
      --%>
      <div>
        <ul class="ul-li">
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">1</button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </button>
          </li>
        </ul>
      </div>
    </form>
  </body>
</html>
