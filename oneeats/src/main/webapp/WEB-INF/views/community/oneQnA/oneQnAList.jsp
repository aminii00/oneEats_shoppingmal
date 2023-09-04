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
    <script></script>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">1:1문의</div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="oneQnAList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md">번호</div>
          <div class="col-md">제목</div>
          <div class="col-md-3">작성일</div>
          <div class="col-md-3">답변상태</div>
        </div>

        <!--1:1문의 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty oneQnAList}">
            <c:forEach var="oneQnA" items="${oneQnAList}">
              <hr class="line-gray" />
              <div
                class="row oneQnAList-title"
                onclick="location.href='${contextPath}/community/oneQnA/oneQnADetail.do?qnaNo=${oneQnA.qnaNo}';"
              >
                <div class="col-md">${oneQnA.qnaNo}</div>
                <div class="col-md">${oneQnA.title}</div>
                <div class="col-md-3">${oneQnA.creDate}</div>
                <div class="col-md-3">${oneQnA.status}</div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--작성 버튼-->
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

      <!--페이지 버튼-->
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/oneQnA/oneQnAList.do?section=${section-1}&pageNum=1"
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
            value="${Math.ceil((totalOneQnAQnANum - (section-1)*100) div 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/community/oneQnA/oneQnAList.do?section=${section}&pageNum=${i}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalOneQnAQnANum}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/oneQnA/oneQnAList.do?section=${section+1}&pageNum=1"
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
    </section>
  </body>
</html>
