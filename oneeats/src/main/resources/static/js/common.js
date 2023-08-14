$(document).ready(function() {

  $('.modal-overlay').click(function(e) {
    if ($(e.target).hasClass('modal-overlay')) {
      closeModal();
    }
  });
  
  $('.toggle-content').hide();
  $('.toggle-btn').click(function(){
	$(this).parent().find('.toggle-content').slideToggle();	
	});
});

function closeModal() {
  $('.modal-overlay').fadeOut(300);
  $('.modal-content').fadeOut(300);
}


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


      