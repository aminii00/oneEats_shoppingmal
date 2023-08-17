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
                <span class="textsize-3 text-left textbold" >리뷰작성</span>
                <hr class ="line-black">
                <br>
            </div>
            <div class="profile-edit-main" >
                <div class="profile-edit-img-div" style="padding: 0 0 0 110px ">
                    
                    <c:choose>
				<c:when test="${user.profile_photo == null}">
					<img src= "${contextPath}/img/icon/profile.png" class="brd-lightgray btn-round imgsize-square2" style="width:130px; height:130px; " >
				</c:when>
				<c:otherwise>
					<img src="${contextPath}/img/profilenull.png" class="brd-lightgray btn-round imgsize-square2">
				</c:otherwise>
			</c:choose>
        </div>
                


        <div class="profile-edit-content" style="text-align: center;  padding : 15px 90px 0 0;" >
                <p class = "textsize-3 textbold" >사용자 id</p>
                <p class = "textsize-1 ">n인분 * n개</p>
                <img src= "${contextPath}/img/product/review/star.jpg" style="width: 100px; height: 25px;">
                
        </div>
            </div>
            <br><br><br>
            <p class ="textsize-3 textbold" style="text-align: left;" >사진을 올려주세요.(선택)</p>
            <img src= "${contextPath}/img/product/review/noImage.jpg" class="brd-lightgray btn-round imgsize-square2" style="width:110px; height:100px; " >
            <br>
            <p class="textsize-1" style="text-align: left;">상품과 무관한 사진을 첨부하면 노출 제한 처리될 수 있습니다.
                사진첨부 시 개인정보가 노출되지 않도록 유의해주세요.</p>
                <br>
                <p class ="textsize-3 textbold" style="text-align: left;" >상세한 후기를 써주세요.</p>
                <textarea style="width: 530px; height: 400px;" class =" brd-lightgray btn-round textsize-2" name="review" id="introduce" cols="30" rows="5"></textarea>
                <br><br><br>
                <div style="text-align: center;">
            <button type="reset" class="btn-midlong_2 textsize-1 textbold input btn-round border-0">취소</button>
            <button type="submit" class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0">저장</button>
            </div>
        </div>
    </div>
</body>
</html>