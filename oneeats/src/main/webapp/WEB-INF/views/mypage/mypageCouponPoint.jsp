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
    </style>
  </head>
  <body>
    <form method="post" action="#">
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
        <div
          style="
            width: 742px;
            height: 95px;
            border-color: lightgray;
            border-style: solid;
            text-align: left;
          "
          class="btn-border"
        >
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
              class="btn-couponsubmit bg-lightgreen textsize-0 border-0 margin textbold textsize-1"
            >
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
        <table>
          <tr>
            <td>쿠폰명</td>
            <td style="margin-left: 200px">기능</td>
            <td>할인적립</td>
            <td>사용가능기간</td>
            <td>사용여부</td>
          </tr>
        </table>
        <hr />

        <ul>
          <li>쿠폰명</li>
          <li style="margin-left: 200px">기능</li>
          <li>할인적립</li>
          <li>사용가능기간</li>
          <li>사용여부</li>
        </ul>
        <br />
        <hr />
        <br />
        <span class="textsize-1">쿠폰 내역이 존재하지 않습니다.</span>
        <br />
        <br />
        <hr />
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
        <div
          style="
            width: 371.5px;
            height: 94.5px;
            border-color: lightgray;
            border-style: solid;
            text-align: left;
            float: left;
          "
          class="btn-border"
        >
          <div class="point textsize-1">
            현재
            적립금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            0원
          </div>
        </div>
        <div
          style="
            width: 371.5px;
            height: 94.5px;
            border-color: lightgray;
            border-style: solid;
            text-align: left;
            float: left;
          "
          class="btn-border"
        >
          <div class="point textsize-1">
            소멸 예정
            적립금&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            0원
          </div>
        </div>
      </div>
      <br />
      <br />
      <br />
      <br />
      <hr />
      <ul>
        <li style="margin-left: 20px">날짜</li>
        <li style="margin-left: 40px">내용</li>
        <li style="margin-left: 290px">유효기간</li>
        <li style="margin-left: 40px">금액</li>
      </ul>
      <br />
      <hr />
      <br />
      <span class="textsize-1">적립금 내역이 존재하지 않습니다.</span>
      <br />
      <br />
      <hr />
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
    </form>
  </body>
</html>
