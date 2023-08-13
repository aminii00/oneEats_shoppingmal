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
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">공지사항</div>
      <hr class="line-black" />
      <div class="noticeDetail_grid">
        <div class="row noticeDetail_title">
          <div class="col textcolor-black textbold text-left textsize-3">
            결제실패오류 공지
          </div>
        </div>
        <hr class="line-black" />
        <div class="row noticeDetail_info">
          <div class="col textcolor-black text-left textsize-2">
            <span>카테고리: 결제</span>
            &nbsp;
            <span>작성일: 2023년 8월 11일</span>
          </div>
        </div>
        <hr class="line-gray" />
        <div class="row noticeDetail_content">
          <div class="col textcolor-black text-left textsize-2">
            8월 1일 18시경 서버 오류로 결제가 실패하는 오류가 발생했습니다.
            <br />
            현재는 정상화 되었습니다. <br />
            고객님들께 불편을 드려 죄송합니다.
          </div>
        </div>
        <hr class="line-black" />

        <div class="row">
          <div class="col noticeDetail_prevNotice">
            <div class="textcolor-black text-left textsize-2">
              <a href="">이전 공지사항 | 신규 회원가입 이벤트</a>
            </div>
          </div>
        </div>
        <hr class="line-black" />
        <div class="row">
          <div class="col noticeDetail_nextNotice">
            <div class="textcolor-black text-left textsize-2">
              <a href="">다음 공지사항 | 포인트백 이벤트(~9/14)</a>
            </div>
          </div>
        </div>

        <hr class="line-black" />
      </div>
      <div style="float: right">
        <button
          class="btn-tolist"
          href="${contextPath}/community/notice/noticeList.do"
        >
          목록으로
        </button>
      </div>
    </section>
  </body>
</html>
