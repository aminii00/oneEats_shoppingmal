<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>1:1문의 내역</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">1:1문의</div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="oneQnAList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md">제목</div>
          <div class="col-md-3">작성일</div>
          <div class="col-md-3">답변상태</div>
        </div>
        <hr class="line-black" />
        <div
          class="row oneQnAList-title"
          onclick="location.href='${contextPath}/community/oneQnA/oneQnADetail.do';"
        >
          <div class="col-md">배송조회가 되지 않습니다..</div>
          <div class="col-md-3">2023/08/11</div>
          <div class="col-md-3">대기중</div>
        </div>
        <hr class="line-gray" />
        <div
          class="row oneQnAList-title"
          onclick="location.href='${contextPath}/community/oneQnA/oneQnADetail.do';"
        >
          <div class="col-md">배송조회가 되지 않습니다..</div>
          <div class="col-md-3">2023/08/11</div>
          <div class="col-md-3">대기중</div>
        </div>
        <hr class="line-gray" />
        <div
          class="row oneQnAList-title"
          onclick="location.href='${contextPath}/community/oneQnA/oneQnADetail.do';"
        >
          <div class="col-md">배송조회가 되지 않습니다..</div>
          <div class="col-md-3">2023/08/11</div>
          <div class="col-md-3">대기중</div>
        </div>
        <!--1:1문의 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty oneQnAList}">
            <c:forEach var="oneQnA" items="${oneQnAList}">
              <hr class="line-gray" />
              <div class="row oneQnAList-title">
                <div class="col-md">${oneQnA.title}</div>
                <div class="col-md-3">${oneQnA.creaDate}</div>
                <div class="col-md-3">${oneQnA.status}</div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <div>
        <ul class="ul-li">
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">1</button>
          </li>
          <li class="li-btn">
            <button class="btn-2 btn-square bg-white btn-border">
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </button>
          </li>
        </ul>
      </div>

      <br />
      <div class="row">
        <div class="col">
          <div style="float: right">
            <button
              class="btn-toform"
              onclick="location.href='${contextPath}/community/oneQnA/oneQnAForm.do'"
            >
              문의작성
            </button>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
