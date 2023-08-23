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
       .css-select {
    flex: 1 1 0%;
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 1.36;
    display: -webkit-box;
    overflow: hidden;
    word-break: break-all;
    white-space: normal;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}

.css-address {
    flex: 1 1 0%;
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 1.36;
    display: -webkit-box;
    overflow: hidden;
    word-break: break-all;
    white-space: normal;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}

.css-1ccl3pq {
    display: flex;
    padding-top: 6px;
    flex-direction: row;
    color: rgb(0, 0, 0);
    line-height: 20px;
}

.css-1fttcpj {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}
.div-p {
    padding: 0 12px;
}
      






    </style>
    </head>
    <body>
    <form method="post" action="#">
    <div class="div-p">
        <br>
        <p class=" textsize-2 text-left textcolor-black textbold">주문내역<a class ="textsize-1" style="float:right" href="#">+새 배송지 추가</a></p>
    <hr class="linebold">
    <div class="css-1fttcpj ">
        <dl class="css-1ccl3pq ">
            <dt class="css-select ">선택</dt>
            <dd class="css-select ">주소</dd>
            <dd class="css-select ">받으실 분</dd>
            <dd class="css-select ">연락처</dd>
            <dd class="css-select ">수정</dd>
        </dl>
        </div>
        <hr class="linebold">
        <c:forEach var="item" items="${myAddress}" varStatus="status">
        <dl class="css-1ccl3pq  textsize-1">
            <div class="css-select ">선택</div>
            <div class="css-select ">${item.address} &nbsp ${item.address_detail}</div>
            <div class="css-select ">${item.reciever_name}</div>
            <div class="css-select ">${item.reciever_phone}</div>
            <div class="css-select "><a href="#">수정</a></div>
        </dl>
        <hr>
      </c:forEach>
        </div>
      

        <br><br>
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
    </form>
</body>
</html>
