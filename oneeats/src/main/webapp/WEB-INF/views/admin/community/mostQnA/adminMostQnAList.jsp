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
    <title>자주하는 질문 목록</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        자주하는 질문
        <div style="float: right">
          <select>
            <option value="">카테고리</option>
            <option value="">결제</option>
            <option value="">주문</option>
            <option value="">배송</option>
          </select>
        </div>
      </div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="mostQnAList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">번호</div>
          <div class="col-md-2">카테고리</div>
          <div class="col-md">제목</div>
          <div class="col-md-1">수정</div>
          <div class="col-md-1">삭제</div>
        </div>
        <hr class="line-black" />
        <div class="row toggle-btn mostQnAList-title">
          <div class="col-md-2">121</div>
          <div class="col-md-2">주문</div>
          <div class="col-md">주문을 취소하고 싶어요</div>
          <div class="col-md-1">
            <a
              href="${contextPath}/admin/community/mostQnA/adminMostQnAModForm.do?qnaNo=121"
              >수정</a
            >
          </div>
          <div class="col-md-1">
            <a
              onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/community/mostQnA/deleteQnA.do?qnaNo=121')"
              >삭제</a
            >
          </div>
        </div>
        <div
          class="row toggle-content mostQnAList-content"
          style="margin-top: 12px"
        >
          <div
            class="col-md"
            style="padding: 12px; margin-left: 12px; margin-right: 12px"
          >
            <div class="bg-lightgray text-left" style="padding: 12px">
              마이페이지 -> 주문내역 관리 -> 주문 취소를 누르시면 됩니다.
              <br />환불에는 카드사의 사정에 따라 2~3일 정도 소요됩니다.
            </div>
          </div>
        </div>
        <hr class="line-gray" />
        <!--자주하는 질문 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty mostQnAList}">
            <c:forEach var="mostQnA" items="${mostQnAList}">
              <div class="row toggle-btn mostQnAList-title">
                <div class="col-md-2">${mostQnA.qnaNo}</div>
                <div class="col-md-2">${mostQnA.category}</div>
                <div class="col-md">${mostQnA.title}</div>
                <div class="col-md-1">
                  <a
                    href="${contextPath}/admin/community/mostQnA/adminMostQnAModForm.do?qnaNo=${mostQnA.qnaNo}"
                    >수정</a
                  >
                </div>
                <div class="col-md-1">
                  <a
                    onClick="fn_openalert('삭제하시겠습니까?','${contextPath}/admin/community/mostQnA/deleteQnA.do?qnaNo=${mostQnA.qnaNo}')"
                    >삭제</a
                  >
                </div>
              </div>
              <div
                class="row toggle-content mostQnAList-content"
                style="margin-top: 12px"
              >
                <div
                  class="col-md"
                  style="padding: 12px; margin-left: 12px; margin-right: 12px"
                >
                  <div class="bg-lightgray text-left" style="padding: 12px">
                    ${mostQnA.content}
                  </div>
                </div>
              </div>
              <hr class="line-gray" />
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
              onclick="location.href='${contextPath}/admin/community/mostQnA/adminMostQnAForm.do'"
            >
              작성
            </button>
          </div>
        </div>
      </div>

      <!--페이지 버튼-->
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
    </section>
  </body>
</html>
