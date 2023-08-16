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
      .btn-1 {
        height: 30px;
        width: 70px;
        text-align: center;
        overflow: hidden;
        border-radius: 3px;
      }
      .div-tot {
        line-height: 17px;
        border-collapse: collapse;
        border-spacing: 0;
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
      }
      .div-span {
        display: flex;
        padding: 12px;
        border-bottom: 1px solid #b3b3b3;
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
      .div-t2 {
        display: flex;
        flex-direction: row;
        -webkit-box-pack: justify;
        justify-content: space-between;
        padding: 0px 10px;
      }
      .div-left {
        display: inline-block;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
      }
      .div-left2 {
        display: flex;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
      }
      .img-1 {
        width: 60px;
        height: 70px;
        margin-right: 20px;
        background-color: rgb(245, 245, 245);
      }
      .div-dl {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-flex-direction: column;
        -ms-flex-direction: column;
        flex-direction: column;
      }
      dl {
        margin-bottom: 0;
      }
      .dl-dt {
        display: flex;
        padding-top: 6px;
        flex-direction: row;
        line-height: 20px;
      }
      .dt-1 {
        width: 80px;
        line-height: 1.58;
        margin-right: 10px;
        text-align: left;
      }
      .dt-2 {
        width: 200px;
        line-height: 1.58;
        margin-right: 10px;
        text-align: left;
      }
      .dd-1 {
        text-align: left;
        line-height: 1.36;
        overflow: hidden;
        word-break: break-all;
        white-space: normal;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      .div-right {
        display: -webkit-box;
        display: -webkit-flex;
        display: -ms-flexbox;
        display: flex;
        -webkit-align-items: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
      }
      .span-1 {
        width: 100px;
        text-align: right;
        margin-right: 20px;
      }
      .div-btn {
        width: 96px;
      }
      .btn-3 {
        display: block;
        padding: 0px 10px;
        text-align: center;
        overflow: hidden;
        border-radius: 5px;
        width: 100px;
        height: 30px;
      }
    </style>
  </head>
  <body>
    <form method="post" action="#" style="margin-bottom: 74px">
      <div class="div-p" style="margin-bottom: 4px">
        <p
          class="textsize-2 text-left textcolor-black textbold"
          style="font-size: 20px"
        >
          주문상세
        </p>
        <div class="div-sib textsize-1">
          <button
            class="btn-1 textcolor-black border-0"
            style="background-color: #e6eeff"
            onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/mypage/orderCancel.do")'
            type="button"
          >
            주문취소
          </button>
        </div>
      </div>
      <hr class="linebold" style="margin: 0" />
      <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
          <span>2023.08.11 주문</span>
          <span style="margin-left: auto">주문번호 20230811001</span>
        </div>
      </div>
      <hr class="linebold" style="margin: 0" />
      <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
          <span>결제정보</span>
        </div>
        <div class="div-t2">
          <div class="div-left">
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">상품금액</dt>
              <dd class="dd-1 textsize-1 textcolor-black">25800원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">
                상품 할인금액
              </dt>
              <dd class="dd-2 textsize-1 textcolor-black">-3100원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">배송비</dt>
              <dd class="dd-2 textsize-1 textcolor-black">2500원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">적립금액</dt>
              <dd class="dd-2 textsize-1 textcolor-black">250원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">결제방법</dt>
              <dd class="dd-2 textsize-1 textcolor-black">신용카드</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">
                총 결제금액
              </dt>
              <dd class="dd-2 textsize-1 textcolor-black">24400원</dd>
            </dl>
          </div>
        </div>
      </div>

      <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
          <span>주문정보</span>
        </div>
        <div class="div-t2">
          <div class="div-left">
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">주문번호</dt>
              <dd class="dd-1 textsize-1 textcolor-black">20230811001</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">주문자명</dt>
              <dd class="dd-2 textsize-1 textcolor-black">강민지</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">결제일시</dt>
              <dd class="dd-2 textsize-1 textcolor-black">2023-08-11 14:00</dd>
            </dl>
          </div>
        </div>
      </div>

      <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
          <span>배송정보</span>
          <button
            class="btn-1 textcolor-white bg-lightgreen border-0 textsize-1"
            style="margin-left: auto"
            onclick="location.href='${contextPath}/mypage/deliveryInquiry.do'"
            type="button"
          >
            배송조회
          </button>
        </div>
        <div class="div-t2">
          <div class="div-left">
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">받는분</dt>
              <dd class="dd-1 textsize-1 textcolor-black">강민지</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">연락처</dt>
              <dd class="dd-2 textsize-1 textcolor-black">010-1234-5678</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">배송지</dt>
              <dd class="dd-2 textsize-1 textcolor-black">
                (35234) 대전광역시 서구 대덕대로 182 10층 1005호
              </dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">
                배송요청사항
              </dt>
              <dd class="dd-2 textsize-1 textcolor-black">문 앞에 놔주세요</dd>
            </dl>
          </div>
        </div>
      </div>

      <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
          <span>상품주문목록</span>
        </div>
        <div class="div-t2" style="margin: 5px 0px">
          <div class="div-left2">
            <img
              class="img-1"
              src="${contextPath}/img/product/main/carrot.jpg"
              alt="상품 이미지"
            />
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">못난이 당근</dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ￦1000 | 100g 2개
                </dt>
              </dl>
            </div>
          </div>
          <div class="div-right">
            <span class="span-1 textsize-1 textcolor-black">취소완료</span>
            <button
              class="btn-3 bg-lightgreen border-0 textsize-1 textbold textcolor-white"
              type="button"
              radius="3"
              onclick='fn_openalert("장바구니에 담았습니다.<br> 장바구니로 이동하시겠습니까?","${contextPath}/cart.do")'
            >
              <span>장바구니 담기</span>
            </button>
          </div>
        </div>

        <div class="div-t2" style="margin: 5px 0px">
          <div class="div-left2">
            <img
              class="img-1"
              src="${contextPath}/img/product/main/apple.jpg"
              alt="상품 이미지"
            />
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">못난이 사과</dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ￦1000 | 150g 2개
                </dt>
              </dl>
            </div>
          </div>
          <div class="div-right">
            <span class="span-1 textsize-1 textcolor-black">배송완료</span>
            <button
              class="btn-3 bg-lightgreen border-0 textsize-1 textbold textcolor-white"
              type="button"
              radius="3"
              onclick='fn_openalert("장바구니에 담았습니다.<br> 장바구니로 이동하시겠습니까?","${contextPath}/cart.do")'
            >
              <span>장바구니 담기</span>
            </button>
          </div>
        </div>
      </div>
      <hr class="linebold" style="margin: 0" />
    </form>
  </body>
</html>
