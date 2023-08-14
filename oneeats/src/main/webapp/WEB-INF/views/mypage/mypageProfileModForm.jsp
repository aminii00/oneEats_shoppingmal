<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      isELIgnored="false"%>       
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "contextPath" value= "${pageContext.request.contextPath}" />
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">
<title>프로필 편집</title>
<style>



</style>

</head>
<body>
    <div class="content-area">
        <div class="profile-edit-box">
            <div class="profile-edit-header">
                <h4>프로필 편집</h4>
                <p class="align-right-header-font">프로필 사진을 클릭해서 사진을 변경할 수 있습니다.</p>
                <hr>
                <br>
            </div>
            <div class="profile-edit-main ">
                <div class="profile-edit-img-div ">
                    
                    <c:choose>
				<c:when test="${user.profile_photo == null}">
					<img src= "${contextPath}/img/icon/profile.png" class="brd-lightgray btn-round imgsize-square2">
				</c:when>
				<c:otherwise>
					<img src="${contextPath}/img/profilenull.png" class="brd-lightgray btn-round imgsize-square2">
				</c:otherwise>
			</c:choose>
        </div>
                
                <div class="profile-edit-content">
                    <form class="profile-edit-form" action="#" method="post">
                        <input type="hidden" value="#" name="id">
                        <br>
                        <p>
                            <label>닉네임 또는 별명</label><br>
                            <input type="text" name="nick"  class ="btn-round ">
                        </p>
                        <p>
                            <label>소개</label><br>
                            <textarea  class ="profileintroduce brd-lightgreen btn-round textsize-0" name="introduce" id="introduce" cols="30" rows="5"></textarea>
                        </p>
                        <br>
                        <p>
                            <button type="reset" class="btn-midlong_2 textsize-1 textbold input btn-round border-0">취소</button>
                            <button type="submit" class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0">저장</button>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>