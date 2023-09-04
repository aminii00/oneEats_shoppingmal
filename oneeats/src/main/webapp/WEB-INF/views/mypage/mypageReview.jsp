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
   


.point{
    text-align: center;
    margin:0 auto; 
    width: 250px; 
    height: 80px;
    padding : 40px 0;
}

table {
    margin-left:auto; 
    margin-right:auto;
}

.table-review{
    width: 500px;
    height: 50px;
    text-align: center;
}
.reviewImage{
    width: 100px; 
    height: 100px; 
    text-align: center;
}
    </style>
    </head>
    <body>
    <form method="post" action="">
        <div class="profile-edit-header text-left">
            <br>
            <span class="textsize-3 textbold" >리뷰작성</span>
            <hr class = "line-black">
            
            <p class = "textsize-1 text-left textcolor-lightgray"> 
              · 사진후기 150원, 글후기 50원 적립, 동일 상품의 후기는 월 1회만 적립금을 지급해드립니다.<br>
              ·  후기 작성 후 첫 영업일에 적립금이 지급됩니다.
                </p>

                <br>
                <h5 class = "textsize-2" style = "text-align: left;">작성 가능 리뷰</h5>
                <hr>
                <br>
                <table style="width: 641px; height: 110px;">
                    <c:forEach var="item" items="${reviewList}" varStatus="status">
                    <tr style="border-bottom: 1px solid lightgray;">
                        <td><img class ="reviewImage" src= "${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goods/${item.goodsNo}" class="brd-lightgray btn-round imgsize-square2" style="width:110px; height:100px; float: left; " ></td>
                        <td class = "textsize-2 textbold" >${item.goodsName} 총 수량 ${item.goods_qty}개<br>${item.deliveryDate} ${item.delivery_status}</td>
                        <td class = "textsize-2 textbold" >2023.08.01까지 작성 가능<br>
                          <button 
                          type = "button"
                          class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0" 
                          onclick="location.href='${contextPath}/review/writeReview.do?order_seqNo=${item.order_seqNo}'"
                          >
                          리뷰작성
                         </button>
                        </td>
                    </tr>
                </c:forEach>
                </table>


                <br><br>
                <div id="wrapper" class = "text-center">
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
                  <hr>

                <br><br>
                <h5 class = "textsize-2" style = "text-align: left;">작성한 리뷰</h5>
                <hr>
                <br>
                <table style="width: 641px; height: 110px;">
                    <c:forEach var="item" items="${writeReview}" varStatus="status">
                      
                    <tr style="border-bottom: 1px solid lightgray;">
                        <td><img class ="reviewImage" src= "${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goods/${item.goodsNo}" class="brd-lightgray btn-round imgsize-square2" style="width:110px; height:100px; float: left; " ></td>
                        <td class = "textsize-2 textbold" >${item.goodsName} 총 수량 ${item.goods_qty}개<br>${item.deliveryDate} ${item.delivery_status}</td>
                     </td>
                    </tr>
                </c:forEach>
                </table>

                <br><br>
                <div id="wrapper" class = "text-center">
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
                  <hr>
</div>
</div>
        </form>
</body>
</html>
