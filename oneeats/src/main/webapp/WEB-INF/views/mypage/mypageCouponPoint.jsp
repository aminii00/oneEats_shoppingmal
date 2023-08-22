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
        width: 750px;
        padding: 0 12px;
      }

      .btn-coupon {
        width: 210px;
        height: 38px;
      }

      .btn-couponsubmit {
        width: 70px;
        height: 38px;
      }

      ul {
        list-style: none;
      }

      li {
        float: left;
        margin-right: 53px;
      }

      .point {
        text-align: center;
        margin: 0 auto;
        width: 250px;
        height: 80px;
        padding: 40px 0;
      }

      .one_div {
        width: 742px;
        height: 95px;
        border-color: lightgray;
        border-style: solid;
        text-align: left;
      }
      .coupontd {
        width: 742px;
        height: 60px;
        align-items: center;
      }
      .coupontr {
        height: 59px;
        border-top: solid 1px lightgray;
        border-bottom: solid 1px lightgray;
      }
      .pointd{
        width: 350px; 
        height:79px; 
        border: solid 1px lightgray; 
        display:inline-block;
      }
    </style>
  </head>
  <body>
    <form method="post" action="${contextPath}/mypage/couponSearch.do">
      <div class="div-p">
        <br />
        <p class="textsize-2 text-left textcolor-black textbold">
          쿠폰/적립금 &nbsp
          <span class="textsize-1 textcolor-lightgray"
            >보유하고 계신 쿠폰&적립금의 내역을 한 눈에 확인하실 수
            있습니다.</span
          >
        </p>
        <hr class="linebold" />
        <br />
        <span class="textbold" style="text-align: left">쿠폰</span>
        <div class="btn-border one_div">
          <div>
            <br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <input
              style="border-color: lightgray"
              class="brd-lightgray btn-coupon btn-midlong-input textsize-1"
              placeholder="발급된 쿠폰 번호를 입력해주세요."
              type="text"
              name="couponNo"
            />
            <button
              type="submit"
              class="btn-couponsubmit bg-lightgreen textsize-0 border-0 margin textbold textsize-1">
              쿠폰등록
            </button>
            <br />
            <span class="textsize-1 textcolor-red">
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              쿠폰에 하이픈 ’-’이 포함되어 있을 경우, 하이픈 ‘-’을 반드시
              입력해주세요.</span
            >
            <br />
          </div>
        </div>
        <br />
        <table class="coupontd">
          <tr class="coupontr textbold">
            <td style="width: 200px; text-align: left">&nbsp&nbsp쿠폰명</td>
            <td style="width: 170px">기능</td>
            <td>할인적립</td>
            <td>사용가능기간</td>
            <td>사용여부</td>
          </tr>
          <c:forEach var="item" items="${couponDetail}" varStatus="status">
          <tr class="coupontr">
            <td style="width: 200px; text-align: left">
              &nbsp&nbsp${item.condition}
            </td>
            <td style="width: 170px">~~</td>
            <td>${item.name}</td>
            <td>${item.expdate}</td>
            <td>${item.discount}</td>
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

        <br />
        <br />
        <div style="width:750px; height: 80px; text-align: center;">
          <div class ="pointd textsize-1"> 
            <div style="margin-top: 20px;">
            현재 적립금<br>0원
           </div>
          </div>
          <div class ="pointd textsize-1">
            <div style="margin-top: 20px;">
            소멸예정 적립금<br>0원</div></div>
        </div>
        <br>
        <table class="coupontd">
          <tr class="coupontr textbold">
            <td style="width: 200px; text-align: left">&nbsp&nbsp쿠폰명</td>
            <td style="width: 170px">기능</td>
            <td>할인적립</td>
            <td>사용가능기간</td>
            <td>사용여부</td>
          </tr>
          <tr class="coupontr">
            <td style="width: 200px; text-align: left">
              &nbsp&nbsp회원가입 환영 쿠폰
            </td>
            <td style="width: 170px">~~</td>
            <td>10% 할인</td>
            <td>2024.06.24</td>
            <td>사용완료</td>
          </tr>
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
        <br><br>
    </form>
  </body>
</html>
