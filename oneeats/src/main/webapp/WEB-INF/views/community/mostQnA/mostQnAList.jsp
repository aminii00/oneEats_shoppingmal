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
    <title>자주하는 질문 목록</title>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        자주하는 질문
      </div>
      <hr style="border: 0px; height: 2px; background-color: black" />
      <div class="mostQnAList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">번호</div>
          <div class="col-md-2">카테고리</div>
          <div class="col-md">제목</div>
        </div>
        <hr style="border: 0px; height: 2px; background-color: black" />
        <div class="row toggle-btn mostQnAList-title">
          <div class="col-md-2">121</div>
          <div class="col-md-2">주문</div>
          <div class="col-md">주문을 취소하고 싶어요</div>
        </div>
        <div class="row toggle-content mostQnAList-content">
          <div class="col-md bg-lightgray">
            마이페이지 -> 주문내역 관리 -> 주문 취소를 누르시면 됩니다.
            <br />환불에는 카드사의 사정에 따라 2~3일 정도 소요됩니다.
          </div>
        </div>
        <hr style="border: 0px; height: 2px; background-color: gray" />
      </div>
      <hr style="border: 0px; height: 2px; background-color: black" />
      <div>&nbsp;</div>
    </section>
  </body>
</html>
