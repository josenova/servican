

$(document).ready(function(){

/******************************************** WINDOW SCROLL ****************************************/

	$(window).scroll(function () {

		if ($(this).scrollTop() > 100) {

			$("#header").addClass("solid");
			$("#slogan h2").fadeOut(200);
			

		} 
		
		else {

			$("#header").removeClass("solid");
			$("#slogan h2").fadeIn(200);

		}

   });


/******************************************** SMOOTH SCROLLING *****************************************/  
   
   
   $('a[href*="#"]').on('click', function(event) {
    
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 400);
        return false;
      }
    }
});
   
/******************************************** PANEL RESIZE *****************************************/   
   
   //divResize();	


/******************************************** LOC NAVIGATION *****************************************/  
   
    $( "#label_naco" ).click(function() {
      $("#map_container").css("marginLeft", 0);
      $("#arroyohondo .box").hide();
      $("#naco .box").show();
   });
   
   $( "#label_arroyo_hondo" ).click(function() {
      $("#map_container").css("marginLeft", -1139);
      $("#naco .box").hide();
      $("#arroyohondo .box").show();
   });
   
/******************************************** END DOC READY *****************************************/  
   
}); // END DOCUMENT READY









/****************************************** RESIZE FUNCTION *******************************************/

/*

	function divResize() {
	  $('#slogan').css('min-height', $(window).height());
	}
	
	$(window).bind('resize', function () { 
    	setTimeout(function(){
      		divResize();
		},150);	
	});
                

*/