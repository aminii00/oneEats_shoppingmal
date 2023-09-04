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
    <title>회원 목록</title>

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <form action="">
        <div class="row vertical-align">
          <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
            회원
          </div>
          <div class="col-md"></div>

          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="filter_type">
              <option value="id">아이디</option>
              <option value="nickname">닉네임</option>
              <option value="name">이름</option>
              <option value="email">이메일</option>
              <option value="type">분류</option>
              <option value="creDate">가입일</option>
              <option value="email_agreement">이메일수신동의</option>
            </select>
          </div>
          <div class="col-md-4 p-0">
            <div class="input-group">
              <input type="text" name="filter_word" class="form-control" />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen textcolor-white border-0 textsize-2"
                  style="width: 60px"
                  type="submit"
                >
                  검색
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>
      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="memberList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">번호</div>
          <div class="col-md-2">아이디</div>
          <div class="col-md-2">닉네임</div>
          <div class="col-md-2">이름</div>
          <div class="col-md-2">분류</div>
          <div class="col-md-2">가입일</div>
        </div>
        <hr class="line-black" />
        <div
          class="row memberList-title"
          onclick="location.href='${contextPath}/admin/member/adminMemberDetail.do?memberNo=1'"
        >
          <div class="col-md-2">1</div>
          <div class="col-md-2">qwer</div>
          <div class="col-md-2">예징</div>
          <div class="col-md-2">한예지</div>
          <div class="col-md-2">일반</div>
          <div class="col-md-2">2023/08/02</div>
        </div>
        <hr class="line-gray" />
        <div class="row memberList-title">
          <div class="col-md-2">2</div>
          <div class="col-md-2">asdf</div>
          <div class="col-md-2">강씨</div>
          <div class="col-md-2">강태공</div>
          <div class="col-md-2">사업자</div>
          <div class="col-md-2">2023/07/12</div>
        </div>
        <hr class="line-gray" />

        <!--회원 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty memberList}">
            <c:forEach var="member" items="${memberList}">
              <hr class="line-gray" />
              <div
                class="row memberList-title"
                onclick="location.href='${contextPath}/admin/member/adminMemberDetail.do?memberNo=${member.memberNo}'"
              >
                <div class="col-md-2">${member.memberNo}</div>
                <div class="col-md-2">${member.id}</div>
                <div class="col-md-2">${member.nickname}</div>
                <div class="col-md-2">${member.name}</div>
                <div class="col-md-2">${member.type}</div>
                <div class="col-md-2">${member.creDate}</div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

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
