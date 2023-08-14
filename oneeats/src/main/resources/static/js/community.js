$(document).ready(function () {
		var overlayDiv = $('<div class="overlay_gray"></div>');
  		$('body').append(overlayDiv);
        $(".hoverexpand").hover(
          function () {
            $(this).addClass("hovered");
            $('.overlay_gray').show();
          },
          function () {
            $(this).removeClass("hovered");
            $('.overlay_gray').hide();
          }
        );
      });