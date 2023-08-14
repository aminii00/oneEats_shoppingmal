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
            width: 50px;
            line-height: 1.58;
            margin-right: 10px;
            text-align: left;
        }
        .dd-1 {
            flex: 1 1 0%;
            line-height: 1.36;
            display: -webkit-box;
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
            border-radius: 3px;
        }
    </style>
</head>
<body>
<form method="post" action="#">
    <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">주문내역</p>
        <div class="div-sib textsize-1">
        <select name="search-1">
            <option value="전체">전체</option>
            <option value="1개월">1개월</option>
            <option value="3개월">3개월</option>
            <option value="1년">1년</option>
        </select>
        <input type="text" name="search-2" placeholder="search..">
        <button class="btn-1 bg-lightgreen textcolor-white border-0" type="submit">검색</button>
        </div>
    </div>
    <hr class="linebold" style="margin: 0;">
    <div class="div-tot">
        <div class="div-span textbold textcolor-black textsize-1">
            <span>2023.08.11</span>
            <a style="float: right;" href="${contextPath}/mypage/orderDetail.do">주문내역 상세보기</a>
        </div>
        <div class="div-t2" style="border-Bottom: 1px solid #B3B3B3">
            <div class="div-left">
                <img class="img-1" src="${contextPath}/img/product/details/product-details-1.jpg" alt="상품 이미지">
                <div class="div-dl">
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">상품명</dt>
                    <dd class="dd-1 textsize-1 textcolor-black">밀키트 외 9건</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">주문번호</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">20230811002</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">결제방법</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">신용카드</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">결제금액</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">25000원</dd>
                </dl>
                </div>
            </div>
            <div class="div-right">
                <span class="span-1 textsize-1 textcolor-black">취소완료</span>
                <button class="btn-3 btn-small bg-lightgreen border-0 textsize-1 textcolor-white" type="button" height="36" radius="3"
                onclick="location.href='${contextPath}/mypage/orderCancel.do'">
                <span>취소하기</span>
                </button>
            </div> 
        </div>
            
        <div class="div-t2">
            <div class="div-left">
                <img class="img-1" src="${contextPath}/img/product/details/product-details-2.jpg" alt="상품 이미지">
                <div class="div-dl">
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">상품명</dt>
                    <dd class="dd-1 textsize-1 textcolor-black">못난이 브로콜리 외 6건</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">주문번호</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">20230809001</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">결제방법</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">신용카드</dd>
                </dl>
                <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">결제금액</dt>
                    <dd class="dd-2 textsize-1 textcolor-black">25000원</dd>
                </dl>
                </div>
            </div>
            <div class="div-right">
                <span class="span-1 textsize-1 textcolor-black">배송완료</span>
                <button class="btn-3 btn-small bg-lightgreen border-0 textsize-1 textcolor-white" type="button" height="36" radius="3"
                onclick="location.href='${contextPath}/mypage/orderCancel.do'">
                <span>취소하기</span>
                </button>
            </div> 
        </div>
    </div>
    <hr class="linebold" style="margin: 0;">
<%-- <!--    <div> 페이징처리
        <c:if test="${totArticles != null}"
            <c:choose>
            <c:when test="${totArticles > 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <c:if test="${section > 1 && page == 1}">
                    <a href="#">&nbsp:prev</a>
                    </c:if>
                    <a href="#"></a>
                    <c:if test="${page == 10}">
                    <a href="#">&nbsp:next</a>
                    </c:if>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles == 100}">
                <c:foreach var="page" begin="1" end="10" step="1">
                    <a href="#">${page}</a>
                </c:foreach>
            </c:when>
            <c:when test="${totArticles < 100}">
                <c:foreach var="page" begin="1" end="${totArticles/10+1}" step="1">
                <c:choose>
                    <c:when test="${page == pageNum}">
                    <a href="#">${page}</a>
                    </c:when>
                    <c:otherwise>
                    <a href="#">${page}</a>
                    </c:otherwise>
                </c:choose>
                </c:foreach>
            </c:when>
            </c:choose>
        </c:if>
        </div> 
--> --%>
    <div>
    <ul class="ul-li">
        <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
            <img width="20px" height="20px" src="${contextPath}/img/icon/prev.png" alt="prev">
            </button>
        </li>
        <li class="li-btn"> 
            <button class="btn-2 btn-square bg-white btn-border">1</button>
        </li>
        <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
            <img width="20px" height="20px" src="${contextPath}/img/icon/next.png" alt="next">
            </button>
        </li>
    </ul>
    </div>
</form>
</body>
</html>