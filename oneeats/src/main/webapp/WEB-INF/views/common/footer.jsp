<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>하단 부분</title>
  </head>
  <body>
    <!-- Footer Section Begin -->
    <footer class="footer spad">
      <div class="container-xl">
        <div class="row justify-content-md-center">
          <div class="col-lg-4">
            <div class="footer__about">
              <div class="footer__about__logo">
                <a href="#"
                  ><img
                    src="${contextPath}/img/logo.png"
                    alt=""
                    style="filter: grayscale(100%)"
                /></a>
              </div>
              <div class="textcolor-black text-left">
                <p>
                  원이츠는 농가와 1인가구의 상생을 추구합니다. <br />
                  친환경 농산물과 사이즈 맞춤 선택 밀키트로 <br />
                  건강과 환경을 지켜보세요!
                </p>
                <br />
                <p>since 2023.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 text-left">
            <p class="textsize-3 textbold">오시는 길</p>
            <p class="textsize-1 textcolor-black">
              주소: 대전광역시 서구 대덕대로 182, 오라클빌딩 10층
            </p>
            <img src="${contextPath}/img/banner/map.png" alt="" width="100%" />
          </div>
          <div class="col-lg-4 text-left">
            <p class="textsize-3 textbold">고객센터</p>
            <p class="textsize-1 textcolor-black">
              운영시간: 평일 오전 9시-오후 6시 (주말, 공휴일 휴무)
            </p>
            <p class="textsize-1 textcolor-gray">
              법인명 : 원이츠 | 사업자 등록 번호: 123-45-67890 <br />
              통신판매업: 제 2023-대전서구-12345호 <br />
              팩스: 070-1234-5678
            </p>

            <p>&nbsp;</p>
            <div class="row">
              <a href="">
                <img src="${contextPath}/img/icon/facebook.png" alt="" />
              </a>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->
  </body>
</html>
