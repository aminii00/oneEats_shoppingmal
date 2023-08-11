<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>사이드바</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 textcolor-black border">
          <div
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
              margin-top: 12px;
              margin-left: 4px;
            "
          >
            <span class="textsize-3 textbold">&nbsp;&nbsp;관리자 메뉴</span>
          </div>
          <ul class="ul_menus" style="margin-left: 16px">
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">공지사항</a>
                  <img
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>

            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">자주하는 질문</a>
                  <img
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="">1:1문의 </a>
                  <img
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>
          </ul>

          <div
            style="
              width: 90%;
              height: auto;
              margin-left: auto;
              margin-right: auto;
              margin-top: 24px;
              margin-bottom: 16px;
              padding: 12px;
            "
            class="bg-lightgray text-left textcolor-black"
            onclick="location.href='#';"
          >
            <span class="textsize-1 textbold">빠른 답변을 원하신다면?</span>
            <br />
            <span class="textsize-1">챗봇 상담하기 → </span>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
