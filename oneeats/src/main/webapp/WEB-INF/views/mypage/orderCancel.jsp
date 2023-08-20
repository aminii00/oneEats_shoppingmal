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
    <title>주문취소</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- 주문취소 -->
    <form method="post" action="#">
      <div class="div-p">
        <p
          class="p-1 textsize-2 text-left textcolor-black textbold"
        >
          주문취소
        </p>
      </div>

      <hr class="linebold" style="margin: 0" />

      <!-- 구매자정보 -->
      <div class="div-tot">
        <div class="div-t1 textbold textcolor-black textsize-1">
          <span>구매자정보</span>
        </div>
        <div class="div-t2">
          <div class="div-left">
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">이름</dt>
              <dd class="dd-1 textsize-1 textcolor-black">강민지</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">연락처</dt>
              <dd class="dd-1 textsize-1 textcolor-black">010-1234-5678</dd>
            </dl>
          </div>
        </div>
      </div>

      <!-- 환불정보 -->
      <div class="div-tot">
        <div class="div-t1 textbold textcolor-black textsize-1">
          <span>환불정보</span>
        </div>
        <div class="div-t2">
          <div class="div-left">
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">결제금액</dt>
              <dd class="dd-1 textsize-1 textcolor-black">24400원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">반품비</dt>
              <dd class="dd-1 textsize-1 textcolor-black">0원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">
                환불예상금액
              </dt>
              <dd class="dd-1 textsize-1 textcolor-black">24400원</dd>
            </dl>
            <dl class="dl-dt">
              <dt class="dt-1 textsize-1 textbold textcolor-black">환불수단</dt>
              <dd class="dd-1 textsize-1 textcolor-black">신용카드</dd>
            </dl>
          </div>
        </div>
      </div>

      <!-- 취소상품 -->
      <div class="div-tot">
        <div class="div-t1 textbold textcolor-black textsize-1">
          <span>취소상품</span>
        </div>
        <div class="div-t2">
          <div class="div-left2" style="margin: 5px 0px">
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
        </div>
      </div>
      
      <hr class="linebold" style="margin: 0" />

      <!-- 주문취소버튼 -->
      <div class="div-btn">
        <button
          class="btn-4 btn-regular textcolor-white border-0 bg-lightgreen"
          onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/mypage/orderList.do")'
          type="button"
        >
          취소하기
        </button>
      </div>
    </form>
  </body>
</html>
