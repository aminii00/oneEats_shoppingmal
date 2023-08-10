<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%>
<style>
  .modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    display: none;

    background-color: rgba(0, 0, 0, 0.4);
  }
</style>
<div id="alert_window" class="btn-round border-dark bg-white text-center">
  <div>
    <p id="alert_message">알림메시지</p>
  </div>
  <div class="btn-group">
    <button class="btn-second">취소</button>
    <button class="btn-primary">확인</button>
  </div>
</div>
