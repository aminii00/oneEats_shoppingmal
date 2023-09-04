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
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
   
  </head>
  <body>
    <form method="post" action="${contextPath}/mypage/couponNum.do">
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
              placeholder="쿠폰 번호를 입력해주세요."
              type="text"
              name="couponCode"
            />
            <button
              type="submit"
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
              &nbsp&nbsp${item.name}
            </td>
            <td style="width: 170px">쿠폰</td>
            <td>${item.discount_price}</td>
            <td>${item.expDate}</td>
            <td>${item.condition}</td>
          </tr>
          </c:forEach>
        </table>
        <br />
        <br />
        <br />
        <div>
          <ul class="ul-li">
            <c:if test="${section>1}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section-1}&pageNum=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/prev.png"
                    alt="prev"
                  />
                </a>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalCouponListNum - (section-1)*100) div 10)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section}&pageNum=${i}"
                  class="btn-2 btn-square bg-white btn-border"
                  >${((section-1)*10)+i}</a
                >
              </li>
            </c:forEach>
            <c:if test="${section*100 < totalCouponListNum}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section+1}&pageNum=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/next.png"
                    alt="next"
                  />
                </a>
              </li>
            </c:if>
          </ul>
        </div>
      </form>
    </section>
        <br />
        <br />
        <section>
          <form>
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
            <td style="width: 200px; text-align: left">&nbsp&nbsp내용</td>
            <td style="width: 170px">날짜</td>
            <td>유효기간</td>
            <td>금액</td>
          </tr>
          <c:forEach var="item" items="${pointDetail}" varStatus="status">
          <tr class="coupontr">
            <td style="width: 200px; text-align: left">
              &nbsp&nbsp${item.name}
            </td>
            <td style="width: 170px">${item.creDate}</td>
            <td>${item.finishDate}</td>
            <td>${item.amount}point</td>
          </tr>
        </c:forEach>
       
        </table>
        <br />
        <br />
        <br />
        <div>
          <ul class="ul-li">
            <c:if test="${section1>1}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1-1}&pageNum1=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/prev.png"
                    alt="prev"
                  />
                </a>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalPointListNum - (section1-1)*100) div 10)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1}&pageNum1=${i}"
                  class="btn-2 btn-square bg-white btn-border"
                  >${((section1-1)*10)+i}</a>
              </li>
            </c:forEach>
            <c:if test="${section*100<totalPointListNum}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1+1}&pageNum1=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/next.png"
                    alt="next"
                  />
                </a>
              </li>
            </c:if>
          </ul>
        </div>
        <br><br>
        <br>
    </form>
    </section>
  </body>
</html>