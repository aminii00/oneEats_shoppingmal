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
            margin-left:100px;
            margin-top: 10px;
        }
        select {
            height: 30px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            color: rgb(51, 51, 51);
            outline: none;
            box-sizing: border-box;
        }
        div.nice-select{
            height: 30px;
            width: 70px;
            font-size: 0.9em;
            text-align: center;
            line-height: 30px;
        }
        .list {
            width: 100%;
            text-align: center;
        }
        input {
            width: 250px;
            height: 30px;
            padding-left: 10;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            color: rgb(51, 51, 51);
            outline: none;
            box-sizing: border-box;
        }
        input::placeholder {
            font-size: 0.9em;
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
            text-align: left;
            padding: 12px;
            border-bottom: 1px solid #B3B3B3;
        }
        .ul-li {
            margin-top: 60px;
            list-style: none;
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
        }
        .li-btn {
            padding-left: 10px;
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
        }
        .div-btn2 {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            padding: 20px;
        }
    </style>
</head>
<body>
<form method="post" action="#">
    <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">주문취소</p>
    </div>
    <hr class="linebold" style="margin: 0;">
    <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
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
                <dd class="dd-2 textsize-1 textcolor-black">010-1234-5678</dd>
            </dl>
            </div>
        </div>
    </div>

    <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
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
                <dd class="dd-2 textsize-1 textcolor-black">0원</dd>
            </dl>
            <dl class="dl-dt">
                <dt class="dt-1 textsize-1 textbold textcolor-black">환불예상금액</dt>
                <dd class="dd-2 textsize-1 textcolor-black">24400원</dd>
            </dl>
            <dl class="dl-dt">
                <dt class="dt-1 textsize-1 textbold textcolor-black">환불수단</dt>
                <dd class="dd-2 textsize-1 textcolor-black">신용카드</dd>
            </dl>
            </div>
        </div>
    </div>
    
    <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
            <span>취소상품</span>
        </div>
        <div class="div-t2">
            <div class="div-left2" style="margin: 5px 0px;">
                <img class="img-1" src="${contextPath}/img/product/main/carrot.jpg" alt="상품 이미지">
                <div class="div-dl">
                <dl class="dl-dt">
                    <dt class="dt-2 textsize-1 textcolor-black">못난이 당근</dt>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-2 textsize-1 textcolor-black">￦1000 | 100g 2개</dt>
                </dl>
                </div>
            </div>
        </div>

        <div class="div-t2" style="margin: 5px 0px;">
            <div class="div-left2">
                <img class="img-1" src="${contextPath}/img/product/main/apple.jpg" alt="상품 이미지">
                <div class="div-dl">
                <dl class="dl-dt">
                    <dt class="dt-2 textsize-1 textcolor-black">못난이 사과</dt>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-2 textsize-1 textcolor-black">￦1000 | 150g 2개</dt>
                </dl>
                </div>
            </div>
        </div>
    </div>
    <hr class="linebold" style="margin: 0;">

    <div class="div-btn2">
        <button class="btn-3 btn-regular textcolor-white border-0 bg-lightgreen" 
        onclick='fn_openalert("주문을 취소하시겠습니까?","${contextPath}/mypage/orderList.do")' type=button>취소하기</button>
    </div>
</form>
</body>
</html>