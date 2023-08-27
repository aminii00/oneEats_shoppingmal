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
            ${notice.title}
          </div>
        </div>
        <hr class="line-black" />
        <div class="row noticeDetail_info">
          <div class="col textcolor-black text-left textsize-2">
            <span>카테고리: ${notice.category}</span>
            &nbsp;
            <span>작성일: ${notice.creDate}</span>
          </div>
        </div>
        <hr class="line-gray" />
        <div class="row noticeDetail_content">
          <div class="col textcolor-black text-left textsize-2">
            ${notice.content}
          </div>
        </div>
        <hr class="line-black" />

        <div class="row">
          <div class="col noticeDetail_prevNotice">
            <div class="textcolor-black text-left textsize-2">
              <a
                href="${contextPath}/community/notice/noticeDetail.do?noticeNo=${noticeBefore.noticeNo}"
                >이전 공지사항 | ${noticeBefore.title}</a
              >
            </div>
          </div>
        </div>
        <hr class="line-black" />
        <div class="row">
          <div class="col noticeDetail_nextNotice">
            <div class="textcolor-black text-left textsize-2">
              <a
                href="${contextPath}/community/notice/noticeDetail.do?noticeNo=${noticeAfter.noticeNo}"
              >
                다음 공지사항 | ${noticeAfter.title}</a
              >
            </div>
          </div>
        </div>

        <hr class="line-black" />
      </div>
      <div style="float: right">
        <button
          class="btn-tolist"
          onclick="location.href='${contextPath}/community/notice/noticeList.do'"
        >
          목록으로
        </button>
      </div>
    </section>
  </body>
</html>
