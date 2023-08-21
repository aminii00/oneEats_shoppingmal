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
    <title>주문하기</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy2.css" />
  </head>
  <body>
    <!-- 주문/결제 -->
    <form method="post" action="${contextPath}/mypage/addNewOrder.do">
      <div class="div-p">
        <p class="p-1 extsize-2 text-left textcolor-black textbold">
          주문/결제
        </p>
      </div>

      <hr class="linebold" />

      <table class="textcolor-black textsize-2">
        <!-- 구매자정보 -->
        <tr class="tr-1">
          <th>구매자정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="orderer_name" /></td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input type="text" name="orderer_phone" />
          </td>
        </tr>

        <!-- 받는분정보 -->
        <tr class="tr-1">
          <th>받는분정보</th>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="receiver_name" /></td>
        </tr>
        <tr>
          <td>배송주소</td>
          <td>
            <input type="text" name="receiver_address" />
          </td>
        </tr>
        <tr>
          <td>연락처</td>
          <td>
            <input type="text" name="reciever_phone" />
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

        <!-- 적립금 -->
        <tr class="tr-1">
          <th>적립금</th>
        </tr>
        <tr>
          <td>보유적립금</td>
          <td></td>
        </tr>
        <tr>
          <td>사용적립금</td>
          <td><input type="text" name="used_point" /></td>
        </tr>

        <!-- 쿠폰 -->
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

        <!-- 결제정보 -->
        <tr class="tr-1">
          <th>결제정보</th>
        </tr>
        <tr>
          <!-- value는 이엘태그로 값 넣어주기! -->
          <td>상품 금액</td>
          <td><input type="hidden" name="payment_price" />원</td>
        </tr>
        <tr>
          <td>상품 할인 금액</td>
          <td><input type="hidden" name="discount_price" value="" />-원</td>
        </tr>
        <tr>
          <td>배송비</td>
          <td><input type="hidden" name="shippingfee" value="" />원</td>
        </tr>
        <tr>
          <td>적립금액</td>
          <td><input type="hidden" name="point_price" value="" />원</td>
        </tr>
        <tr>
          <td>총 결제금액</td>
          <td><input type="hidden" name="total_price" value="" />원</td>
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
              <img class="img-1" src="${contextPath}/img/icon/npay.png" />
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

      <!-- 주문버튼 -->
      <div class="div-btn">
        <button
          class="btn-1 btn-regular bg-white textcolor-black btn-border"
          type="reset"
        >
          취소
        </button>
        <button
          class="btn-1 btn-regular bg-lightgreen textcolor-white textbold border-0"
          type="submit"
        >
          결제하기
        </button>
      </div>
    </form>
  </body>
</html>
