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
      


.img-01 {
        width: 120px;
        height: 120px;
        margin-left: 40px;
        background-color: rgb(245, 245, 245);
      }
.booktext{
  width:200px;
}

.book{
  width:300px;
}
.bookserve{
  width:80px; 
  height:29px; 
  margin-bottom: 5px;
}

    </style>
    </head>
    <body>
    <form method="post" action="#">
    <div class="div-p ">
        <br>
        <p class=" textsize-2 text-left textcolor-black textbold">찜한 상품 &nbsp <span class ="textsize-1 textcolor-lightgray">찜한 상품은 최대 100개까지 저장합니다.</span></p>
    <hr class="linebold">
    <br>
   <c:forEach var="item" items="${bookList}" varStatus="status">
    <table>
      <tr>
        <td>
          <img
              class="img-01"
              src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
              alt="상품 이미지"
            />
        </td>
        <td class ="booktext text-center" >
         ${item.name}
         <br>
         <span class = "textsize-1">${item.price}원</span>
        </td>
        <td>
          <div class=" book text-right">
            <button class =" bookserve bg-lightgreen textsize-1 border-0 margin btn-round" >장바구니</button>
            <br>
            <button type="button" onclick="location.href='${contextPath}/mypage/deleteBook.do'" class ="bookserve bg-lightgreen textsize-1 border-0 margin btn-round">삭제</button>
          </div>
        </td>
      </tr>
      <hr>
    </table>
    
  </c:forEach>
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
