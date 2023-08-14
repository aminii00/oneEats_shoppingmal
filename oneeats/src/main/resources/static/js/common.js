$(document).ready(function() {

  $('.modal-overlay').click(function(e) {
    if ($(e.target).hasClass('modal-overlay')) {
      closeModal();
    }
  });
  
  
  // 메뉴를 토글하기 위한 코드
  // .toggle-btn을 클릭하면 그것의 형제 요소인 .toggle-content가 나타나거나 사라짐.
  $('.toggle-content').hide();
  $('.toggle-btn').click(function(){
	$(this).parent().find('.toggle-content').slideToggle();	
	});
	
	
	// 이미지 클릭했을 때 확대하기 위한 js 코드
	// overlay_gray 클래스인 요소를 문서에 추가해둔 후 expand_img 클래스가 붙은 이미지를 클릭했을 때 표시되도록 함.
	var overlayDiv = $('<div class="overlay_gray"></div>');
	$('body').append(overlayDiv);
	
	$('.expand_img').click(
		function(){
			if($(this).hasClass('clicked')){
				$(this).removeClass('clicked');
				$('.overlay_gray').hide();
			}else{
				$('.overlay_gray').show();
				$(this).addClass('clicked');	
			}
						
		}
	);
});

function closeModal() {
  $('.modal-overlay').fadeOut(300);
  $('.modal-content').fadeOut(300);
}


// 알림창을 표시하는 코드.
// msg에 알림창에 나타낼 메시지, 알림창에서 확인을 눌렀을 때 이동할 페이지를 url에 씀.
// 만약 fun에 함수를 넣으면 알림창에서 확인을 눌렀을 때 fun(url) 이 실행됨.
// 사용예시 : <button onclick='fn_openalert("테스트 알림창 입니다.<br>여기에 메시지를 넣어주세요.","${contextPath}/home.do")' type=button >알림창 띄우기</button>
function fn_openalert(msg,url,fun) {
		console.log("fn_openalert 실행 "+msg+" "+url+" "+fun);
        $("#alert_message").html(msg);
        $('.modal-overlay').fadeIn(300);
        $('.modal-content').fadeIn(300);
 		
        if(fun===undefined){
			$('#confirm-button').removeAttr("onclick");
			$('#confirm-button').attr("onclick","location.href='"+url+"';");
		}else{
			 $('#confirm-button').on('click', function() {
      			fun(url);
    		});
		}
         
}

function fn_show(num){
	$(".hidden_content_"+num).slideToggle();
}


      