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
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
   <script>
    function address(){
    
    }
   </script>
  </head>
  <body>
    <form method="post" action="#">
      <div class="div-p1">
        <br />
        <p class="textsize-2 text-left textcolor-black textbold">
          배송지 관리<a class="textsize-1" style="float: right" onclick=address()
            >+새 배송지 추가</a
          >
        </p>
        <hr class="linebold" />

        <table class="coupontd textsize-2">
          <tr class="coupontr textbold">
            <td class="addresstd1">&nbsp;선택</td>
            <td class="addresstd2">주소</td>
            <td class="addresstd3">받으실 분</td>
            <td class="addresstd4">연락처</td>
            <td>수정</td>
          </tr>
          <c:forEach var="item" items="${myAddress}" varStatus="status">
            <tr class="coupontr">
              <td class="addresstd1">&nbsp&nbsp선택</td>
              <td class="addresstd2">
                ${item.address} &nbsp ${item.address_detail}
              </td>
              <td class="addresstd3">${item.receiver_name}</td>
              <td class="addresstd4">${item.receiver_phone}</td>
              <td><button class ="border-0" type="button">
                <img class ="border-0" 
                src="${contextPath}/img/icon/mod.png"
                alt="Logo"
                style="width: 35px; height: auto"></button></td>
            </tr>
          </c:forEach>
        </table>
        <br />
        <br />
        <br />
        <div id="wrapper">
          <main id="product">
            <section class="view">
              <article class="review">
                <div class="paging">
                  <span class="prev">
                    <a href="#">< 이전</a>
                  </span>
                  <span class="num">
                    <a href="#" class="on">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                  </span>
                  <span class="next">
                    <a href="#">다음 ></a>
                  </span>
                </div>
              </article>
            </section>
          </main>
        </div>
      </div>
    </form>
  </body>
</html>
