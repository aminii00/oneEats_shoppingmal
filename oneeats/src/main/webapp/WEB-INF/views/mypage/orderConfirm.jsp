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
        padding: 0 12px;
      }
      p {
        padding-top: 10px;
      }
      table {
        padding-bottom: 10px;
        line-height: 17px;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
      }
      .tr-1 {
        border-bottom: 1px solid #b3b3b3;
      }
      th {
        text-align: left;
        padding: 12px;
        border-bottom: 1px solid #b3b3b3;
        width: 80px;
      }
      td {
        text-align: left;
        padding: 12px;
        width: 50px;
      }
      input {
        width: 400px;
        height: 40px;
        padding: 0px 11px 1px 15px;
        border-radius: 4px;
        border: 1px solid rgb(221, 221, 221);
        line-height: 1.5;
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
        outline: none;
        box-sizing: border-box;
      }
      div.nice-select {
        width: 400px;
      }
      .list {
        width: 100%;
      }
      .div-btn {
        display: flex;
        justify-content: center;
        padding: 20px;
      }
      .btn-1 {
        display: block;
        text-align: center;
        overflow: hidden;
        border-radius: 5px;
        margin-right: 30px;
      }
      .btn-fat1 {
        width: 190px;
        height: 45px;
      }
    </style>
  </head>
  <body>
    <form method="post" action="#">
      <div class="div-p">
        <p
          class="textsize-2 text-left textcolor-black textbold"
          style="font-size: 20px"
        >
          주문/결제
        </p>
      </div>
      <hr class="linebold" />
      <table border="0" class="textcolor-black textsize-2">
        <tr class="tr-1">
          <th>구매자정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="orderer_name" value="강민지" /></td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input type="text" name="orderer_phone" value="010-1234-5678" />
          </td>
        </tr>
        <tr class="tr-1">
          <th>받는분정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="receiver_name" value="강민지" /></td>
        </tr>
        <tr>
          <td>배송주소</td>
          <td>
            <input
              type="text"
              name="receiver_address"
              value="(35234) 대전광역시 서구 대덕대로 182"
            />
          </td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input type="text" name="reciever_phone" value="010-1234-5678" />
          </td>
        </tr>
        <tr>
          <td>배송요청사항</td>
          <td>
            <select name="reciver_comment">
              <option value="부재시 경비실에 맡겨주세요">
                부재시 경비실에 맡겨주세요
              </option>
              <option value="문앞에 놔주세요">문앞에 놔주세요</option>
              <option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
              <option value="직접입력">직접입력</option>
            </select>
          </td>
        </tr>
        <tr class="tr-1">
          <th>적립금</th>
        </tr>
        <tr>
          <td>보유적립금</td>
          <td>1000</td>
        </tr>
        <tr>
          <td>사용적립금</td>
          <td><input type="text" name="used_point" /></td>
        </tr>
        <tr class="tr-1">
          <th>쿠폰</th>
        </tr>
        <tr>
          <td>쿠폰사용</td>
          <td>
            <select name="used_couponId">
              <option value="1000원 할인 쿠폰">1000원 할인 쿠폰</option>
              <option value="2000원 할인 쿠폰">2000원 할인 쿠폰</option>
            </select>
          </td>
        </tr>
        <tr class="tr-1">
          <th>결제정보</th>
        </tr>
        <tr>
          <!-- value는 이엘태그로 값 넣어주기! -->
          <td>상품 금액</td>
          <td><input type="hidden" name="payment_price" value="" />25800원</td>
        </tr>
        <tr>
          <td>상품 할인 금액</td>
          <td><input type="hidden" name="discount_price" value="" />-3100원</td>
        </tr>
        <tr>
          <td>배송비</td>
          <td><input type="hidden" name="shippingfee" value="" />2500원</td>
        </tr>
        <tr>
          <td>적립금액</td>
          <td><input type="hidden" name="point_price" value="" />250원</td>
        </tr>
        <tr>
          <td>총 결제금액</td>
          <td><input type="hidden" name="total_price" value="" />24400원</td>
        </tr>
        <tr>
          <td>결제방법</td>
          <td name="payment_type">
            <button
              class="btn-round btn-fat1 bg-white textcolor-black btn-border textsize-1"
              type="button"
              href="#"
            >
              신용카드
            </button>
            <button
              class="btn-round btn-fat1 bg-white textcolor-black btn-border textsize-1"
              type="button"
              href="#"
            >
              계좌이체
            </button>
            <br />
            <button class="btn-round btn-fat1 bg-white textbold btn-border">
              <img
                style="width: 40px; height: 25px"
                src="${contextPath}/img/icon/kpay.png"
              />
            </button>
            <button class="btn-round btn-fat1 bg-white textbold btn-border">
              <img
                style="width: 40px; height: 25px"
                src="${contextPath}/img/icon/npay.png"
              />
            </button>
            <br />
            <select>
              <option value="카드사 선택">카드사 선택</option>
              <option value="신한카드">신한카드</option>
              <option value="현대카드">현대카드</option>
              <option value="삼성카드">삼성카드</option>
            </select>
            <select>
              <option value="일시불">일시불</option>
              <option value="2개월 할부">2개월 할부</option>
              <option value="3개월 할부">3개월 할부</option>
              <option value="4개월 할부">4개월 할부</option>
            </select>
          </td>
        </tr>
      </table>
      <hr class="linebold" style="margin: 0" />
      <br />
      <div class="div-btn">
        <button
          class="btn-1 btn-regular bg-white textcolor-black btn-border"
          type="reset"
        >
          취소
        </button>
        <button
          class="btn-1 btn-regular bg-lightgreen textcolor-white textbold border-0"
          type="button"
          href=""
        >
          결제하기
        </button>
      </div>
    </form>
  </body>
</html>
