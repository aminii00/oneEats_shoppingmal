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
        a {
            text-decoration: none;
            color: #2C3333;
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
        .css-4wlxei {
            width: 100%;
            padding: 16px 20px;
            margin-bottom: 14px;
        }
        .css-1hbtwy0 {
            display: flex;
            padding: 8px 0px 13px;
            -webkit-box-pack: justify;
            justify-content: space-between;
            border-bottom: 1px solid rgb(221, 223, 225);
        }
        .css-asma03 {
            font-size: 16px;
            font-weight: 500;
            line-height: 1.31;
            color: rgb(51, 51, 51);
        }
        .css-l9y4tx {
            align-self: center;
            padding-right: 10px;
            line-height: 1.33;
            font-size: 12px;
            color: rgb(51, 51, 51);
            background: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMCIgaGVpZ2h0PSIxMCIgdmlld0JveD0iMCAwIDEwIDEwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBzdHJva2UtbGluZWpvaW49InJvdW5kIj4KICAgICAgICA8ZyBzdHJva2U9IiMzMzMiPgogICAgICAgICAgPHBhdGggZD0iTTAgMEw0IDQgMCA4IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMTIxNS4wMDAwMDAsIC02OTkuMDAwMDAwKSB0cmFuc2xhdGUoMTk1LjAwMDAwMCwgNTczLjAwMDAwMCkgdHJhbnNsYXRlKDIzMC4wMDAwMDAsIDk2LjAwMDAwMCkgdHJhbnNsYXRlKDIwLjAwMDAwMCwgMTYuMDAwMDAwKSB0cmFuc2xhdGUoNjMwLjAwMDAwMCwgMTAuMDAwMDAwKSB0cmFuc2xhdGUoMTQ0LjAwMDAwMCwgNS4wMDAwMDApIi8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K) right center / 10px 10px no-repeat;
            cursor: pointer;
        }
        .css-7apail {
            display: flex;
            flex-direction: row;
            -webkit-box-pack: justify;
            justify-content: space-between;
            padding: 14px 0px 16px;
        }
        .css-fhxb3m {
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
        }
        .css-1oc1pau {
            width: 60px;
            height: 78px;
            margin-right: 20px;
            background-color: rgb(245, 245, 245);
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
        .css-1ccl3pq {
            display: flex;
            padding-top: 6px;
            flex-direction: row;
            color: rgb(0, 0, 0);
            line-height: 20px;
        }
        .css-dzjp62 {
            width: 50px;
            line-height: 1.58;
            margin-right: 10px;
            font-size: 12px;
            color: rgb(51, 51, 51);
        }
        .css-1o8e829 {
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
        .css-1i58pf4 {
            flex: 1 1 0%;
            font-weight: 500;
            color: rgb(51, 51, 51);
            line-height: 1.36;
        }
        .css-s5xdrg {
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
        }
        .css-bx0kqw {
            width: 1px;
            height: 1px;
        }
    </style>
    </head>
    <body>
    <form method="post" action="#">
 <%-- <!--       <div class="div-p">
        <p class="textsize-2 text-left textcolor-black textbold">주문내역</p>
        <select name="search-1">
            <option value="전체">전체</option>
            <option value="주문번호">주문번호</option>
            <option value="주문자명">주문자명</option>
            <option value="아이디">아이디</option>
        </select>
        <input type="text name="search-2" placeholder="search.."">
        <button class="btn-small bg-lightgreen textcolor-white border-0" type="submit">검색</button>
        </div>
        <hr class="linebold">
        <table border="0" class="textcolor-black textsize-1">
            <tr class="tr-1">
                <th>2023.08.11</th>
                <button></button>
            </tr>
            <tr>
                <td>상풍명</td>
                <td>밀키트 외 9건</td>
            </tr>
        </table>
--> --%>
        <div class="css-4wlxei e1437c6414">
            <div class="css-1hbtwy0 e1437c6413">
                <span class="css-asma03 e1437c6412">2023.08.11</span>
                <a class="css-l9y4tx e1437c6411">주문내역 상세보기</a>
            </div>
            <hr class="linebold">
            <div class="css-7apail e1437c6410">
                <div class="css-fhxb3m e1437c649">
                    <img src="https://img-cf.kurly.com/shop/data/goods/1596778215374l0.jpg" alt="아오리 사과 1.5kg(10입내) 상품 이미지" class="css-1oc1pau e1437c648">
                    <div class="css-1fttcpj e1437c647">
                        <dl class="css-1ccl3pq e1437c646">
                            <dt class="css-dzjp62 e1437c645">상품명</dt>
                            <dd class="css-1o8e829 e1437c643">아오리 사과 1.5kg(10입내) 외 1건</dd>
                        </dl>
                        <dl class="css-1ccl3pq e1437c646">
                            <dt class="css-dzjp62 e1437c645">주문번호</dt>
                            <dd class="css-1i58pf4 e1437c644">2314123330040</dd>
                        </dl>
                        <dl class="css-1ccl3pq e1437c646">
                            <dt class="css-dzjp62 e1437c645">결제방법</dt>
                            <dd class="css-1i58pf4 e1437c644">카카오페이</dd>
                        </dl>
                        <dl class="css-1ccl3pq e1437c646">
                            <dt class="css-dzjp62 e1437c645">결제금액</dt>
                            <dd class="css-1i58pf4 e1437c644">13,790원</dd>
                        </dl>
                    </div>
                </div>
                <div class="css-s5xdrg e1437c642">
                    <span class="css-1fdt947 e1437c641">배송완료</span>
                    <div class="css-1bbz142 e1437c640">
                        <button class="css-oyz24n e4nu7ef3" type="button" height="36" radius="3">
                            <span class="css-nytqmg e4nu7ef1">1:1 문의</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <hr class="linebold">
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